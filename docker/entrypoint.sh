#!/bin/sh
set -eu

PORT="${PORT:-8000}"

echo "Building docs with runtime environment overrides..."
mkdocs build --clean

echo "Serving docs on 0.0.0.0:${PORT}"
exec python -m http.server "${PORT}" --bind 0.0.0.0 --directory /docs/site
