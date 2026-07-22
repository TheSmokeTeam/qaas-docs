ARG MKDOCS_MATERIAL_IMAGE=squidfunk/mkdocs-material:9.5
ARG NGINX_IMAGE=nginx:1.27-alpine
FROM ${MKDOCS_MATERIAL_IMAGE} AS build

WORKDIR /docs

# Install pinned docs dependencies.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy docs source.
COPY mkdocs.yml .
COPY docs/ docs/
COPY tools/write_runtime_link_defaults.py tools/write_runtime_link_defaults.py
# Build-time overrides for site metadata and external links. Defaults mirror
# mkdocs.yml so omitted build args preserve the documented docker build behavior.
ARG QAAS_DOCS_SITE_URL=https://TheSmokeTeam.github.io/qaas-docs/
ARG QAAS_DOCS_REPO_NAME=QaaS.Runner
ARG QAAS_DOCS_REPO_URL=https://github.com/TheSmokeTeam/QaaS.Runner
ARG QAAS_DOCS_SOCIAL_GITHUB_URL=https://github.com/TheSmokeTeam/QaaS.Runner
ARG QAAS_DOCS_LINK_DOCS_SITE=https://TheSmokeTeam.github.io/qaas-docs/
ARG QAAS_DOCS_LINK_REPOSITORY_DOCS=https://github.com/TheSmokeTeam/qaas-docs
ARG QAAS_DOCS_LINK_REPOSITORY_RUNNER=https://github.com/TheSmokeTeam/QaaS.Runner
ARG QAAS_DOCS_LINK_REPOSITORY_MOCKER=https://github.com/TheSmokeTeam/QaaS.Mocker
ARG QAAS_DOCS_LINK_REPOSITORY_MOCKER_COMMUNICATION_OBJECTS=https://github.com/TheSmokeTeam/Qaas.Mocker.CommunicationObjects
ARG QAAS_DOCS_LINK_REPOSITORY_FRAMEWORK=https://github.com/TheSmokeTeam/QaaS.Framework
ARG QAAS_DOCS_LINK_REPOSITORY_ASSERTIONS=https://github.com/TheSmokeTeam/QaaS.Common.Assertions
ARG QAAS_DOCS_LINK_REPOSITORY_GENERATORS=https://github.com/TheSmokeTeam/QaaS.Common.Generators
ARG QAAS_DOCS_LINK_REPOSITORY_PROBES=https://github.com/TheSmokeTeam/QaaS.Common.Probes
ARG QAAS_DOCS_LINK_REPOSITORY_PROCESSORS=https://github.com/TheSmokeTeam/QaaS.Common.Processors
ARG QAAS_DOCS_LINK_REPOSITORY_RUNNER_TEMPLATE=https://github.com/TheSmokeTeam/QaaS.Runner.Template
ARG QAAS_DOCS_LINK_REPOSITORY_MOCKER_TEMPLATE=https://github.com/TheSmokeTeam/QaaS.Mocker.Template
ARG QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_CODE=https://github.com/TheSmokeTeam/DummyAppTests/tree/code_configuration
ARG QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_YAML=https://github.com/TheSmokeTeam/DummyAppTests/tree/yaml_configuration
ARG QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_CODE=https://github.com/TheSmokeTeam/DummyAppMock/tree/code_configuration
ARG QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_YAML=https://github.com/TheSmokeTeam/DummyAppMock/tree/yaml_configuration
ARG QAAS_DOCS_LINK_ALLURE_INSTALLATION_GUIDE=https://docs.qameta.io/allure/#_installing_a_commandline
ARG QAAS_DOCS_LINK_DOTNET_SDK=https://dotnet.microsoft.com/download
ARG QAAS_DOCS_LINK_QAAS_COMMUNITY=https://discord.gg/rg2NYT4Mea
ARG QAAS_DOCS_LINK_NUGET_FEED=https://api.nuget.org/v3/index.json
ARG QAAS_DOCS_LINK_ARTIFACTORY=https://jfrog.com/artifactory
ARG QAAS_DOCS_LINK_AWS_S3_USER_METADATA=https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingMetadata.html
ARG QAAS_DOCS_LINK_AWS_S3_HEAD_OBJECT=https://docs.aws.amazon.com/AmazonS3/latest/API/API_HeadObject.html
ARG QAAS_DOCS_LINK_AWS_S3_LIST_OBJECTS_V2=https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html
ARG QAAS_DOCS_LINK_AWS_S3_PREFIXES=https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-prefixes.html
ARG QAAS_DOCS_LINK_REGEX101_PLACEHOLDER=https://regex101.com/?regex=%5C%24%5C%7B.%2A%5C%7D
ARG QAAS_DOCS_LINK_JSON_SCHEMA_FOR_HUMANS=https://github.com/coveooss/json-schema-for-humans
ARG QAAS_DOCS_LINK_RUNNER_SCHEMA=../../../assets/schemas/runner-family-schema.json
ARG QAAS_DOCS_LINK_MOCKER_SCHEMA=../../../assets/schemas/mocker-family-schema.json
ARG QAAS_DOCS_IMAGE_DOTNET_SDK=mcr.microsoft.com/dotnet/sdk:10.0
ARG QAAS_DOCS_IMAGE_DOTNET_RUNTIME=mcr.microsoft.com/dotnet/runtime:10.0
ARG QAAS_DOCS_IMAGE_REDIS_REPOSITORY=redis
ARG QAAS_DOCS_IMAGE_REDIS_TAG=7-alpine

