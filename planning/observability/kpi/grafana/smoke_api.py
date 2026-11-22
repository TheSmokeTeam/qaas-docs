"""Start real disposable Grafana/Prometheus and check each rendered-query API cell."""
import argparse
import base64
from contextlib import ExitStack
import json
import math
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile
import time
from urllib.error import HTTPError,URLError
from urllib.parse import urlencode
from urllib.request import Request,ProxyHandler,build_opener

ROOT=Path(__file__).resolve().parents[1]
E=ROOT/"evidence"
G,P="http://127.0.0.1:13000","http://127.0.0.1:19090"
HTTP=build_opener(ProxyHandler({}))
FIXTURE_PASSWORD="local-ephemeral-synthetic"
AUTH={"Authorization":"Basic "+base64.b64encode(("admin:"+FIXTURE_PASSWORD).encode()).decode()}

def api(url,body=None,auth=False):
    headers={"Content-Type":"application/json",**(AUTH if auth else {})}
    with HTTP.open(Request(url,headers=headers,data=None if body is None else json.dumps(body).encode()),timeout=8) as r:
        return json.load(r)

def wait(test,procs,message):
    until=time.monotonic()+30
    while time.monotonic()<until:
        assert all(p.poll() is None for p in procs), f"Runtime exited before {message}"
        try:
            if test():
                return
        except (URLError,TimeoutError):
            pass
        time.sleep(.15)
    raise RuntimeError(message)

def health(url):
    with HTTP.open(url,timeout=1) as r:
        return r.status==200

def test_views():
    assert api(G+"/api/datasources",{"uid":"qaas-prometheus","name":"QaaS synthetic Prometheus",
               "type":"prometheus","access":"proxy","url":P,"isDefault":True},auth=True)["message"]=="Datasource added"
    dashboard=json.loads((ROOT/"dashboards/usage.json").read_text())
    assert api(G+"/api/dashboards/db",{"dashboard":dashboard,"overwrite":False},auth=True)["status"]=="success"
    saved=api(G+"/api/dashboards/uid/"+dashboard["uid"],auth=True)["dashboard"]
    panels=[p for p in saved["panels"] if p["type"]=="stat"]
    assert len(panels)==len({p["id"] for p in panels})==29
    oracle=json.loads((E/"oracle.json").read_text())
    proxy_checks,frame_checks=0,0
    empty_frames=0
    capture_scopes={"7d|all|all","30d|all|all","7d|payments|staging"}
    frame_readback={}
    for scope,row in oracle["rows"].items():
        window,team,env=scope.split("|")
        batch,expected,source_metrics={},{},{}
        if scope in capture_scopes:
            frame_readback[scope]={}
        for panel in panels:
            base=panel["targets"][0]
            expr=base["expr"].replace("$window",window).replace("$team",team).replace("$environment",env)
            ref="Panel"+str(panel["id"])
            metric=re.search(r"qaas_kpi_(\w+)",expr).group(1)
            value=row[metric]
            if value is not None and expr.endswith(" * 1000"):
                value*=1000
            batch[ref]=dict(base,expr=expr,refId=ref)
            expected[ref]=value
            source_metrics[ref]=(metric,expr.endswith(" * 1000"))
            result=api(G+"/api/datasources/proxy/uid/qaas-prometheus/api/v1/query?"+urlencode({"query":expr}),auth=True)["data"]["result"]
            if value is None:
                assert not result,(scope,expr,result)
            else:
                assert len(result)==1 and math.isclose(float(result[0]["value"][1]),value),(scope,expr,value,result)
                assert not {"project","attempt","run_id"}&result[0]["metric"].keys()
            proxy_checks+=1
        t=int(time.time()*1000)
        data=api(G+"/api/ds/query",{"from":str(t-300000),"to":str(t),"queries":list(batch.values())},auth=True)["results"]
        for ref,value in expected.items():
            frames=data[ref]["frames"]
            if value is None:
                assert all(not f["data"]["values"] for f in frames),(scope,ref,frames)
                empty_frames+=1
                actual=None
            else:
                assert len(frames)==1,(scope,ref,frames)
                points=frames[0]["data"]["values"][1]
                assert len(points)==1 and math.isclose(float(points[0]),value),(scope,ref,value,points)
                actual=float(points[0])
            if scope in frame_readback:
                metric,milliseconds=source_metrics[ref]
                frame_readback[scope][metric]=actual/1000 if actual is not None and milliseconds else actual
            frame_checks+=1
    return {"dashboard_uid":saved["uid"],"panels":len(panels),"scopes":len(oracle["rows"]),
            "proxy_cells":proxy_checks,"grafana_frame_cells":frame_checks,"undefined_cells":empty_frames,
            "grafana":api(G+"/api/health")["version"],"prometheus":api(P+"/api/v1/status/buildinfo")["data"]["version"],
            "records_source":"Captured Grafana /api/ds/query frame values; cutoff timestamps normalized to epoch seconds.",
            "records":frame_readback}

