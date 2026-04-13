FROM squidfunk/mkdocs-material:9.5 AS build

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
ARG QAAS_DOCS_LINK_RUNNER_SCHEMA=../../assets/schemas/runner-family-schema.json
ARG QAAS_DOCS_LINK_MOCKER_SCHEMA=../../assets/schemas/mocker-family-schema.json

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
    QAAS_DOCS_LINK_RUNNER_SCHEMA=${QAAS_DOCS_LINK_RUNNER_SCHEMA} \
    QAAS_DOCS_LINK_MOCKER_SCHEMA=${QAAS_DOCS_LINK_MOCKER_SCHEMA}

RUN python tools/write_runtime_link_defaults.py docs/assets/javascripts/qaas-docs-build-defaults.js \
 && mkdocs build --clean

FROM nginx:1.27-alpine AS runtime

COPY tools/nginx.conf /etc/nginx/conf.d/default.conf
COPY tools/docker-entrypoint.d/qaas-docs-runtime-overrides.sh /docker-entrypoint.d/qaas-docs-runtime-overrides.sh
COPY --from=build /docs/site /usr/share/nginx/html

RUN chmod +x /docker-entrypoint.d/qaas-docs-runtime-overrides.sh

EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]
