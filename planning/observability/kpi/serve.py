import argparse
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import json
from pathlib import Path
from model import build, exposition

FIXTURE = Path(__file__).resolve().parent/"fixtures/input.json"

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument("--port",type=int,default=19332)
    parser.add_argument("--fixture",type=Path,default=FIXTURE)
    parser.add_argument("--print",action="store_true")
    a=parser.parse_args()
    payload=exposition(list(build(json.loads(a.fixture.read_text())))).encode()
    if a.print:
        print(payload.decode(),end="")
        return
    class Handler(BaseHTTPRequestHandler):
        def do_GET(self):
            if self.path != "/metrics":
                self.send_error(404)
                return
            self.send_response(200)
            self.send_header("Content-Type","text/plain; version=0.0.4; charset=utf-8")
            self.send_header("Content-Length",str(len(payload)))
            self.end_headers()
            self.wfile.write(payload)
    with ThreadingHTTPServer(("127.0.0.1",a.port),Handler) as server:
        server.serve_forever()

if __name__=="__main__": main()
