#!/usr/bin/env bash
# Extract every ```yaml fenced block from docs/, write to /tmp, and validate
# QaaS configuration snippets against the matching checked-in schema asset.
set -euo pipefail

PYTHON_BIN="${PYTHON_BIN:-python3}"
CHECK_JSONSCHEMA_BIN="${CHECK_JSONSCHEMA_BIN:-check-jsonschema}"
DOCS_SCHEMA_DIR="${QAAS_DOCS_SCHEMA_DIR:-docs/assets/schemas}"
HOOK_SCHEMA_DIR="${QAAS_HOOK_SCHEMA_DIR:-$DOCS_SCHEMA_DIR}"
WORK=$(mktemp -d)
META="$WORK/snippets.tsv"
NORMALIZED_SCHEMA_DIR="$WORK/normalized-schemas"
FAIL=0

if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
  PYTHON_BIN=python
fi

if ! command -v "$CHECK_JSONSCHEMA_BIN" >/dev/null 2>&1; then
  if [ -x "/mnt/c/Users/eldar/AppData/Roaming/Python/Python314/Scripts/check-jsonschema.exe" ]; then
    CHECK_JSONSCHEMA_BIN="/mnt/c/Users/eldar/AppData/Roaming/Python/Python314/Scripts/check-jsonschema.exe"
  fi
fi

if ! command -v "$CHECK_JSONSCHEMA_BIN" >/dev/null 2>&1 && [ ! -x "$CHECK_JSONSCHEMA_BIN" ]; then
  echo "::error::check-jsonschema is not installed; run 'python -m pip install check-jsonschema'"
  exit 1
fi

mkdir -p "$NORMALIZED_SCHEMA_DIR"

normalize_schema() {
  src="$1"
  dst="$2"
  [ -f "$src" ] || return 0
  "$PYTHON_BIN" - "$src" "$dst" <<'PY'
import copy
import json
import pathlib
import sys

src = pathlib.Path(sys.argv[1])
dst = pathlib.Path(sys.argv[2])

def transform(node):
    if isinstance(node, list):
        return [transform(item) for item in node]

    if not isinstance(node, dict):
        return node

    transformed = {key: transform(value) for key, value in node.items()}

    # Some generated schemas mark enum fields as both a literal enum and a
    # ${...} placeholder pattern. JSON Schema interprets that as "must satisfy
    # both", while QaaS accepts either a literal enum value or a placeholder.
    if transformed.get("pattern") == r"\$\{.*\}" and "enum" in transformed:
        literal = copy.deepcopy(transformed)
        literal.pop("pattern", None)
        placeholder = {
            "type": "string",
            "pattern": r"\$\{.*\}",
        }
        return {
            "anyOf": [literal, placeholder],
        }

    return transformed

dst.parent.mkdir(parents=True, exist_ok=True)
dst.write_text(json.dumps(transform(json.loads(src.read_text(encoding="utf-8"))), indent=2) + "\n", encoding="utf-8")
PY
}

normalize_schema "$DOCS_SCHEMA_DIR/runner-family-schema.json" "$NORMALIZED_SCHEMA_DIR/runner-family-schema.json"
normalize_schema "$DOCS_SCHEMA_DIR/mocker-family-schema.json" "$NORMALIZED_SCHEMA_DIR/mocker-family-schema.json"
normalize_schema "$HOOK_SCHEMA_DIR/assertions.schema.json" "$NORMALIZED_SCHEMA_DIR/assertions.schema.json"
normalize_schema "$HOOK_SCHEMA_DIR/generators.schema.json" "$NORMALIZED_SCHEMA_DIR/generators.schema.json"
normalize_schema "$HOOK_SCHEMA_DIR/probes.schema.json" "$NORMALIZED_SCHEMA_DIR/probes.schema.json"
normalize_schema "$HOOK_SCHEMA_DIR/processors.schema.json" "$NORMALIZED_SCHEMA_DIR/processors.schema.json"

extract_blocks() {
  "$PYTHON_BIN" - "$1" "$WORK" "$META" <<'PY'
import sys, os, re, pathlib
md = pathlib.Path(sys.argv[1]).read_text(encoding="utf-8")
out = pathlib.Path(sys.argv[2])
meta = pathlib.Path(sys.argv[3])
rel = pathlib.Path(sys.argv[1]).with_suffix("").as_posix()
stem = re.sub(r"[^A-Za-z0-9_.-]+", "-", rel)
for i, m in enumerate(re.finditer(r"```yaml[^\n]*\n(.*?)```", md, re.S)):
    snippet = out / f"{stem}__{i}.yaml"
    snippet.write_text(m.group(1), encoding="utf-8")
    line = md[:m.start()].count("\n") + 1
    with meta.open("a", encoding="utf-8") as handle:
        handle.write(f"{snippet.name}\t{pathlib.Path(sys.argv[1]).as_posix()}\t{line}\n")
PY
}

