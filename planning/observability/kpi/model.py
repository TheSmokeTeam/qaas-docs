"""Compute a bounded synthetic usage read model. Source IDs never enter metrics."""
from collections import Counter
from datetime import datetime, timedelta
from itertools import product
from math import ceil
import re

TEAMS = ("all", "payments", "platform")
ENVIRONMENTS = ("all", "ci", "staging")
WINDOWS = (7, 30)
CAPABILITIES = ("run", "act", "assert")
STATUSES = ("pass", "assertion_failure", "infra_failure", "cancelled")

DEFINITIONS = {
    "adoption_ratio": "Active eligible projects divided by the current eligible cohort.",
    "active_projects": "Distinct eligible projects with at least one terminal attempt.",
    "eligible_projects": "Current independently rostered eligible projects.",
    "enrolled_projects": "Independently rostered enrolled subset of eligible projects.",
    "throughput_per_day": "Mean terminal attempts per UTC day across the selected exact window.",
    "capability_run_attempts": "Terminal attempts reporting Run.",
    "capability_act_attempts": "Terminal attempts reporting Act at least once.",
    "capability_assert_attempts": "Terminal attempts reporting Assert at least once.",
    "platform_good_ratio": "Expected IDs with a valid test outcome divided by mature expected IDs.",
    "platform_good": "Expected IDs with matching pass or assertion failure.",
    "functional_failure_ratio": "Assertion failures divided by passes and assertion failures.",
    "infra_failure_ratio": "Infrastructure failures divided by noncancelled terminal attempts.",
    "attempts": "Terminal attempts, including cancellations and unexpected observations.",
    "pass": "Observed terminal passes.",
    "assertion_failure": "Observed terminal assertion failures.",
    "infra_failure": "Observed terminal infrastructure failures.",
    "cancelled": "Observed cancelled terminal attempts.",
    "functional_evaluable": "Passes plus assertion failures.",
    "evaluable": "Passes plus assertion failures plus infrastructure failures.",
    "pass_ratio": "Passes divided by noncancelled terminal attempts.",
    "duration_p50_seconds": "Nearest-rank p50 of noncancelled durations in seconds.",
    "duration_p95_seconds": "Nearest-rank p95 of noncancelled durations in seconds.",
    "coverage_ratio": "Matching in-window terminal IDs divided by independent mature due IDs.",
    "expected": "Independent mature due attempts in the exact window.",
    "covered": "Mature due attempts with a matching in-window terminal.",
    "missing": "Mature due attempts without a matching in-window terminal.",
    "unexpected": "In-window terminal attempts without a matching in-window due entry.",
    "as_of_timestamp_seconds": "Exclusive snapshot/window cutoff, UTC Unix seconds.",
    "window_start_timestamp_seconds": "Inclusive UTC window start, Unix seconds.",
}

def parse_time(value):
    if not isinstance(value, str) or not re.fullmatch(r"[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z", value):
        raise ValueError("expected a whole-second UTC timestamp")
    return datetime.fromisoformat(value[:-1] + "+00:00")

def unique(rows, column):
    keyed = {}
    for row in rows:
        key = row[column]
        if not isinstance(key, str) or not key or key in keyed:
            raise ValueError("missing or duplicate canonical key")
        keyed[key] = row
    return keyed

