#!/bin/sh
set -eu

target="/usr/share/nginx/html/assets/javascripts/qaas-docs-runtime-overrides.js"

json_escape() {
  printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'
}

first=1
write_entry() {
  key="$1"
  value="${2:-}"

  if [ -z "$value" ]; then
    return
  fi

  if [ "$first" -eq 0 ]; then
    printf ',\n' >> "$target"
  fi

  printf '  "%s": "%s"' "$key" "$(json_escape "$value")" >> "$target"
  first=0
}

mkdir -p "$(dirname "$target")"
printf 'window.__QAAS_DOCS_RUNTIME_OVERRIDES__ = {\n' > "$target"

write_entry "site_url" "${QAAS_DOCS_SITE_URL:-}"
write_entry "repo_url" "${QAAS_DOCS_REPO_URL:-}"
write_entry "social_github_url" "${QAAS_DOCS_SOCIAL_GITHUB_URL:-}"
write_entry "docs_site" "${QAAS_DOCS_LINK_DOCS_SITE:-}"
write_entry "repository_docs" "${QAAS_DOCS_LINK_REPOSITORY_DOCS:-}"
write_entry "repository_runner" "${QAAS_DOCS_LINK_REPOSITORY_RUNNER:-}"
write_entry "repository_mocker" "${QAAS_DOCS_LINK_REPOSITORY_MOCKER:-}"
write_entry "repository_mocker_communication_objects" "${QAAS_DOCS_LINK_REPOSITORY_MOCKER_COMMUNICATION_OBJECTS:-}"
write_entry "repository_framework" "${QAAS_DOCS_LINK_REPOSITORY_FRAMEWORK:-}"
write_entry "repository_assertions" "${QAAS_DOCS_LINK_REPOSITORY_ASSERTIONS:-}"
write_entry "repository_generators" "${QAAS_DOCS_LINK_REPOSITORY_GENERATORS:-}"
write_entry "repository_probes" "${QAAS_DOCS_LINK_REPOSITORY_PROBES:-}"
write_entry "repository_processors" "${QAAS_DOCS_LINK_REPOSITORY_PROCESSORS:-}"
write_entry "repository_runner_template" "${QAAS_DOCS_LINK_REPOSITORY_RUNNER_TEMPLATE:-}"
write_entry "repository_mocker_template" "${QAAS_DOCS_LINK_REPOSITORY_MOCKER_TEMPLATE:-}"
write_entry "repository_runner_quickstart_code" "${QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_CODE:-}"
write_entry "repository_runner_quickstart_yaml" "${QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_YAML:-}"
write_entry "repository_mocker_quickstart_code" "${QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_CODE:-}"
write_entry "repository_mocker_quickstart_yaml" "${QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_YAML:-}"
write_entry "allure_installation_guide" "${QAAS_DOCS_LINK_ALLURE_INSTALLATION_GUIDE:-}"
write_entry "dotnet_sdk" "${QAAS_DOCS_LINK_DOTNET_SDK:-}"
write_entry "qaas_community" "${QAAS_DOCS_LINK_QAAS_COMMUNITY:-}"
write_entry "nuget_feed" "${QAAS_DOCS_LINK_NUGET_FEED:-}"
write_entry "artifactory" "${QAAS_DOCS_LINK_ARTIFACTORY:-}"
write_entry "runner_schema" "${QAAS_DOCS_LINK_RUNNER_SCHEMA:-}"
write_entry "mocker_schema" "${QAAS_DOCS_LINK_MOCKER_SCHEMA:-}"

printf '\n};\n' >> "$target"
