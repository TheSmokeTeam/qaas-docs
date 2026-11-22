"""Run the proposed synthetic dashboard against real local Prometheus/Grafana."""
import argparse, base64, fcntl, json, math, os, secrets, socket, struct, subprocess, tempfile, threading, time
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import urlencode
from urllib.request import ProxyHandler, Request, build_opener

from generate import ROOT, SPECS, LATENCY, MOCKER_LATENCY, BUCKETS, BUCKET_COUNTS

HTTP=build_opener(ProxyHandler({}))

def samples(phase,tick,now):
    step=tick if phase!="idle" else 0
    values={
      **{f"qaas_ingest_{k}_total":step*n for k,n in (
        ("accepted",60),("acknowledged",48),("refused",12),("dropped",6))},
      "qaas_ingest_queue_size":0 if phase=="idle" else 80,
      "qaas_ingest_queue_capacity":0 if phase=="unbounded" else 100,
      "qaas_ingest_last_accepted_timestamp_seconds":int(now)-10 if step else 0,
      "qaas_mocker_requests_accepted_total":step*60,
      **{f'qaas_mocker_requests_completed_total{{outcome="{r}"}}':step*n for r,n in (
        ("hit",36),("miss",12),("error",6))}}
    values.update({f'{metric}_bucket{{le="{b}"}}':step*n for metric in (LATENCY,MOCKER_LATENCY)
                   for b,n in zip(BUCKETS,BUCKET_COUNTS)})
    total=math.fsum([.2]*4+[.4]*6+[.8]*4+[2.2]*5+[4])
    values.update({f"{metric}_{k}": step*n for metric in (LATENCY,MOCKER_LATENCY)
                   for k,n in (("sum",total),("count",20))})
    return values

def loopback():
    if not os.environ.get("QAAS_PARENT_NET_NS") or os.readlink("/proc/self/ns/net")==os.environ["QAAS_PARENT_NET_NS"]:
        raise SystemExit("Use a fresh unshare network namespace.")
    with socket.socket(socket.AF_INET,socket.SOCK_DGRAM) as sock:
        flags=struct.unpack_from("h",fcntl.ioctl(sock,0x8913,struct.pack("16sh22x",b"lo",0)),16)[0]
        fcntl.ioctl(sock,0x8914,struct.pack("16sh22x",b"lo",flags|1))
    assert [x.split(":",1)[0].strip() for x in Path("/proc/net/dev").read_text().splitlines()[2:]]==["lo"]
    assert not [x for x in Path("/proc/net/route").read_text().splitlines()[1:] if x.split()[0]!="lo"]

def freeport():
    with socket.socket() as s:
        s.bind(("127.0.0.1",0)); return s.getsockname()[1]

def wait(callback, seconds=24):
    end=time.monotonic()+seconds; error=None
    while time.monotonic()<end:
        try:
            if result:=callback():
                return result
        except (OSError,AssertionError,KeyError) as exc:
            error=exc
        time.sleep(.2)
    raise RuntimeError(f"Timed out waiting for condition ({error}).")

