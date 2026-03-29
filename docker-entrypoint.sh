#!/bin/sh
set -eu

site_dir="/site"
port="${PORT:-8000}"

if [ ! -d "$site_dir" ] || printenv | grep -Eq '^QAAS_DOCS_.+=.+$'; then
  echo "Building docs site with current QAAS_DOCS_* environment."
  rm -rf "$site_dir"
  mkdocs build --clean --site-dir "$site_dir"
fi

exec python -m http.server "$port" --bind 0.0.0.0 --directory "$site_dir"
