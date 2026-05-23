#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

PYTHON_RUNNER=()

python_has_mkdocs() {
  "$@" -c "import mkdocs" >/dev/null 2>&1
}

if [ -n "${PYTHON_BIN:-}" ]; then
  if command -v "$PYTHON_BIN" >/dev/null 2>&1 && python_has_mkdocs "$PYTHON_BIN"; then
    PYTHON_RUNNER=("$PYTHON_BIN")
  else
    echo "::error::PYTHON_BIN is set but cannot import mkdocs: $PYTHON_BIN" >&2
    exit 1
  fi
else
  for candidate in python python3 python.exe; do
    if command -v "$candidate" >/dev/null 2>&1 && python_has_mkdocs "$candidate"; then
      PYTHON_RUNNER=("$candidate")
      break
    fi
  done
fi

if [ "${#PYTHON_RUNNER[@]}" -eq 0 ] && command -v cmd.exe >/dev/null 2>&1; then
  if cmd.exe /d /c python -c "import mkdocs" >/dev/null 2>&1; then
    PYTHON_RUNNER=(cmd.exe /d /c python)
  fi
fi

if [ "${#PYTHON_RUNNER[@]}" -eq 0 ]; then
  echo "::error::python with MkDocs dependencies not found" >&2
  exit 1
fi

run_python() {
  "${PYTHON_RUNNER[@]}" "$@"
}

resolve_lychee() {
  if [ -n "${LYCHEE_BIN:-}" ]; then
    if [ -x "$LYCHEE_BIN" ] || command -v "$LYCHEE_BIN" >/dev/null 2>&1; then
      printf '%s\n' "$LYCHEE_BIN"
      return 0
    fi

    echo "::error::LYCHEE_BIN is set but is not executable: $LYCHEE_BIN" >&2
    return 1
  fi

  if command -v lychee >/dev/null 2>&1; then
    command -v lychee
    return 0
  fi

  local workspace_root
  workspace_root="$(dirname "$REPO_ROOT")"

  local candidates=(
    "$workspace_root/_tmp/qaas-docs-link-tools/lychee-v0.24.2/lychee-x86_64-pc-windows-msvc/lychee.exe"
    "$workspace_root/_tmp/qaas-docs-link-tools/lychee-v0.24.2/lychee-x86_64-unknown-linux-gnu/lychee"
    "/mnt/d/QaaS/_tmp/qaas-docs-link-tools/lychee-v0.24.2/lychee-x86_64-pc-windows-msvc/lychee.exe"
    "/d/QaaS/_tmp/qaas-docs-link-tools/lychee-v0.24.2/lychee-x86_64-pc-windows-msvc/lychee.exe"
  )

  local candidate
  for candidate in "${candidates[@]}"; do
    if [ -x "$candidate" ] || [ -f "$candidate" ]; then
      printf '%s\n' "$candidate"
      return 0
    fi
  done

  echo "::error::lychee not found. Install lychee or set LYCHEE_BIN to the binary path." >&2
  return 1
}

to_windows_path() {
  if command -v wslpath >/dev/null 2>&1; then
    wslpath -w "$1"
  elif command -v cygpath >/dev/null 2>&1; then
    cygpath -w "$1"
  else
    printf '%s\n' "$1"
  fi
}

ps_quote() {
  local value
  value="${1//\'/\'\'}"
  printf "'%s'" "$value"
}

run_lychee_offline() {
  if [[ "$LYCHEE_BIN_RESOLVED" == *.exe ]] && command -v powershell.exe >/dev/null 2>&1; then
    local repo_root_win
    local root_dir_win
    local lychee_bin_win
    local ps_command
    repo_root_win="$(to_windows_path "$REPO_ROOT")"
    root_dir_win="$(to_windows_path "$PWD/site-check")"
    lychee_bin_win="$(to_windows_path "$LYCHEE_BIN_RESOLVED")"
    ps_command="Set-Location -LiteralPath $(ps_quote "$repo_root_win"); & $(ps_quote "$lychee_bin_win") --offline --config 'tools\ci\lychee.toml' --root-dir $(ps_quote "$root_dir_win") 'site-check/**/*.html'; if (\$LASTEXITCODE -ne 0) { exit \$LASTEXITCODE }"

    powershell.exe -NoLogo -NoProfile -Command "$ps_command"
    return
  fi

  "$LYCHEE_BIN_RESOLVED" --offline --config tools/ci/lychee.toml --root-dir "$PWD/site-check" "site-check/**/*.html"
}

LYCHEE_BIN_RESOLVED="$(resolve_lychee)"

echo "[pre-commit] markdownlint"
npx --yes markdownlint-cli2 "docs/**/*.md" "#docs/_generated/**"

echo "[pre-commit] mkdocs build"
run_python -m mkdocs build --strict --site-dir site

echo "[pre-commit] llms.txt"
run_python tools/build_llmstxt.py --site-dir site
bash tools/ci/check-llmstxt.sh site

echo "[pre-commit] prepare offline link-check root"
bash tools/ci/prepare-site-check-root.sh site site-check qaas-docs

echo "[pre-commit] lychee offline"
run_lychee_offline

echo "[pre-commit] OK"
