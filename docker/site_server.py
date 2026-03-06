import os
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer


def main() -> None:
    host = os.getenv("QAAS_DOCS_HOST", "0.0.0.0")
    port = int(os.getenv("QAAS_DOCS_PORT", "8080"))
    os.chdir("/app/site")
    server = ThreadingHTTPServer((host, port), SimpleHTTPRequestHandler)
    server.serve_forever()


if __name__ == "__main__":
    main()
