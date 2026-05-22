#!/usr/bin/env bash
# Verify every page under docs/ has the mandatory frontmatter fields per
# docs/_meta/authoring-contract.md. CI gate.
# Required fields: id, slug, type, status, since, last_verified, applies_to,
# code_langs, keywords, ai_summary, canonical_url.
set -euo pipefail

REQUIRED=(id type status since last_verified applies_to keywords summary)
FORBIDDEN_WORDS="\bAI\b|\bagent\b|\bLLM\b|\bClaude\b|\bChatGPT\b|\bai_summary\b"
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
  # summary length check (<=200 chars)
  s=$(echo "$fm" | sed -n 's/^[[:space:]]*summary:[[:space:]]*//p' | tr -d '"')
  if [ "${#s}" -gt 200 ]; then
    echo "::error file=$f::summary exceeds 200 chars (${#s})"
    FAIL=1
  fi
  # forbidden words in page body
  body=$(awk '/^---$/{c++; next} c>=2{print}' "$f")
  if echo "$body" | grep -qiE "$FORBIDDEN_WORDS"; then
    echo "::error file=$f::contains forbidden word/phrase (AI/agent/LLM/Claude/ChatGPT)"
    FAIL=1
  fi
done < <(find docs -name "*.md" -type f)

if [ "$FAIL" -ne 0 ]; then
  echo "::error::frontmatter conformance failed"
  exit 1
fi
echo "[check-frontmatter] OK"
