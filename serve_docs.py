"""Build and serve the docs site for the Docker runtime image."""

from __future__ import annotations

import os
import subprocess
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path


DOCS_ROOT = Path("/docs")
SITE_DIR = Path("/site")


def has_runtime_overrides() -> bool:
    """Return True when non-empty QAAS_DOCS runtime overrides were provided."""
    return any(
        key.startswith("QAAS_DOCS_") and bool(value)
        for key, value in os.environ.items()
    )


def build_site() -> None:
    """Rebuild the static site with the current environment overrides."""
    subprocess.run(
        ["mkdocs", "build", "--clean", "--site-dir", str(SITE_DIR)],
        cwd=DOCS_ROOT,
        check=True,
    )


def serve_site() -> None:
    """Serve the static site directory over HTTP."""
    port = int(os.environ.get("PORT", "8000"))
    handler = partial(SimpleHTTPRequestHandler, directory=str(SITE_DIR))
    server = ThreadingHTTPServer(("0.0.0.0", port), handler)
    server.serve_forever()


def main() -> None:
    """Build the site when required and start the HTTP server."""
    if not SITE_DIR.exists() or has_runtime_overrides():
        build_site()

    serve_site()


if __name__ == "__main__":
    main()
