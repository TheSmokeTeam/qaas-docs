#!/usr/bin/env bash
# Extract every ```yaml fenced block from docs/, write to /tmp, validate against
# the matching schema in D:/QaaS/QaaS.JsonSchemaExtensions/schemas/.
# Heuristic schema match: filename prefix → schema name.
set -euo pipefail

SCHEMAS_REPO="${QAAS_SCHEMAS_REPO:-../QaaS.JsonSchemaExtensions}"
WORK=$(mktemp -d)
FAIL=0

if [ ! -d "$SCHEMAS_REPO/schemas" ]; then
  echo "::warning::schemas repo not found at $SCHEMAS_REPO/schemas — skipping YAML snippet validation"
  exit 0
fi

extract_blocks() {
  python - "$1" "$WORK" <<'PY'
import sys, os, re, pathlib
md = pathlib.Path(sys.argv[1]).read_text(encoding="utf-8")
out = pathlib.Path(sys.argv[2])
stem = pathlib.Path(sys.argv[1]).stem
for i, m in enumerate(re.finditer(r"```yaml\n(.*?)```", md, re.S)):
    (out / f"{stem}__{i}.yaml").write_text(m.group(1), encoding="utf-8")
PY
}

find docs -name "*.md" -type f | while read -r f; do
  extract_blocks "$f"
done

count=$(find "$WORK" -name "*.yaml" | wc -l)
echo "[validate-yaml] extracted $count yaml blocks"

# Match snippet path prefix to schema; best-effort
for y in "$WORK"/*.yaml; do
  [ -f "$y" ] || continue
  base=$(basename "$y" .yaml)
  schema=""
  case "$base" in
    runner-*|*-runner*) schema="$SCHEMAS_REPO/schemas/runner.json" ;;
    mocker-*|*-mocker*) schema="$SCHEMAS_REPO/schemas/mocker.json" ;;
    *-assertion*) schema="$SCHEMAS_REPO/schemas/assertions.json" ;;
    *-generator*) schema="$SCHEMAS_REPO/schemas/generators.json" ;;
    *-probe*) schema="$SCHEMAS_REPO/schemas/probes.json" ;;
    *-processor*) schema="$SCHEMAS_REPO/schemas/processors.json" ;;
  esac
  if [ -n "$schema" ] && [ -f "$schema" ]; then
    if ! check-jsonschema --schemafile "$schema" "$y" 2>&1 | grep -v "^$"; then
      echo "::error file=$y::yaml does not validate against $schema"
      FAIL=1
    fi
  fi
done

rm -rf "$WORK"
[ "$FAIL" -eq 0 ] || exit 1
echo "[validate-yaml] OK"