ENV QAAS_DOCS_SITE_URL=${QAAS_DOCS_SITE_URL} \
    QAAS_DOCS_REPO_NAME=${QAAS_DOCS_REPO_NAME} \
    QAAS_DOCS_REPO_URL=${QAAS_DOCS_REPO_URL} \
    QAAS_DOCS_SOCIAL_GITHUB_URL=${QAAS_DOCS_SOCIAL_GITHUB_URL} \
    QAAS_DOCS_LINK_DOCS_SITE=${QAAS_DOCS_LINK_DOCS_SITE} \
    QAAS_DOCS_LINK_REPOSITORY_DOCS=${QAAS_DOCS_LINK_REPOSITORY_DOCS} \
    QAAS_DOCS_LINK_REPOSITORY_RUNNER=${QAAS_DOCS_LINK_REPOSITORY_RUNNER} \
    QAAS_DOCS_LINK_REPOSITORY_MOCKER=${QAAS_DOCS_LINK_REPOSITORY_MOCKER} \
    QAAS_DOCS_LINK_REPOSITORY_MOCKER_COMMUNICATION_OBJECTS=${QAAS_DOCS_LINK_REPOSITORY_MOCKER_COMMUNICATION_OBJECTS} \
    QAAS_DOCS_LINK_REPOSITORY_FRAMEWORK=${QAAS_DOCS_LINK_REPOSITORY_FRAMEWORK} \
    QAAS_DOCS_LINK_REPOSITORY_ASSERTIONS=${QAAS_DOCS_LINK_REPOSITORY_ASSERTIONS} \
    QAAS_DOCS_LINK_REPOSITORY_GENERATORS=${QAAS_DOCS_LINK_REPOSITORY_GENERATORS} \
    QAAS_DOCS_LINK_REPOSITORY_PROBES=${QAAS_DOCS_LINK_REPOSITORY_PROBES} \
    QAAS_DOCS_LINK_REPOSITORY_PROCESSORS=${QAAS_DOCS_LINK_REPOSITORY_PROCESSORS} \
    QAAS_DOCS_LINK_REPOSITORY_RUNNER_TEMPLATE=${QAAS_DOCS_LINK_REPOSITORY_RUNNER_TEMPLATE} \
    QAAS_DOCS_LINK_REPOSITORY_MOCKER_TEMPLATE=${QAAS_DOCS_LINK_REPOSITORY_MOCKER_TEMPLATE} \
    QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_CODE=${QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_CODE} \
    QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_YAML=${QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_YAML} \
    QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_CODE=${QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_CODE} \
    QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_YAML=${QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_YAML} \
    QAAS_DOCS_LINK_ALLURE_INSTALLATION_GUIDE=${QAAS_DOCS_LINK_ALLURE_INSTALLATION_GUIDE} \
    QAAS_DOCS_LINK_DOTNET_SDK=${QAAS_DOCS_LINK_DOTNET_SDK} \
    QAAS_DOCS_LINK_QAAS_COMMUNITY=${QAAS_DOCS_LINK_QAAS_COMMUNITY} \
    QAAS_DOCS_LINK_NUGET_FEED=${QAAS_DOCS_LINK_NUGET_FEED} \
    QAAS_DOCS_LINK_ARTIFACTORY=${QAAS_DOCS_LINK_ARTIFACTORY} \
    QAAS_DOCS_LINK_AWS_S3_USER_METADATA=${QAAS_DOCS_LINK_AWS_S3_USER_METADATA} \
    QAAS_DOCS_LINK_AWS_S3_HEAD_OBJECT=${QAAS_DOCS_LINK_AWS_S3_HEAD_OBJECT} \
    QAAS_DOCS_LINK_AWS_S3_LIST_OBJECTS_V2=${QAAS_DOCS_LINK_AWS_S3_LIST_OBJECTS_V2} \
    QAAS_DOCS_LINK_AWS_S3_PREFIXES=${QAAS_DOCS_LINK_AWS_S3_PREFIXES} \
    QAAS_DOCS_LINK_REGEX101_PLACEHOLDER=${QAAS_DOCS_LINK_REGEX101_PLACEHOLDER} \
    QAAS_DOCS_LINK_JSON_SCHEMA_FOR_HUMANS=${QAAS_DOCS_LINK_JSON_SCHEMA_FOR_HUMANS} \
    QAAS_DOCS_LINK_RUNNER_SCHEMA=${QAAS_DOCS_LINK_RUNNER_SCHEMA} \
    QAAS_DOCS_LINK_MOCKER_SCHEMA=${QAAS_DOCS_LINK_MOCKER_SCHEMA} \
    QAAS_DOCS_IMAGE_DOTNET_SDK=${QAAS_DOCS_IMAGE_DOTNET_SDK} \
    QAAS_DOCS_IMAGE_DOTNET_RUNTIME=${QAAS_DOCS_IMAGE_DOTNET_RUNTIME} \
    QAAS_DOCS_IMAGE_REDIS_REPOSITORY=${QAAS_DOCS_IMAGE_REDIS_REPOSITORY} \
    QAAS_DOCS_IMAGE_REDIS_TAG=${QAAS_DOCS_IMAGE_REDIS_TAG}

RUN python tools/write_runtime_link_defaults.py docs/assets/javascripts/qaas-docs-build-defaults.js \
 && mkdocs build --clean

FROM ${NGINX_IMAGE} AS runtime

COPY tools/nginx.conf /etc/nginx/nginx.conf
COPY tools/docker-entrypoint.d/qaas-docs-runtime-overrides.sh /usr/local/bin/qaas-docs-entrypoint
COPY --from=build /docs/site /usr/share/nginx/html

RUN sed -i 's/\r$//' /usr/local/bin/qaas-docs-entrypoint \
 && chmod 0755 /usr/local/bin/qaas-docs-entrypoint

# The image runs without root by default. OpenShift may replace this with an
# arbitrary UID; all runtime writes and Nginx state stay under /tmp.
USER 101

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/qaas-docs-entrypoint"]
CMD ["nginx", "-g", "daemon off;"]