def screenshot():
    from playwright.sync_api import sync_playwright
    with sync_playwright() as p:
        browser=p.chromium.launch(executable_path="/usr/bin/chromium",headless=True,args=["--disable-dev-shm-usage"])
        try:
            page=browser.new_page(viewport={"width":1440,"height":1000},device_scale_factor=1)
            page.goto(G+"/d/qaas-usage-budget?var-window=7d&var-team=all&var-environment=all&kiosk",wait_until="domcontentloaded")
            page.get_by_text("Adoption rate",exact=True).first.wait_for(timeout=25000)
            page.get_by_text(re.compile(r"^60(?:\.0+)?\s*%$")).first.wait_for(timeout=25000)
            page.screenshot(path=str(E/"grafana-usage-7d.png"),full_page=True)
        finally:
            browser.close()

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument("--grafana-home",type=Path,required=True)
    parser.add_argument("--prometheus",type=Path,required=True)
    parser.add_argument("--screenshot",action="store_true")
    args=parser.parse_args()
    procs=[]
    with tempfile.TemporaryDirectory(prefix="qaas-kpi-") as db,ExitStack() as logs:
        db=Path(db)
        def launch(name,command,env=None):
            stream=logs.enter_context((E/(name+".log")).open("w"))
            proc=subprocess.Popen(command,cwd=ROOT,stdout=stream,stderr=subprocess.STDOUT,env=env)
            procs.append(proc)
        try:
            launch("exporter",[sys.executable,str(ROOT/"serve.py")])
            wait(lambda:health("http://127.0.0.1:19332/metrics"),procs,"exporter")
            launch("prometheus",[str(args.prometheus),"--config.file="+str(ROOT/"grafana/prometheus.yml"),
                                 "--storage.tsdb.path="+str(db/"prom"),"--web.listen-address=127.0.0.1:19090"])
            wait(lambda:bool(api(P+"/api/v1/query?"+urlencode({"query":"qaas_kpi_adoption_ratio"}))["data"]["result"]),procs,"first scrape")
            env={k:v for k,v in os.environ.items() if k in ("PATH","HOME","LANG")}
            env.update(GF_SERVER_HTTP_ADDR="127.0.0.1",GF_SERVER_HTTP_PORT="13000",
                       GF_PATHS_DATA=str(db/"data"),GF_PATHS_LOGS=str(db/"logs"),GF_PATHS_PLUGINS=str(db/"plugins"),
                       GF_PATHS_PROVISIONING=str(db/"provision"),GF_SECURITY_ADMIN_PASSWORD=FIXTURE_PASSWORD,
                       GF_ANALYTICS_REPORTING_ENABLED="false",GF_ANALYTICS_CHECK_FOR_UPDATES="false",
                       GF_ANALYTICS_CHECK_FOR_PLUGIN_UPDATES="false",GF_PLUGINS_PUBLIC_KEY_RETRIEVAL_DISABLED="true",
                       GF_PLUGINS_PREINSTALL_DISABLED="true",GF_PLUGINS_PLUGIN_ADMIN_ENABLED="false",GF_SECURITY_DISABLE_GRAVATAR="true",
                       GF_AUTH_ANONYMOUS_ENABLED="true" if args.screenshot else "false",
                       GF_AUTH_ANONYMOUS_ORG_ROLE="Viewer",GF_LOG_MODE="console")
            launch("grafana",[str(args.grafana_home/"bin/grafana"),"server","--homepath",str(args.grafana_home)],env)
            wait(lambda:health(G+"/api/health"),procs,"Grafana")
            report=test_views()
            (E/"grafana-verification.json").write_text(json.dumps(report,indent=2)+"\n")
            print(json.dumps({k:v for k,v in report.items() if k!="records"}),flush=True)
            if args.screenshot:
                screenshot()
        finally:
            for proc in reversed(procs):
                proc.terminate()
                try:
                    proc.wait(timeout=5)
                except subprocess.TimeoutExpired:
                    proc.kill()
                    proc.wait(timeout=5)
if __name__=="__main__": main()
