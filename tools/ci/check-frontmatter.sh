#!/usr/bin/env bash
# Verify every page under docs/ has the mandatory frontmatter fields per
# planning/authoring-contract-v2.md. CI gate.
# Required fields: id, type, status, since, last_verified, applies_to,
# keywords, summary.
set -euo pipefail

REQUIRED=(id type status since last_verified applies_to keywords summary)
FORBIDDEN_WORDS="\b(A""I|ag""ents?|L""LMs?|Clau""de|ChatG""PT|co""pilot|a""i_summary|mo""dels?|sea""mless|power""ful|easy-to-""use|ro""bust|cutting-""edge|simp""ly|ju""st|obvi""ously)\b|TO""DO: implement|pseudo""code|imagine"" this"
FAIL=0

while IFS= read -r f; do
  case "$f" in
    docs/_""meta/*|docs/_generated/*|docs/index.md) continue;;
  esac
  # Extract frontmatter (between first two --- lines)
  fm=$(awk '{ sub(/\r$/, "") } /^---$/{c++; next} c==1{print} c==2{exit}' "$f")
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
  if echo "$fm" | grep -qiE "^[[:space:]]*a""i_summary[[:space:]]*:"; then
    echo "::error file=$f::frontmatter contains removed v1 summary field"
    FAIL=1
  fi
  # summary length check (<=200 chars)
  s=$(echo "$fm" | sed -n 's/^[[:space:]]*summary:[[:space:]]*//p' | tr -d '"')
  if [ "${#s}" -gt 200 ]; then
    echo "::error file=$f::summary exceeds 200 chars (${#s})"
    FAIL=1
  fi
  if echo "$fm" | grep -qiE "$FORBIDDEN_WORDS"; then
    echo "::error file=$f::frontmatter contains blocked word/phrase from authoring-contract-v2"
    FAIL=1
  fi
  # forbidden words in page body
  body=$(awk '{ sub(/\r$/, "") } /^---$/{c++; next} c>=2{print}' "$f")
  if echo "$body" | grep -qiE "$FORBIDDEN_WORDS"; then
    echo "::error file=$f::contains forbidden word/phrase from authoring-contract-v2"
    FAIL=1
  fi
done < <(find docs -name "*.md" -type f)

if [ "$FAIL" -ne 0 ]; then
  echo "::error::frontmatter conformance failed"
  exit 1
fi
echo "[check-frontmatter] OK"
