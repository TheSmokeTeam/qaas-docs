#!/usr/bin/env bash
set -euo pipefail

image="${QAAS_DOCS_RUNTIME_TEST_IMAGE:-qaas-docs:runtime-ci}"
transfer_image="${QAAS_DOCS_RUNTIME_TRANSFER_IMAGE:-qaas-docs:airgap-transfer-ci}"
port="${QAAS_DOCS_RUNTIME_TEST_PORT:-18080}"
runner_url="https://git.airgap.invalid/qaas/QaaS.Runner"
runner_template_url="https://git.airgap.invalid/qaas/QaaS.Runner.Template"
work="$(mktemp -d)"
active_container=""

cleanup() {
  if [ -n "$active_container" ]; then
    docker rm -f "$active_container" >/dev/null 2>&1 || true
  fi
  rm -rf "$work"
}
trap cleanup EXIT HUP INT TERM

find_browser() {
  if [ -n "${BROWSER_BIN:-}" ] && command -v "$BROWSER_BIN" >/dev/null 2>&1; then
    command -v "$BROWSER_BIN"
    return
  fi

  local candidate
  for candidate in google-chrome google-chrome-stable chromium chromium-browser; do
    if command -v "$candidate" >/dev/null 2>&1; then
      command -v "$candidate"
      return
    fi
  done

  echo "::error::A Chromium-compatible browser is required for the runtime image DOM test." >&2
  return 1
}

wait_for_container() {
  local base_url="$1"
  local attempt
  for attempt in $(seq 1 60); do
    if curl -fsS "$base_url/" >/dev/null 2>&1; then
      return
    fi
    if [ "$(docker inspect --format '{{.State.Running}}' "$active_container" 2>/dev/null || true)" != "true" ]; then
      docker logs "$active_container" >&2 || true
      echo "::error::Runtime container exited before becoming ready." >&2
      return 1
    fi
    sleep 1
  done

  docker logs "$active_container" >&2 || true
  echo "::error::Runtime container did not become ready within 60 seconds." >&2
  return 1
}

stop_container() {
  docker rm -f "$active_container" >/dev/null
  active_container=""
}

assert_default_runtime() {
  local candidate_image="$1"
  local base_url="http://127.0.0.1:$port"
  active_container="qaas-docs-runtime-default"

  docker run --detach --name "$active_container" \
    --publish "127.0.0.1:$port:8000" \
    "$candidate_image" >/dev/null
  wait_for_container "$base_url"

  curl -fsS "$base_url/assets/javascripts/qaas-docs-runtime-overrides.min.js" \
    > "$work/default-overrides.js"
  if grep -Fq 'repository_runner_template' "$work/default-overrides.js"; then
    echo "::error::The no-env image unexpectedly contains a Runner.Template override." >&2
    return 1
  fi

  stop_container
}

assert_airgap_runtime() {
  local candidate_image="$1"
  local base_url="http://127.0.0.1:$port"
  local browser
  browser="$(find_browser)"
  active_container="qaas-docs-runtime-openshift"

  docker run --detach --name "$active_container" \
    --user "1001230000:0" \
    --read-only \
    --tmpfs "/tmp:rw,nosuid,nodev,size=64m" \
    --publish "127.0.0.1:$port:8000" \
    --env "QAAS_DOCS_LINK_REPOSITORY_RUNNER=$runner_url" \
    --env "QAAS_DOCS_LINK_REPOSITORY_RUNNER_TEMPLATE=$runner_template_url" \
    "$candidate_image" >/dev/null
  wait_for_container "$base_url"

  for asset in \
    qaas-docs-runtime-overrides.js \
    qaas-docs-runtime-overrides.min.js; do
    curl -fsS "$base_url/assets/javascripts/$asset" > "$work/$asset"
    grep -Fq "\"repository_runner_template\": \"$runner_template_url\"" "$work/$asset"
  done

  curl -fsSI "$base_url/assets/javascripts/qaas-docs-runtime-overrides.min.js" \
    | tr -d '\r' \
    | grep -Eqi '^cache-control: .*no-store'

  "$browser" \
    --headless=new \
    --no-sandbox \
    --disable-gpu \
    --disable-dev-shm-usage \
    --virtual-time-budget=5000 \
    --dump-dom "$base_url/qaas/quickStart/installation/" \
    > "$work/installation.html"
  grep -Fq "href=\"$runner_template_url\"" "$work/installation.html"

  stop_container
}

if [ "${QAAS_DOCS_RUNTIME_SKIP_BUILD:-false}" != "true" ]; then
  docker build --tag "$image" .
fi

test "$(docker image inspect "$image" --format '{{.Config.User}}')" = "101"
test "$(docker image inspect "$image" --format '{{json .Config.Entrypoint}}')" \
  = '["/usr/local/bin/qaas-docs-entrypoint"]'

assert_default_runtime "$image"

docker tag "$image" "$transfer_image"
docker image save "$transfer_image" | gzip --best > "$work/qaas-docs-image.tgz"
gzip --test "$work/qaas-docs-image.tgz"
docker image rm "$transfer_image" >/dev/null
gzip --decompress --stdout "$work/qaas-docs-image.tgz" | docker image load >/dev/null

assert_airgap_runtime "$transfer_image"

echo "[runtime-image] OK: saved image honors Helm env overrides under an OpenShift-style arbitrary UID and read-only root"
