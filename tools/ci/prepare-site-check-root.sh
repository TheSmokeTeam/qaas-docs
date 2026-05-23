#!/usr/bin/env bash
set -euo pipefail

SITE_DIR="${1:-site}"
CHECK_ROOT="${2:-site-check}"
BASE_PATH="${3:-qaas-docs}"

if [ ! -d "$SITE_DIR" ]; then
  echo "::error::site directory not found: $SITE_DIR" >&2
  exit 1
fi

case "$CHECK_ROOT" in
  "" | "/" | "." | "..")
    echo "::error::unsafe check root: $CHECK_ROOT" >&2
    exit 1
    ;;
esac

rm -rf "$CHECK_ROOT"
mkdir -p "$CHECK_ROOT/$BASE_PATH"
cp -R "$SITE_DIR"/. "$CHECK_ROOT/$BASE_PATH"/

echo "[prepare-site-check-root] copied $SITE_DIR to $CHECK_ROOT/$BASE_PATH"
