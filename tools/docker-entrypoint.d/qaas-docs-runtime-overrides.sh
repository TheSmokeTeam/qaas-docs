#!/bin/sh
set -eu

target="/usr/share/nginx/html/assets/javascripts/qaas-docs-runtime-overrides.js"
target_dir="${target%/*}"

mkdir -p "$target_dir"

# Generate the runtime override object in one awk pass so container startup
# does not fork a sed process for every populated QAAS_DOCS_* variable.
awk '
function json_escape(value, escaped) {
  escaped = value
  gsub(/\\/, "\\\\", escaped)
  gsub(/"/, "\\\"", escaped)
  gsub(/\r/, "\\r", escaped)
  gsub(/\n/, "\\n", escaped)
  gsub(/\t/, "\\t", escaped)
  return escaped
}

BEGIN {
  first = 1
  printf "window.__QAAS_DOCS_RUNTIME_OVERRIDES__ = {\n"
}

{
  key = $1
  env_name = $2
  value = ENVIRON[env_name]

  if (value == "") {
    next
  }

  if (!first) {
    printf ",\n"
  }

  printf "  \"%s\": \"%s\"", key, json_escape(value)
  first = 0
}

END {
  printf "\n};\n"
}
' > "$target" <<'EOF'
site_url QAAS_DOCS_SITE_URL
repo_name QAAS_DOCS_REPO_NAME
repo_url QAAS_DOCS_REPO_URL
social_github_url QAAS_DOCS_SOCIAL_GITHUB_URL
docs_site QAAS_DOCS_LINK_DOCS_SITE
repository_docs QAAS_DOCS_LINK_REPOSITORY_DOCS
repository_runner QAAS_DOCS_LINK_REPOSITORY_RUNNER
repository_mocker QAAS_DOCS_LINK_REPOSITORY_MOCKER
repository_mocker_communication_objects QAAS_DOCS_LINK_REPOSITORY_MOCKER_COMMUNICATION_OBJECTS
repository_framework QAAS_DOCS_LINK_REPOSITORY_FRAMEWORK
repository_assertions QAAS_DOCS_LINK_REPOSITORY_ASSERTIONS
repository_generators QAAS_DOCS_LINK_REPOSITORY_GENERATORS
repository_probes QAAS_DOCS_LINK_REPOSITORY_PROBES
repository_processors QAAS_DOCS_LINK_REPOSITORY_PROCESSORS
repository_runner_template QAAS_DOCS_LINK_REPOSITORY_RUNNER_TEMPLATE
repository_mocker_template QAAS_DOCS_LINK_REPOSITORY_MOCKER_TEMPLATE
repository_runner_quickstart_code QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_CODE
repository_runner_quickstart_yaml QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_YAML
repository_mocker_quickstart_code QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_CODE
repository_mocker_quickstart_yaml QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_YAML
allure_installation_guide QAAS_DOCS_LINK_ALLURE_INSTALLATION_GUIDE
dotnet_sdk QAAS_DOCS_LINK_DOTNET_SDK
qaas_community QAAS_DOCS_LINK_QAAS_COMMUNITY
nuget_feed QAAS_DOCS_LINK_NUGET_FEED
artifactory QAAS_DOCS_LINK_ARTIFACTORY
runner_schema QAAS_DOCS_LINK_RUNNER_SCHEMA
mocker_schema QAAS_DOCS_LINK_MOCKER_SCHEMA
EOF
