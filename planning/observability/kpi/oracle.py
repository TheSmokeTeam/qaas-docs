"""SQL oracle, independent of read-model implementation, plus hand-derived checks."""
import itertools
import json
import math
from pathlib import Path
import re
import sqlite3

HERE=Path(__file__).resolve().parent
QUERY="""
WITH w AS (
 SELECT unixepoch(:cutoff)-:days*86400 lo,unixepoch(:cutoff) hi
), p AS (
 SELECT * FROM roster,w WHERE unixepoch(eligible_from)<=hi
 AND (ineligible_at IS NULL OR unixepoch(ineligible_at)>hi)
 AND (:team='all' OR team=:team) AND (:env='all' OR environment=:env)
), terminal AS (
 SELECT t.* FROM arrivals t JOIN p USING(project) WHERE
 unixepoch(completed_at)>=max(lo,unixepoch(eligible_from)) AND unixepoch(completed_at)<hi
), due AS (
 SELECT d.* FROM expected d JOIN p USING(project) WHERE
 unixepoch(due_at)>=max(lo,unixepoch(eligible_from)) AND unixepoch(due_at)<hi
), duration AS (
 SELECT duration_ms, row_number() OVER (ORDER BY duration_ms) rank, count(*) OVER () n
 FROM terminal WHERE status<>'cancelled'
), base AS (
 SELECT
 (SELECT count(*) FROM p) eligible_projects,
 (SELECT count(*) FROM p WHERE enrolled=1) enrolled_projects,
 (SELECT count(DISTINCT project) FROM terminal) active_projects,
 (SELECT count(*) FROM terminal) attempts,
 (SELECT count(*) FROM terminal WHERE EXISTS (SELECT 1 FROM json_each(capabilities) WHERE value='run')) capability_run_attempts,
 (SELECT count(*) FROM terminal WHERE EXISTS (SELECT 1 FROM json_each(capabilities) WHERE value='act')) capability_act_attempts,
 (SELECT count(*) FROM terminal WHERE EXISTS (SELECT 1 FROM json_each(capabilities) WHERE value='assert')) capability_assert_attempts,
 (SELECT count(*) FROM terminal WHERE status='pass') pass,
 (SELECT count(*) FROM terminal WHERE status='assertion_failure') assertion_failure,
 (SELECT count(*) FROM terminal WHERE status='infra_failure') infra_failure,
 (SELECT count(*) FROM terminal WHERE status='cancelled') cancelled,
 (SELECT count(*) FROM duration) evaluable,
 (SELECT duration_ms/1000.0 FROM duration WHERE rank=(n+1)/2) duration_p50_seconds,
 (SELECT duration_ms/1000.0 FROM duration WHERE rank=(95*n+99)/100) duration_p95_seconds,
 (SELECT count(*) FROM due) expected,
 (SELECT count(*) FROM due JOIN terminal USING(project,id)) covered,
 (SELECT count(*) FROM due JOIN terminal USING(project,id) WHERE status IN ('pass','assertion_failure')) platform_good,
 (SELECT count(*) FROM terminal WHERE id NOT IN (SELECT id FROM due)) unexpected,
 lo window_start_timestamp_seconds, hi as_of_timestamp_seconds
 FROM w
)
SELECT *,1.0*active_projects/eligible_projects adoption_ratio, 1.0*attempts/:days throughput_per_day,
 1.0*platform_good/expected platform_good_ratio, pass+assertion_failure functional_evaluable,
 1.0*assertion_failure/(pass+assertion_failure) functional_failure_ratio, 1.0*infra_failure/evaluable infra_failure_ratio,
 1.0*pass/evaluable pass_ratio, expected-covered missing, 1.0*covered/expected coverage_ratio FROM base
"""

def rows(data):
    with sqlite3.connect(":memory:") as db:
        db.row_factory=sqlite3.Row
        db.executescript("""
        CREATE TABLE roster(project TEXT PRIMARY KEY,team TEXT,environment TEXT,eligible_from TEXT,ineligible_at TEXT,enrolled INT);
        CREATE TABLE arrivals(id TEXT PRIMARY KEY,project TEXT,completed_at TEXT,status TEXT,duration_ms INT,capabilities TEXT);
        CREATE TABLE expected(id TEXT PRIMARY KEY,project TEXT,due_at TEXT);
        """)
        db.executemany("INSERT INTO roster VALUES(:project,:team,:environment,:eligible_from,:ineligible_at,:enrolled)",data["roster"])
        db.executemany("INSERT INTO arrivals VALUES(:id,:project,:completed_at,:status,:duration_ms,:capabilities)",
                       [dict(row,capabilities=json.dumps(row["capabilities"])) for row in data["terminals"]])
        db.executemany("INSERT INTO expected VALUES(:id,:project,:due_at)",data["expected"])
        for days,team,env in itertools.product((7,30),("all","payments","platform"),("all","ci","staging")):
            yield (f"{days}d",team,env),dict(db.execute(QUERY,{"cutoff":data["as_of"],"days":days,"team":team,"env":env}).fetchone())

def verify(exposition,data):
    actual={}
    for line in exposition.splitlines():
        if not line or line.startswith("#"):
            continue
        match=re.fullmatch(r'qaas_kpi_(\w+)\{window="([^"]+)",team="([^"]+)",environment="([^"]+)"\} (\S+)',line)
        assert match, f"Unexpected dimensions or metric line: {line}"
        metric,w,t,e,v=match.groups()
        assert (w,t,e,metric) not in actual
        actual[w,t,e,metric]=float(v)
    checks=0
    verified=dict(rows(data))
    for scope,row in verified.items():
        for metric,want in row.items():
            got=actual.pop((*scope,metric),None)
            assert got is None if want is None else got is not None and math.isclose(got,want),(scope,metric,want,got)
            checks+=1
    assert not actual
    a,b,c=(verified[s] for s in [("7d","all","all"),("30d","all","all"),("7d","payments","staging")])
    keys=("active_projects","eligible_projects","enrolled_projects","attempts","pass","assertion_failure",
          "infra_failure","cancelled","functional_evaluable","evaluable","platform_good","expected","covered",
          "missing","unexpected","duration_p50_seconds","duration_p95_seconds")
    assert [a[k] for k in keys]==[3,5,4,7,3,1,2,1,4,6,4,7,6,1,1,3.,11.]
    assert [b[k] for k in keys]==[4,5,4,10,5,2,2,1,7,9,7,10,9,1,1,3.,11.]
    assert [a["capability_"+x+"_attempts"] for x in ("run","act","assert")]==[7,5,4]
    assert c["attempts"]==0 and c["coverage_ratio"] is None and c["duration_p95_seconds"] is None
    return {"scope_count":len(verified),"cells_checked":checks,"rows":{"|".join(k):v for k,v in verified.items()}}

if __name__=="__main__":
    import sys
    print(json.dumps(verify(Path(sys.argv[1]).read_text(),json.loads((HERE/"fixtures/input.json").read_text())),indent=2))