def get(url, data=None, auth=None):
    headers={"Content-Type":"application/json"}
    if auth:
        headers["Authorization"]=auth
    request=Request(url, data=None if data is None else json.dumps(data).encode(),headers=headers)
    with HTTP.open(request,timeout=6) as response:
        return json.load(response)

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prometheus",type=Path,required=True)
    parser.add_argument("--grafana-home",type=Path,required=True)
    parser.add_argument("--result",type=Path,required=True)
    parser.add_argument("--grafana-screenshot",type=Path)
    cfg=parser.parse_args()
    loopback()
    if cfg.result.exists():
        raise SystemExit("Refusing to replace existing evidence.")
    password=secrets.token_urlsafe(24)
    auth="Basic "+base64.b64encode(("admin:"+password).encode()).decode()
    begin=time.monotonic(); state={"phase":"idle"}

    class Handler(BaseHTTPRequestHandler):
        def log_message(self,*args):
            pass
        def do_GET(self):
            if self.path!="/metrics":
                self.send_error(404); return
            obs=samples(state["phase"],int(time.monotonic()-begin),time.time())
            body=("".join(f"{k} {v}\n" for k,v in obs.items())).encode()
            self.send_response(200); self.send_header("Content-Type","text/plain; version=0.0.4")
            self.send_header("Content-Length",str(len(body))); self.end_headers(); self.wfile.write(body)

    server=ThreadingHTTPServer(("127.0.0.1",0), Handler)
    thread=threading.Thread(target=server.serve_forever,daemon=True); thread.start()
    processes=[]; closed=False
    with tempfile.TemporaryDirectory(prefix="qaas-proposed-ops-") as temp:
        tmp=Path(temp)
        pport,gport=freeport(),freeport()
        while gport==pport:
            gport=freeport()
        prom,graf=f"http://127.0.0.1:{pport}",f"http://127.0.0.1:{gport}"
        def run(name,args,env=None):
            with (tmp/(name+".log")).open("wb") as log:
                child=subprocess.Popen([str(x) for x in args],cwd=tmp, env={**os.environ,**(env or {})},
                  stdin=subprocess.DEVNULL, stdout=log,stderr=subprocess.STDOUT)
            processes.append(child)
        def expr(panel,target=0):
            return SPECS[panel][3][target][1]
        def direct(q):
            out=get(prom+"/api/v1/query?"+urlencode({"query":q}))
            assert out["status"]=="success",out
            return [float(x["value"][1]) for x in out["data"]["result"]]
        def query(q, ref="A", instant=True):
            now=int(time.time()*1000)
            payload={"from":str(now-60000),"to":str(now),"queries":[{
               "refId":ref,"datasource":{"type":"prometheus","uid":"qaas-prometheus"},
               "expr":q,"instant":instant,"range":not instant,"intervalMs":1000,"maxDataPoints":60}]}
            out=get(graf+"/api/ds/query",payload,auth=auth)["results"][ref]
            assert not out.get("error"),out
            return [v for frame in out.get("frames",[]) for j,field in enumerate(frame["schema"]["fields"])
                    if field["type"]=="number" for v in frame["data"]["values"][j] if v is not None]

        try:
            (tmp/"targets.json").write_text(json.dumps([{"targets":[f"127.0.0.1:{server.server_port}"]}]))
            (tmp/"prom.yml").write_text(f"""global: {{scrape_interval: 1s, scrape_timeout: 900ms}}
scrape_configs:
  - job_name: qaas_operational
    file_sd_configs:
      - files: ["{tmp}/targets.json"]
        refresh_interval: 1s
""")
            (tmp/"grafana.ini").write_text(f"""[server]
http_addr = 127.0.0.1
http_port = {gport}
[analytics]
reporting_enabled = false
check_for_updates = false
check_for_plugin_updates = false
[security]
disable_gravatar = true
[auth.anonymous]
enabled = false
[plugins]
preinstall_disabled = true
""")
            (tmp/"provisioning/datasources").mkdir(parents=True)
            (tmp/"provisioning/dashboards").mkdir()
            (tmp/"dashboards").mkdir()
            (tmp/"gdata/plugins").mkdir(parents=True)
            (tmp/"dashboards/dashboard.json").write_bytes((ROOT/"dashboard.json").read_bytes())
            (tmp/"provisioning/datasources/prom.yml").write_text(f"""
apiVersion: 1
datasources:
  - name: QaaS Prometheus fixture
    type: prometheus
    uid: qaas-prometheus
    access: proxy
    url: {prom}
    jsonData:
      timeInterval: 1s
""")
            (tmp/"provisioning/dashboards/op.yml").write_text(f"""
apiVersion: 1
providers:
  - name: QaaS proposed operations
    type: file
    options:
      path: {tmp}/dashboards
""")
            run("prom",[cfg.prometheus.resolve(),"--config.file="+str(tmp/"prom.yml"),
                       "--storage.tsdb.path="+str(tmp/"tsdb"),f"--web.listen-address=127.0.0.1:{pport}"])
            home=cfg.grafana_home.resolve()
            run("grafana",[home/"bin/grafana","server","--homepath",home,"--config",tmp/"grafana.ini"],
                {"GF_PATHS_DATA":str(tmp/"gdata"),"GF_PATHS_PLUGINS":str(tmp/"gdata/plugins"),
                 "GF_PATHS_PROVISIONING":str(tmp/"provisioning"),"GF_SECURITY_ADMIN_PASSWORD":password})
            dash=wait(lambda:get(graf+"/api/dashboards/uid/qaas-operations-budget",auth=auth)["dashboard"])
            wait(lambda:direct(expr(7))==[0])
            for i,j in ((5,0),(6,0),(9,0),(9,1)):
                assert not query(expr(i,j)),(i,j,"idle")
            state["phase"]="active"
            wait(lambda:(v:=direct(expr(10))) and abs(v[0]-2.5)<.01)
            records=[]
            for panel in dash["panels"]:
                for target in panel["targets"]:
                    q,ref=target["expr"],target["refId"]
                    values=query(q,ref)
                    if q==expr(4,2):
                        assert not values
                        trend=[]
                    else:
                        assert values,(panel["title"],ref,"instant")
                        trend=wait(lambda:query(q,ref,False))
                    records.append({"panel_id":panel["id"],"title":panel["title"],"ref":ref,
                                    "instant":values,"range_numeric":trend})
            for i,j,expected in [(2,0,.8),(3,0,80),(6,0,.5),(6,1,2.5),(9,0,.75),(9,1,.1),(10,0,2.5)]:
                v=query(expr(i,j)); assert len(v)==1 and abs(v[0]-expected)<.01,(i,j,v)
            v=query(expr(5)); assert len(v)==1 and 9<=v[0]<=15,v
            screenshot_status="not requested"
            if cfg.grafana_screenshot:
                try:
                    from playwright.sync_api import sync_playwright
                    with sync_playwright() as pw:
                        browser=pw.chromium.launch(executable_path="/usr/bin/chromium", headless=True,
                            args=["--no-sandbox","--disable-dev-shm-usage","--disable-gpu"])
                        context=browser.new_context(viewport={"width":1680,"height":1180},
                            http_credentials={"username":"admin","password":password,"send":"always"})
                        page=context.new_page()
                        page.goto(graf+"/d/qaas-operations-budget?from=now-1m&to=now&kiosk",wait_until="domcontentloaded",timeout=9000)
                        page.get_by_text("Mocker HTTP handling latency",exact=True).wait_for(timeout=9000)
                        page.screenshot(path=str(cfg.grafana_screenshot),full_page=True,timeout=9000)
                        browser.close()
                        screenshot_status="real Grafana UI"
                except Exception as exc:
                    screenshot_status=f"unavailable ({type(exc).__name__})"
            state["phase"]="unbounded"
            wait(lambda:not direct(expr(2)))
            assert not query(expr(2)) and query(expr(3))==[80]
            server.shutdown(); server.server_close(); closed=True
            wait(lambda:direct(expr(4))==[0] and direct(expr(4,1))==[1])
            assert not query(expr(5)) and not query(expr(3))
            (tmp/"targets.json").write_text("[]")
            wait(lambda:direct(expr(4,2))==[1])
            assert query(expr(4,2))==[1] and not query(expr(4))
            evidence={"fixture":"synthetic proposed exporter; no live QaaS or Mocker",
              "network_interfaces":["lo"],"prometheus":get(prom+"/api/v1/status/buildinfo")["data"]["version"],
              "grafana":get(graf+"/api/health")["version"],"panels":len(dash["panels"]),"expressions":len(records),
              "active_range_expressions":sum(bool(x["range_numeric"]) for x in records),
              "controls":["idle hides latency/freshness/ratios","known queue ratio","known ingest and Mocker quantiles",
                 "0.75 hit/(hit+miss)","0.10 error/all accepted","unbounded capacity with known depth",
                 "down target versus absent job"], "grafana_ui_screenshot":screenshot_status,"targets":records}
        finally:
            if not closed:
                server.shutdown();server.server_close()
            thread.join(3)
            for child in processes:
                if child.poll() is None: child.terminate()
            for child in processes:
                try: child.wait(6)
                except subprocess.TimeoutExpired: child.kill(); child.wait(6)
        evidence["owned_processes_stopped"]=all(child.poll() is not None for child in processes)
        with cfg.result.open("x") as f:
            json.dump(evidence,f,indent=2); f.write("\n")
        print(json.dumps({k:v for k,v in evidence.items() if k!="targets"},indent=2))

if __name__=="__main__":
    main()