find docs -name "*.md" -type f | while read -r f; do
  extract_blocks "$f"
done

count=$(find "$WORK" -name "*.yaml" | wc -l)
echo "[validate-yaml] extracted $count yaml blocks"

classify_snippet() {
  "$PYTHON_BIN" - "$1" "$2" <<'PY'
import pathlib
import sys

try:
    import yaml
except ImportError as exc:
    print(f"parse-error:PyYAML is required for YAML snippet classification: {exc}")
    sys.exit(2)

snippet_path = pathlib.Path(sys.argv[1])
source_path = sys.argv[2].replace("\\", "/")
text = snippet_path.read_text(encoding="utf-8")

if "{{" in text or "{%" in text:
    print("template")
    sys.exit(0)

try:
    documents = list(yaml.safe_load_all(text))
except Exception as exc:
    print("parse-error:" + str(exc).replace("\n", " "))
    sys.exit(0)

if len(documents) != 1:
    print("parse-error:expected one YAML document")
    sys.exit(0)

document = documents[0]
if not isinstance(document, dict):
    print("syntax")
    sys.exit(0)

keys = set(document.keys())
runner_roots = {"MetaData", "Links", "Storages", "DataSources", "Sessions", "Assertions"}
mocker_roots = {"DataSources", "Stubs", "Server", "Servers", "Controller"}

if "/configurationSections/sessions/types/" in source_path and keys <= {"Body", "MetaData"}:
    print("syntax")
elif source_path.startswith("docs/assertions/"):
    print("assertions")
elif source_path.startswith("docs/generators/"):
    print("generators")
elif source_path.startswith("docs/probes/"):
    print("probes")
elif source_path.startswith("docs/processors/"):
    print("processors")
elif "/mocker/" in source_path and keys & mocker_roots:
    print("mocker")
elif ("/qaas/" in source_path or "/runner/" in source_path) and keys & runner_roots:
    print("runner")
elif keys & (runner_roots - mocker_roots):
    print("runner")
elif keys & (mocker_roots - runner_roots):
    print("mocker")
else:
    print("syntax")
PY
}

schema_for_kind() {
  case "$1" in
    runner) echo "$NORMALIZED_SCHEMA_DIR/runner-family-schema.json" ;;
    mocker) echo "$NORMALIZED_SCHEMA_DIR/mocker-family-schema.json" ;;
    assertions) echo "$NORMALIZED_SCHEMA_DIR/assertions.schema.json" ;;
    generators) echo "$NORMALIZED_SCHEMA_DIR/generators.schema.json" ;;
    probes) echo "$NORMALIZED_SCHEMA_DIR/probes.schema.json" ;;
    processors) echo "$NORMALIZED_SCHEMA_DIR/processors.schema.json" ;;
    *) echo "" ;;
  esac
}

for y in "$WORK"/*.yaml; do
  [ -f "$y" ] || continue
  base=$(basename "$y" .yaml)
  source=$(awk -F '\t' -v name="$base.yaml" '$1 == name { print $2; exit }' "$META")
  line=$(awk -F '\t' -v name="$base.yaml" '$1 == name { print $3; exit }' "$META")
  kind=$(classify_snippet "$y" "$source")
  if [[ "$kind" == parse-error:* ]]; then
    echo "::error file=$source,line=$line::${kind#parse-error:}"
    FAIL=1
    continue
  fi
  if [ "$kind" = "template" ]; then
    echo "[validate-yaml] template snippet: $source:$line"
    continue
  fi
  schema=$(schema_for_kind "$kind")
  if [ -n "$schema" ] && [ -f "$schema" ]; then
    schema_arg="$schema"
    yaml_arg="$y"
    if [[ "$CHECK_JSONSCHEMA_BIN" == *.exe ]] && command -v wslpath >/dev/null 2>&1; then
      schema_arg=$(wslpath -w "$schema")
      yaml_arg=$(wslpath -w "$y")
    fi
    if output=$("$CHECK_JSONSCHEMA_BIN" --schemafile "$schema_arg" "$yaml_arg" 2>&1); then
      [ -z "$output" ] || echo "$output"
    else
      echo "$output"
      echo "::error file=$source,line=$line::yaml does not validate against $schema"
      FAIL=1
    fi
  elif [ -n "$schema" ]; then
    echo "::warning file=$source,line=$line::schema for $kind snippets not found at $schema"
  fi
done

rm -rf "$WORK"
[ "$FAIL" -eq 0 ] || exit 1
echo "[validate-yaml] OK"
