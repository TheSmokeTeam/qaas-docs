"""Generate proposed Grafana dashboard and deterministic PromQL scenarios."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent
JOB = 'job="qaas_operational"'
LABEL = '{job="qaas_operational"}'
DS = {"type": "prometheus", "uid": "qaas-prometheus"}
LATENCY = "qaas_ingest_delivery_duration_seconds"
MOCKER_LATENCY = "qaas_mocker_request_duration_seconds"
BUCKETS = ("0.05", "0.1", "0.25", "0.5", "1", "2.5", "5", "15", "+Inf")
BUCKET_COUNTS = (0, 0, 4, 10, 14, 19, 20, 20, 20)
UP = f'up{{{JOB}}}'
LIVE = f'and on(job,instance) ({UP} == 1)'
LAST = f'qaas_ingest_last_accepted_timestamp_seconds{{{JOB}}}'
SIZE = f'qaas_ingest_queue_size{{{JOB}}}'
CAP = f'qaas_ingest_queue_capacity{{{JOB}}}'

def rate(metric, labels=""):
    return f'sum(rate({metric}{{{JOB}{labels}}}[5m]))'

def hist(quantile, metric=LATENCY):
    return (f'histogram_quantile({quantile},sum by(le)(rate({metric}_bucket{{{JOB}}}[5m])))'
            f' and on() ({rate(metric+"_count")} > 0)')

def fraction(num, den):
    return f'(({num}) / ({den})) and on() (({den}) > 0)'

def mock(outcome):
    return rate("qaas_mocker_requests_completed_total", f',outcome="{outcome}"')

MOCKER_ACCEPTED = rate("qaas_mocker_requests_accepted_total")
MOCKER_CLASSIFIED = rate("qaas_mocker_requests_completed_total", ',outcome=~"hit|miss"')
SPECS = [
    ("Ingress and downstream acknowledgment", "ops", "Unique durable admission and first downstream durability acknowledgment; not network attempts.",
     [("Accepted",rate("qaas_ingest_accepted_total")),("Acknowledged",rate("qaas_ingest_acknowledged_total"))]),
    ("Refused attempts and dropped records","ops","Refused before admission may succeed on retry; dropped means definitive loss after admission. Do not combine into a loss percentage.",
     [("Refused attempts",rate("qaas_ingest_refused_total")),("Dropped records",rate("qaas_ingest_dropped_total"))]),
    ("Queue pressure by live target","percentunit","Observed occupancy / positive finite capacity of the same live target. Unbounded/missing capacity stays No data.",
     [("{{instance}}",f'({SIZE} / on(job,instance) ({CAP} > 0)) {LIVE}')]),
    ("Queued records by live target","short","Inspect depth when capacity is unknown. Do not sum replicas reporting the same queue.",
     [("{{instance}}",f'{SIZE} {LIVE}')]),
    ("Scrape health and missing job","short","Scrape health is telemetry, not business health. Sentinel appears only when the entire job is absent.",
     [("Live",f'sum({UP})'),("Unreachable",f'count({UP}) - sum({UP})'),("All absent",f'absent({UP})')]),
    ("Age of durable ingress by live target","s","Time since last unique admission. Missing, zero or future timestamp gives No data; quiet periods are not necessarily failure.",
     [("{{instance}}",f'(time() - (({LAST} > 0) <= time())) {LIVE}')]),
    ("Delivery latency p50/p95","s","Approximate measured admission-to-acknowledgment latency; only acknowledged timed work. Identical buckets required.",
     [("p50",hist(.5)),("p95",hist(.95))]),
    ("Delivery latency sample rate","ops","Timing coverage context; no samples does not mean zero latency.",
     [("Timed acknowledgments/s",rate(LATENCY+"_count"))]),
    ("Mocker HTTP throughput and outcomes","ops","Proposed HTTP instrumentation, no inference from HTTP status. Completed results are disjoint hit/miss/internal error.",
     [("Accepted",MOCKER_ACCEPTED),("Hit",mock("hit")),("Miss",mock("miss")),("Internal error",mock("error"))]),
    ("Mocker hit and internal error shares","percentunit","Hit equals hits/(hits+misses). Internal error equals errors/all accepted. Zero/absent denominators stay No data. Rates are not exact cohort accounting.",
     [("Hit / (hit + miss)",fraction(mock("hit"),MOCKER_CLASSIFIED)),("Error / all accepted",fraction(mock("error"),MOCKER_ACCEPTED))]),
    ("Mocker HTTP handling latency","s","Approximate p95 of measured terminal handlers. Right axis is timing sample rate, not latency.",
     [("p95",hist(.95,MOCKER_LATENCY)),("Timed completions/s",rate(MOCKER_LATENCY+"_count"))]),
]

def dashboard():
    return {"uid":"qaas-operations-budget","title":"QaaS | Ingestion operations (proposed)",
     "description":"Optional Prometheus supplement; proposed exporter contract, not deployed instrumentation.",
     "schemaVersion":39,"version":1,"editable":False,"refresh":"30s","timezone":"utc",
     "time":{"from":"now-1h","to":"now"},"tags":["qaas","prototype","operations"],
     "panels":[{"id":i+1,"type":"timeseries","datasource":DS,"title":title,"description":desc,
      "gridPos":{"x":(i%2)*12,"y":(i//2)*8,"w":12,"h":8},
      "fieldConfig":{"defaults":{"unit":unit,"custom":{"spanNulls":False}},"overrides":(
          [{"matcher":{"id":"byFrameRefID","options":"B"},"properties":[
           {"id":"unit","value":"ops"},{"id":"custom.axisPlacement","value":"right"}]}] if i==10 else [])},
      "options":{"legend":{"displayMode":"list","placement":"bottom","showLegend":True}},
      "targets":[{"refId":chr(65+j),"datasource":DS,"editorMode":"code","expr":expr,
                  "legendFormat":legend,"range":True,"instant":False}
                 for j,(legend,expr) in enumerate(targets)]}
     for i,(title,unit,desc,targets) in enumerate(SPECS)]}

def goldens():
    a,b = "synthetic-a","synthetic-b"
    def labels(instance,extra=""):
        return f'{{instance="{instance}",{JOB}{extra}}}'
    def seq(metric,instance,raw,extra=""):
        return {"series":metric+labels(instance,extra),"values":raw}
    def counter(metric, instance, n, extra=""):
        return seq(metric,instance,f"0+{n}x6",extra)
    def gauge(metric, instance, n):
        return seq(metric,instance,f"{n}+0x6")
    def histogram(metric, instance, increments):
        return [counter(metric+"_count",instance,increments[-1])] + [
          counter(metric+"_bucket",instance,n,f',le="{bucket}"') for bucket,n in zip(BUCKETS,increments)]
    def sample(val, lbl="{}"):
        return {"labels":lbl,"value":val}
    def check(i,j,*samples):
        return {"expr":SPECS[i][3][j][1],"eval_time":"6m","exp_samples":list(samples)}
    def scenario(series, checks):
        return {"interval":"1m","input_series":series,"promql_expr_test":checks}

    active = [counter("qaas_ingest_"+key+"_total",instance,n)
       for instance,ns in ((a,(60,48,12,6)),(b,(120,96,6,0)))
       for key,n in zip(("accepted","acknowledged","refused","dropped"),ns)]
    active += [gauge("up",a,1),gauge("up",b,1),gauge("qaas_ingest_queue_size",a,80),
               gauge("qaas_ingest_queue_capacity",a,100),gauge("qaas_ingest_queue_size",b,8),
               gauge("qaas_ingest_queue_capacity",b,0),gauge("qaas_ingest_last_accepted_timestamp_seconds",a,240),
               gauge("qaas_ingest_last_accepted_timestamp_seconds",b,0),
               counter("qaas_mocker_requests_accepted_total",a,60)]
    active += [counter("qaas_mocker_requests_completed_total",a,n,f',outcome="{outcome}"')
               for outcome,n in (("hit",36),("miss",12),("error",6))]
    active += histogram(LATENCY,a,BUCKET_COUNTS) + histogram(MOCKER_LATENCY,a,BUCKET_COUNTS)
    active_checks = [check(0,0,sample(3)),check(0,1,sample(2.4)),check(1,0,sample(.3)),check(1,1,sample(.1)),
     check(2,0,sample(.8,labels(a))), check(3,0,*[sample(v,labels(x,',__name__="qaas_ingest_queue_size"'))
          for x,v in ((a,80),(b,8))]),check(4,0,sample(2)),check(4,1,sample(0)),check(4,2),
     check(5,0,sample(120,labels(a))),check(6,0,sample(.5)),check(6,1,sample(2.5)),check(7,0,sample(1/3)),
     check(8,0,sample(1)),check(8,1,sample(.6)),check(8,2,sample(.2)),check(8,3,sample(.1)),
     check(9,0,sample(.75)),check(9,1,sample(.1)),check(10,0,sample(2.5)),check(10,1,sample(1/3))]
    zero = [0]*9
    down = [gauge("up",a,0),gauge("qaas_ingest_queue_size",a,80),
           gauge("qaas_ingest_queue_capacity",a,100),gauge("qaas_ingest_last_accepted_timestamp_seconds",a,240)]
    down += histogram(LATENCY,a,zero)
    idle = [gauge("up",a,1),gauge("qaas_ingest_last_accepted_timestamp_seconds",a,400),
           counter("qaas_mocker_requests_accepted_total",a,0)]
    idle += [counter("qaas_mocker_requests_completed_total",a,0,f',outcome="{o}"') for o in ("hit","miss","error")]
    idle += histogram(MOCKER_LATENCY,a,zero)
    return {"fuzzy_compare":True,"evaluation_interval":"1m","tests":[scenario(active,active_checks),
      scenario(down,[check(2,0),check(3,0),check(4,0,sample(0)),check(4,1,sample(1)),check(4,2),
                     check(5,0),check(6,0),check(6,1),check(7,0,sample(0))]),
      scenario([],[check(0,0),check(1,0),check(4,0),check(4,1),check(4,2,sample(1,LABEL)),
                   check(5,0),check(6,0),check(7,0),check(8,0),check(9,0),check(9,1),check(10,0)]),
      scenario(idle,[check(5,0),check(8,0,sample(0)),check(9,0),check(9,1),check(10,0),check(10,1,sample(0))])]}

if __name__ == "__main__":
    for name,value in (("dashboard.json",dashboard()),("promql.test.yml",goldens())):
        (ROOT/name).write_text(json.dumps(value,indent=2)+"\n",encoding="utf-8")
