"""Generate the importable stock Grafana dashboard without third-party plugins."""
import json
from pathlib import Path

DS={"type":"prometheus","uid":"qaas-prometheus"}
GROUPS=[
 ("Adoption: observed current cohort",[
  ("Adoption rate","adoption_ratio","percentunit","Eligible projects with an observed terminal attempt / current eligible projects. Not proof of inactivity when delivery was missing."),
  ("Active projects","active_projects","short","Distinct eligible projects with a terminal attempt."),
  ("Eligible projects","eligible_projects","short","Independent current roster; includes eligible but unenrolled."),
  ("Enrolled projects","enrolled_projects","short","Enrolled portion of the independent eligible roster."),
  ("Terminal throughput (runs/day)","throughput_per_day","short","Terminal attempts, including cancelled and unexpected observations, per elapsed UTC day."),
 ]),
 ("Capability usage: attempts, categories overlap",[
  ("Run","capability_run_attempts","short","Observed terminal attempts that report Run."),
  ("Act","capability_act_attempts","short","Observed terminal attempts with at least one Act."),
  ("Assert","capability_assert_attempts","short","Observed terminal attempts with at least one Assert."),
 ]),
 ("Reliability: functional vs platform",[
  ("Platform good / expected","platform_good_ratio","percentunit","Mature expected attempts that match an in-window valid test outcome / all mature expected attempts. No separate cancellation exclusions."),
  ("Platform good attempts","platform_good","short","Expected attempts matched to a pass or assertion failure."),
  ("Functional assertion failure","functional_failure_ratio","percentunit","Assertion failure / (pass + assertion failure). No infrastructure error or cancellation."),
  ("Observed infra error share","infra_failure_ratio","percentunit","Infrastructure failures / noncancelled observed terminals. Missing events are not assumed infrastructure failures."),
  ("Terminal attempts","attempts","short","All terminal attempts, including cancellations and unexpected observations."),
  ("Passed","pass","short","Observed passes."),
  ("Assertion failures","assertion_failure","short","Observed assertion failures."),
  ("Infrastructure failures","infra_failure","short","Observed infrastructure failures."),
  ("Cancelled","cancelled","short","Observed cancellations, included in throughput and coverage; excluded from evaluable outcome and duration pools."),
  ("Functional denominator","functional_evaluable","short","Pass + assertion failure."),
  ("Infra / duration denominator","evaluable","short","Pass + assertion failure + infrastructure failure."),
  ("Observed pass share","pass_ratio","percentunit","Pass / noncancelled observed terminals. Missing events excluded."),
 ]),
 ("Duration and coverage: inspect before interpreting",[
  ("Duration p50","duration_p50_seconds","s","Exact nearest rank, in seconds, on pass, assertion failure and infrastructure failure durations."),
  ("Duration p95","duration_p95_seconds","s","Exact nearest rank, in seconds; no cancelled attempts."),
  ("Telemetry coverage","coverage_ratio","percentunit","Matching expected IDs / independent expected IDs. Both mature due and terminal timestamps must fall in the selected window."),
  ("Expected","expected","short","Independent mature due in-window expected attempts."),
  ("Covered","covered","short","Expected attempts with a matching in-window terminal."),
  ("Missing","missing","short","In-window due without matching in-window terminal."),
  ("Unexpected","unexpected","short","Terminal without matching in-window due entry."),
  ("Snapshot end (exclusive)","as_of_timestamp_seconds","dateTimeAsIso","Fixed synthetic cutoff in UTC."),
  ("Snapshot start (inclusive)","window_start_timestamp_seconds","dateTimeAsIso","Selected exact 7- or 30-day UTC window start."),
 ]),
]
def variable(name,label,values):
    return {"name":name,"label":label,"type":"custom","query":",".join(values),
            "current":{"value":values[0],"text":values[0]},"includeAll":False,"multi":False,
            "options":[{"text":v,"value":v,"selected":i==0} for i,v in enumerate(values)]}

def generate():
    panels=[]
    y=0
    for group,stats in GROUPS:
        panels.append({"type":"row","title":group,"id":len(panels)+1,
                       "gridPos":{"x":0,"y":y,"w":24,"h":1},"collapsed":False,"panels":[]})
        y+=1
        for i,(title,metric,unit,description) in enumerate(stats):
            query='qaas_kpi_'+metric+'{job="qaas_kpi",window="$window",team="$team",environment="$environment"}'
            if unit=="dateTimeAsIso":
                query+=" * 1000"
            panels.append({"type":"stat","title":title,"description":description,"id":len(panels)+1,
                           "datasource":DS,"gridPos":{"x":i%4*6,"y":y+i//4*4,"w":6,"h":4},
                           "targets":[{"expr":query,"instant":True,"range":False,"refId":"A","datasource":DS}],
                           "fieldConfig":{"defaults":{"unit":unit,"noValue":"N/A","color":{"mode":"fixed","fixedColor":"blue"}},"overrides":[]},
                           "options":{"colorMode":"value","graphMode":"none","textMode":"value",
                                      "reduceOptions":{"calcs":["lastNotNull"],"values":False}}})
        y+=((len(stats)+3)//4)*4
    return {"uid":"qaas-usage-budget","title":"QaaS | Usage, adoption and reliability",
            "description":"Synthetic fixture. Exact UTC snapshot windows independent of the Grafana time picker. No data is not zero.",
            "schemaVersion":41,"version":1,"timezone":"utc","editable":True,"timepicker":{"hidden":True},
            "time":{"from":"now-5m","to":"now"},"tags":["qaas","prototype","synthetic"],"panels":panels,
            "templating":{"list":[variable("window","Exact UTC window",["7d","30d"]),variable("team","Team",["all","payments","platform"]),
                                  variable("environment","Environment",["all","ci","staging"])]},
            "links":[{"title":"Pipeline operations","type":"link","url":"/d/qaas-operations-budget",
                      "tooltip":"Available when the companion dashboard is imported."}]}

if __name__=="__main__":
    (Path(__file__).resolve().parent/"dashboards/usage.json").write_text(json.dumps(generate(),indent=2)+"\n")
