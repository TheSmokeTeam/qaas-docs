#!/bin/sh
set -eu

runtime_dir="/tmp/qaas-docs"
target="$runtime_dir/runtime-overrides.js"
temporary_target=""

umask 022
mkdir -p "$runtime_dir"
temporary_target="$(mktemp "$runtime_dir/.runtime-overrides.XXXXXX")"
trap 'rm -f "$temporary_target"' EXIT HUP INT TERM

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
' > "$temporary_target" <<'EOF'
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
aws_s3_user_metadata QAAS_DOCS_LINK_AWS_S3_USER_METADATA
aws_s3_head_object QAAS_DOCS_LINK_AWS_S3_HEAD_OBJECT
aws_s3_list_objects_v2 QAAS_DOCS_LINK_AWS_S3_LIST_OBJECTS_V2
aws_s3_prefixes QAAS_DOCS_LINK_AWS_S3_PREFIXES
regex101_placeholder QAAS_DOCS_LINK_REGEX101_PLACEHOLDER
json_schema_for_humans QAAS_DOCS_LINK_JSON_SCHEMA_FOR_HUMANS
runner_schema QAAS_DOCS_LINK_RUNNER_SCHEMA
mocker_schema QAAS_DOCS_LINK_MOCKER_SCHEMA
image_dotnet_sdk QAAS_DOCS_IMAGE_DOTNET_SDK
image_dotnet_runtime QAAS_DOCS_IMAGE_DOTNET_RUNTIME
image_redis_repository QAAS_DOCS_IMAGE_REDIS_REPOSITORY
image_redis_tag QAAS_DOCS_IMAGE_REDIS_TAG
EOF

chmod 0644 "$temporary_target"
mv -f "$temporary_target" "$target"
temporary_target=""
trap - EXIT HUP INT TERM

exec "$@"
