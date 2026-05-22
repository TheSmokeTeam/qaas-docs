#!/usr/bin/env bash
# Build the QaaS Docs ZIM locally.
# Requires: docker (openzim/zim-tools image) OR locally-installed zimwriterfs.
# Usage: tools/zim/build-zim.sh [output-path]
set -euo pipefail

OUT="${1:-qaas-docs.zim}"
SITE_DIR="site"

if [ ! -d "$SITE_DIR" ]; then
  echo "[zim] building site first with: mkdocs build --strict"
  mkdocs build --strict --site-dir "$SITE_DIR"
fi

FAVICON="$SITE_DIR/assets/favicon.png"
if [ ! -f "$FAVICON" ]; then
  # MkDocs Material default — fall back to a 1x1 png
  mkdir -p "$SITE_DIR/assets"
  printf '\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x00\x01\x00\x00\x00\x01\x08\x06\x00\x00\x00\x1f\x15\xc4\x89\x00\x00\x00\rIDATx\xdac\xfc\xff\xff?\x00\x05\xfe\x02\xfeA\x86\xd5\xee\x00\x00\x00\x00IEND\xaeB`\x82' > "$FAVICON"
fi

if command -v zimwriterfs >/dev/null 2>&1; then
  echo "[zim] using local zimwriterfs"
  zimwriterfs \
    --welcome=index.html \
    --favicon="$FAVICON" \
    --language=eng \
    --title="QaaS Documentation" \
    --description="QA As A Service — unified documentation, agent-optimized" \
    --creator="TheSmokeTeam" \
    --publisher="TheSmokeTeam" \
    --name=qaas-docs \
    "$SITE_DIR" "$OUT"
elif command -v docker >/dev/null 2>&1; then
  echo "[zim] using docker openzim/zim-tools"
  docker run --rm -v "$PWD":/work -w /work ghcr.io/openzim/zim-tools:latest \
    zimwriterfs \
      --welcome=index.html \
      --favicon="$FAVICON" \
      --language=eng \
      --title="QaaS Documentation" \
      --description="QA As A Service — unified documentation, agent-optimized" \
      --creator="TheSmokeTeam" \
      --publisher="TheSmokeTeam" \
      --name=qaas-docs \
      "$SITE_DIR" "$OUT"
else
  echo "[zim] ERROR: neither zimwriterfs nor docker found." >&2
  echo "       Install: https://download.openzim.org/release/zim-tools/" >&2
  exit 1
fi

echo "[zim] wrote $OUT ($(du -h "$OUT" | cut -f1))"
echo "[zim] verify locally with: kiwix-serve --port 8888 $OUT"
