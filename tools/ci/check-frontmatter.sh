#!/usr/bin/env bash
# Verify every page under docs/ has the mandatory frontmatter fields per
# docs/_meta/authoring-contract.md. CI gate.
# Required fields: id, slug, type, status, since, last_verified, applies_to,
# code_langs, keywords, ai_summary, canonical_url.
set -euo pipefail

REQUIRED=(id slug type status since last_verified applies_to code_langs keywords ai_summary canonical_url)
FAIL=0

while IFS= read -r f; do
  case "$f" in
    docs/_meta/*|docs/_generated/*|docs/index.md) continue;;
  esac
  # Extract frontmatter (between first two --- lines)
  fm=$(awk '/^---$/{c++; next} c==1{print} c==2{exit}' "$f")
  if [ -z "$fm" ]; then
    echo "::error file=$f::missing frontmatter block"
    FAIL=1
    continue
  fi
  for k in "${REQUIRED[@]}"; do
    if ! echo "$fm" | grep -qE "^[[:space:]]*${k}[[:space:]]*:"; then
      echo "::error file=$f::frontmatter missing required field: $k"
      FAIL=1
    fi
  done
  # ai_summary length check (<=280 chars)
  ai=$(echo "$fm" | sed -n 's/^[[:space:]]*ai_summary:[[:space:]]*//p' | tr -d '"')
  if [ "${#ai}" -gt 280 ]; then
    echo "::error file=$f::ai_summary exceeds 280 chars (${#ai})"
    FAIL=1
  fi
done < <(find docs -name "*.md" -type f)

if [ "$FAIL" -ne 0 ]; then
  echo "::error::frontmatter conformance failed"
  exit 1
fi
echo "[check-frontmatter] OK"
