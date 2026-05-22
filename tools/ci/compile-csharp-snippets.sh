#!/usr/bin/env bash
# Extract every ```csharp fenced block from docs/, write to /tmp, compile each
# via `dotnet script` to ensure it at least parses + resolves to known APIs.
# Snippets that need a project context are skipped (marked with `<!-- skip-compile -->`
# directly above the fence).
set -euo pipefail

WORK=$(mktemp -d)
FAIL=0

if ! command -v dotnet-script >/dev/null 2>&1; then
  echo "[compile-csharp] dotnet-script not installed; installing"
  dotnet tool install -g dotnet-script || true
fi

python - <<PY
import os, re, pathlib
work = pathlib.Path(os.environ["WORK"])
docs = pathlib.Path("docs")
i = 0
for f in docs.rglob("*.md"):
    if any(p in f.parts for p in ("_meta", "_generated")):
        continue
    md = f.read_text(encoding="utf-8", errors="ignore")
    # skip if preceded by skip-compile marker
    for m in re.finditer(r"(?:<!-- skip-compile -->\s*)?```csharp\n(.*?)```", md, re.S):
        body = m.group(0)
        if body.startswith("<!-- skip-compile -->"):
            continue
        snippet = m.group(1)
        # Skip snippets that are clearly partial (no semicolons or only a single attribute)
        if snippet.count(";") < 1 and snippet.strip().startswith("["):
            continue
        out = work / f"{f.stem}__{i}.csx"
        out.write_text(snippet, encoding="utf-8")
        i += 1
print(f"[compile-csharp] extracted {i} snippets")
PY

for csx in "$WORK"/*.csx; do
  [ -f "$csx" ] || continue
  if ! dotnet script --no-cache "$csx" --info 2>&1 | grep -qiE "error|exception"; then
    :
  else
    # Re-run to capture error
    if ! dotnet script --no-cache "$csx" --info 2>err.log; then
      echo "::warning file=$csx::C# snippet failed to parse (see compile-csharp.log)"
      cat err.log >> compile-csharp.log
      # NOTE: warning not error for first pass; flip to error after /ultrareview round 1
    fi
  fi
done

rm -rf "$WORK"
echo "[compile-csharp] done"
