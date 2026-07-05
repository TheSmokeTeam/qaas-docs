#!/usr/bin/env bash
# Build the QaaS Docs ZIM locally.
# Requires: docker (openzim/zim-tools:3.7.0 image) OR locally-installed zimwriterfs.
# Usage: tools/zim/build-zim.sh [output-path]
set -euo pipefail

OUT="${1:-qaas-docs.zim}"
SITE_DIR="${SITE_DIR:-site}"
ZIM_ROOT="${ZIM_ROOT:-site-zim}"
BASE_PATH="${BASE_PATH:-qaas-docs}"
ZIM_TOOLS_IMAGE="${QAAS_DOCS_ZIM_TOOLS_IMAGE:-ghcr.io/openzim/zim-tools:3.7.0}"
ZIM_TOOLS_DOWNLOAD_URL="${QAAS_DOCS_ZIM_TOOLS_DOWNLOAD_URL:-https://download.openzim.org/release/zim-tools/}"
KIWIX_SERVE_IMAGE="${QAAS_DOCS_KIWIX_SERVE_IMAGE:-ghcr.io/kiwix/kiwix-serve:3.8.2}"

if [ ! -d "$SITE_DIR" ]; then
  echo "[zim] building site first with: mkdocs build --strict"
  mkdocs build --strict --site-dir "$SITE_DIR"
fi

PYTHON_BIN="${PYTHON_BIN:-}"
if [ -z "$PYTHON_BIN" ]; then
  if command -v python >/dev/null 2>&1; then
    PYTHON_BIN="python"
  elif command -v python3 >/dev/null 2>&1; then
    PYTHON_BIN="python3"
  fi
fi

if [ -f "tools/build_llmstxt.py" ]; then
  if [ -z "$PYTHON_BIN" ]; then
    echo "[zim] ERROR: python is required to build llms.txt shards." >&2
    exit 1
  fi
  echo "[zim] building llms.txt shards"
  "$PYTHON_BIN" tools/build_llmstxt.py --site-dir "$SITE_DIR"
fi

if [ -f "tools/ci/check-llmstxt.sh" ]; then
  echo "[zim] validating llms.txt shards"
  bash tools/ci/check-llmstxt.sh "$SITE_DIR"
fi

case "$ZIM_ROOT" in
  "" | "/" | "." | "..")
    echo "[zim] ERROR: unsafe ZIM root: $ZIM_ROOT" >&2
    exit 1
    ;;
esac

rm -rf "$ZIM_ROOT"
mkdir -p "$ZIM_ROOT/$BASE_PATH"
cp -R "$SITE_DIR"/. "$ZIM_ROOT/$BASE_PATH"/

HTML_DIR="$ZIM_ROOT"
WELCOME="$BASE_PATH/index.html"
ILLUSTRATION_REL="$BASE_PATH/assets/zim-illustration.png"
ILLUSTRATION="$HTML_DIR/$ILLUSTRATION_REL"
REDIRECTS="$ZIM_ROOT/redirects.tsv"
if [ ! -f "$ILLUSTRATION" ]; then
  mkdir -p "$(dirname "$ILLUSTRATION")"
  printf '%s' 'iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAARUlEQVR42u3PMQ0AAAgAILPYxzT2n1bwdeMgAJHV81kICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICFwDC5eD6fEEqWi1AAAAAElFTkSuQmCC' | base64 -d > "$ILLUSTRATION"
fi

{
  find "$HTML_DIR" -name index.html | sort | while IFS= read -r index_file; do
    rel="${index_file#"$HTML_DIR"/}"
    dir="${rel%/index.html}/"
    title="${dir%/}"
    printf '%s\t%s\t%s\n' "$dir" "$title" "$rel"
    printf '%s\t%s\t%s\n' "${dir%/}" "$title" "$rel"
    parent="${dir%/}"
    parent="${parent%/*}"
    parent_target=""
    while [ -n "$parent" ]; do
      if [ -f "$HTML_DIR/$parent/index.html" ]; then
        parent_target="$parent/index.html"
        break
      fi
      parent="${parent%/*}"
    done
    if [ -z "$parent_target" ]; then
      parent_target="$WELCOME"
    fi
    printf '%s\t%s\t%s\n' "${dir%/}/.." "$title" "$parent_target"
  done
  find "$HTML_DIR" -type d | sort | while IFS= read -r directory; do
    rel="${directory#"$HTML_DIR"/}"
    if [ "$rel" = "$directory" ]; then
      continue
    fi
    parent="$rel"
    parent="${parent%/*}"
    parent_target=""
    while [ -n "$parent" ]; do
      if [ -f "$HTML_DIR/$parent/index.html" ]; then
        parent_target="$parent/index.html"
        break
      fi
      parent="${parent%/*}"
    done
    if [ -z "$parent_target" ]; then
      parent_target="$WELCOME"
    fi
    printf '%s\t%s\t%s\n' "$rel/.." "$rel" "$parent_target"
  done
  printf '%s\t%s\t%s\n' "$BASE_PATH/." "$BASE_PATH" "$WELCOME"
} | sort -u > "$REDIRECTS"

if [ -z "${MAGIC:-}" ]; then
  for magic_file in /usr/share/file/magic.mgc /usr/share/misc/magic.mgc; do
    if [ -f "$magic_file" ]; then
      export MAGIC="$magic_file"
      break
    fi
  done
fi

COMMON_ARGS=(
  --welcome="$WELCOME"
  --illustration="$ILLUSTRATION_REL"
  --language=eng
  --name=qaas-docs
  --title="QaaS Documentation"
  --description="Offline QaaS docs (runner, framework, mocker, common-*)"
  --longDescription="Self-contained offline build of qaas-docs (MkDocs Material)."
  --creator="TheSmokeTeam"
  --publisher="TheSmokeTeam"
  --tags="qaas;docs;offline"
  --redirects="$REDIRECTS"
  --withFullTextIndex
  --scraper="zimwriterfs/3.7.0"
)

if command -v zimwriterfs >/dev/null 2>&1; then
  echo "[zim] using local zimwriterfs"
  zimwriterfs "${COMMON_ARGS[@]}" "$HTML_DIR" "$OUT"
elif command -v docker >/dev/null 2>&1; then
  echo "[zim] using docker $ZIM_TOOLS_IMAGE"
  docker run --rm -v "$PWD":/work -w /work "$ZIM_TOOLS_IMAGE" \
    zimwriterfs "${COMMON_ARGS[@]}" "$HTML_DIR" "$OUT"
else
  echo "[zim] ERROR: neither zimwriterfs nor docker found." >&2
  echo "       Install: $ZIM_TOOLS_DOWNLOAD_URL" >&2
  exit 1
fi

echo "[zim] wrote $OUT ($(du -h "$OUT" | cut -f1))"
echo "[zim] verify locally with:"
echo "       docker run --rm --entrypoint /usr/local/bin/kiwix-serve -p 8888:8888 \\"
echo "         -v \"$(cd "$(dirname "$OUT")" && pwd):/data\" $KIWIX_SERVE_IMAGE \\"
echo "         --port 8888 --threads 4 --nodatealiases /data/$(basename "$OUT")"
