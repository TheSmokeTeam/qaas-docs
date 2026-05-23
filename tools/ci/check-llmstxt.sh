#!/usr/bin/env bash
set -euo pipefail

SITE_DIR="${1:-site}"
MAX_BYTES="${LLMSTXT_MAX_BYTES:-1000000}"

if [ ! -f "$SITE_DIR/llms.txt" ]; then
  echo "::error::missing $SITE_DIR/llms.txt"
  exit 1
fi

if [ ! -f "$SITE_DIR/llms-full.txt" ]; then
  echo "::error::missing $SITE_DIR/llms-full.txt"
  exit 1
fi

mapfile -t shard_refs < <(grep -oE '\(/llms-full-[^)]+\.txt\)' "$SITE_DIR/llms.txt" | sed -E 's/^\(\/(.*)\)$/\1/' | sort -u)
if [ "${#shard_refs[@]}" -eq 0 ]; then
  echo "::error file=$SITE_DIR/llms.txt::missing full-content shard links"
  exit 1
fi

h1_count=$(grep -c '^# ' "$SITE_DIR/llms.txt" || true)
if [ "$h1_count" -ne 1 ]; then
  echo "::error file=$SITE_DIR/llms.txt::expected exactly one H1, found $h1_count"
  exit 1
fi

if ! awk 'NR > 1 && /^> / { found=1; exit } END { exit found ? 0 : 1 }' "$SITE_DIR/llms.txt"; then
  echo "::error file=$SITE_DIR/llms.txt::missing blockquote summary after H1"
  exit 1
fi

while IFS= read -r line; do
  if [[ "$line" =~ ^-\ \[.+\]\(.+\):\ .+ ]]; then
    continue
  fi
  echo "::error file=$SITE_DIR/llms.txt::invalid link line: $line"
  exit 1
done < <(grep '^- \[' "$SITE_DIR/llms.txt" || true)

while IFS= read -r line; do
  if printf '%s\n' "$line" | grep -Eq '^- \[.+\]\(/llms-full-[^)]+\.txt\): [0-9]+ pages\.$'; then
    continue
  fi
  echo "::error file=$SITE_DIR/llms-full.txt::invalid shard index line: $line"
  exit 1
done < <(grep '^- \[' "$SITE_DIR/llms-full.txt" || true)

for shard in "${shard_refs[@]}"; do
  if [ ! -f "$SITE_DIR/$shard" ]; then
    echo "::error file=$SITE_DIR/llms.txt::referenced shard does not exist: $shard"
    exit 1
  fi

  if ! grep -Fq "(/$shard)" "$SITE_DIR/llms-full.txt"; then
    echo "::error file=$SITE_DIR/llms-full.txt::missing shard index entry for $shard"
    exit 1
  fi
done

for file in "$SITE_DIR"/llms-full-*.txt; do
  [ -f "$file" ] || continue
  shard_name="$(basename "$file")"
  if ! printf '%s\n' "${shard_refs[@]}" | grep -Fxq "$shard_name"; then
    echo "::error file=$file::full-content shard is not linked from llms.txt"
    exit 1
  fi

  shard_h1_count=$(grep -c '^# ' "$file" || true)
  if [ "$shard_h1_count" -lt 1 ]; then
    echo "::error file=$file::full-content shard is missing an H1"
    exit 1
  fi
done

for file in "$SITE_DIR"/llms*.txt; do
  [ -f "$file" ] || continue
  size=$(wc -c < "$file")
  if [ "$size" -gt "$MAX_BYTES" ]; then
    echo "::error file=$file::file is $size bytes, limit is $MAX_BYTES"
    exit 1
  fi
done

echo "[check-llmstxt] OK"