def build(data):
    cutoff = parse_time(data["as_of"])
    roster = unique(data["roster"], "project")
    expected = unique(data["expected"], "id")
    terminals = unique(data["terminals"], "id")
    for row in roster.values():
        if row["team"] not in TEAMS[1:] or row["environment"] not in ENVIRONMENTS[1:] or type(row["enrolled"]) is not bool:
            raise ValueError("invalid or out-of-policy roster dimensions")
        if row["ineligible_at"] is not None and parse_time(row["ineligible_at"]) <= parse_time(row["eligible_from"]):
            raise ValueError("invalid roster interval")
        parse_time(row["eligible_from"])
    for row in expected.values():
        if row["project"] not in roster:
            raise ValueError("unrecognized ledger project")
        parse_time(row["due_at"])
    for id_, row in terminals.items():
        if row["project"] not in roster or (id_ in expected and expected[id_]["project"] != row["project"]):
            raise ValueError("unknown project or ledger conflict")
        if row["status"] not in STATUSES or type(row["duration_ms"]) is not int or row["duration_ms"] < 0:
            raise ValueError("invalid outcome or duration")
        caps = row["capabilities"]
        if not isinstance(caps, list) or any(c not in CAPABILITIES for c in caps) or len(set(caps)) != len(caps) or "run" not in caps:
            raise ValueError("invalid bounded capabilities")
        parse_time(row["completed_at"])
    for days, team, env in product(WINDOWS, TEAMS, ENVIRONMENTS):
        start = cutoff - timedelta(days=days)
        cohort = {
            key:parse_time(row["eligible_from"]) for key,row in roster.items()
            if parse_time(row["eligible_from"]) <= cutoff
            and (row["ineligible_at"] is None or parse_time(row["ineligible_at"]) > cutoff)
            and (team == "all" or row["team"] == team)
            and (env == "all" or row["environment"] == env)}
        def scoped(row, column):
            return row["project"] in cohort and max(start,cohort[row["project"]]) <= parse_time(row[column]) < cutoff
        observed = {k:r for k,r in terminals.items() if scoped(r,"completed_at")}
        due = {k for k,r in expected.items() if scoped(r,"due_at")}
        matched = due & observed.keys()
        active = len({r["project"] for r in observed.values()})
        outcomes = Counter(r["status"] for r in observed.values())
        durations = sorted(r["duration_ms"] for r in observed.values() if r["status"] != "cancelled")
        n = len(durations)
        functional = outcomes["pass"] + outcomes["assertion_failure"]
        good = sum(observed[k]["status"] in ("pass","assertion_failure") for k in matched)
        ratio = lambda x,y: x/y if y else None
        result = {
            "adoption_ratio":ratio(active,len(cohort)),
            "active_projects":active,"eligible_projects":len(cohort),
            "enrolled_projects":sum(roster[k]["enrolled"] for k in cohort),
            "throughput_per_day":len(observed)/days,
            **{f"capability_{cap}_attempts":sum(cap in r["capabilities"] for r in observed.values()) for cap in CAPABILITIES},
            "platform_good_ratio":ratio(good,len(due)),"platform_good":good,
            "functional_failure_ratio":ratio(outcomes["assertion_failure"],functional),
            "infra_failure_ratio":ratio(outcomes["infra_failure"],n),
            "attempts":len(observed), **{k:outcomes[k] for k in STATUSES},
            "functional_evaluable":functional,"evaluable":n,"pass_ratio":ratio(outcomes["pass"],n),
            "duration_p50_seconds":durations[ceil(.5*n)-1]/1000 if n else None,
            "duration_p95_seconds":durations[ceil(.95*n)-1]/1000 if n else None,
            "coverage_ratio":ratio(len(matched),len(due)),
            "expected":len(due),"covered":len(matched),"missing":len(due-matched),"unexpected":len(observed.keys()-due),
            "as_of_timestamp_seconds":int(cutoff.timestamp()),"window_start_timestamp_seconds":int(start.timestamp())
        }
        assert result.keys() == DEFINITIONS.keys()
        yield (f"{days}d",team,env),result

def exposition(rows):
    out=[]
    for key,help_text in DEFINITIONS.items():
        name=f"qaas_kpi_{key}"
        out += [f"# HELP {name} {help_text}",f"# TYPE {name} gauge"]
        for (window,team,env),record in rows:
            if record[key] is not None:
                out.append(f'{name}{{window="{window}",team="{team}",environment="{env}"}} {record[key]}')
    return "\n".join(out)+"\n"
