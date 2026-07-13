from __future__ import annotations

import json
import os
import sys
from pathlib import Path


SETTINGS = {
    "site_url": ("QAAS_DOCS_SITE_URL", "https://TheSmokeTeam.github.io/qaas-docs/"),
    "repo_name": ("QAAS_DOCS_REPO_NAME", "QaaS.Runner"),
    "repo_url": ("QAAS_DOCS_REPO_URL", "https://github.com/TheSmokeTeam/QaaS.Runner"),
    "social_github_url": (
        "QAAS_DOCS_SOCIAL_GITHUB_URL",
        "https://github.com/TheSmokeTeam/QaaS.Runner",
    ),
    "docs_site": (
        "QAAS_DOCS_LINK_DOCS_SITE",
        "https://TheSmokeTeam.github.io/qaas-docs/",
    ),
    "repository_docs": (
        "QAAS_DOCS_LINK_REPOSITORY_DOCS",
        "https://github.com/TheSmokeTeam/qaas-docs",
    ),
    "repository_runner": (
        "QAAS_DOCS_LINK_REPOSITORY_RUNNER",
        "https://github.com/TheSmokeTeam/QaaS.Runner",
    ),
    "repository_mocker": (
        "QAAS_DOCS_LINK_REPOSITORY_MOCKER",
        "https://github.com/TheSmokeTeam/QaaS.Mocker",
    ),
    "repository_mocker_communication_objects": (
        "QAAS_DOCS_LINK_REPOSITORY_MOCKER_COMMUNICATION_OBJECTS",
        "https://github.com/TheSmokeTeam/Qaas.Mocker.CommunicationObjects",
    ),
    "repository_framework": (
        "QAAS_DOCS_LINK_REPOSITORY_FRAMEWORK",
        "https://github.com/TheSmokeTeam/QaaS.Framework",
    ),
    "repository_assertions": (
        "QAAS_DOCS_LINK_REPOSITORY_ASSERTIONS",
        "https://github.com/TheSmokeTeam/QaaS.Common.Assertions",
    ),
    "repository_generators": (
        "QAAS_DOCS_LINK_REPOSITORY_GENERATORS",
        "https://github.com/TheSmokeTeam/QaaS.Common.Generators",
    ),
    "repository_probes": (
        "QAAS_DOCS_LINK_REPOSITORY_PROBES",
        "https://github.com/TheSmokeTeam/QaaS.Common.Probes",
    ),
    "repository_processors": (
        "QAAS_DOCS_LINK_REPOSITORY_PROCESSORS",
        "https://github.com/TheSmokeTeam/QaaS.Common.Processors",
    ),
    "repository_runner_template": (
        "QAAS_DOCS_LINK_REPOSITORY_RUNNER_TEMPLATE",
        "https://github.com/TheSmokeTeam/QaaS.Runner.Template",
    ),
    "repository_mocker_template": (
        "QAAS_DOCS_LINK_REPOSITORY_MOCKER_TEMPLATE",
        "https://github.com/TheSmokeTeam/QaaS.Mocker.Template",
    ),
    "repository_runner_quickstart_code": (
        "QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_CODE",
        "https://github.com/TheSmokeTeam/DummyAppTests/tree/code_configuration",
    ),
    "repository_runner_quickstart_yaml": (
        "QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_YAML",
        "https://github.com/TheSmokeTeam/DummyAppTests/tree/yaml_configuration",
    ),
    "repository_mocker_quickstart_code": (
        "QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_CODE",
        "https://github.com/TheSmokeTeam/DummyAppMock/tree/code_configuration",
    ),
    "repository_mocker_quickstart_yaml": (
        "QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_YAML",
        "https://github.com/TheSmokeTeam/DummyAppMock/tree/yaml_configuration",
    ),
    "allure_installation_guide": (
        "QAAS_DOCS_LINK_ALLURE_INSTALLATION_GUIDE",
        "https://docs.qameta.io/allure/#_installing_a_commandline",
    ),
    "dotnet_sdk": ("QAAS_DOCS_LINK_DOTNET_SDK", "https://dotnet.microsoft.com/download"),
    "qaas_community": (
        "QAAS_DOCS_LINK_QAAS_COMMUNITY",
        "https://discord.gg/rg2NYT4Mea",
    ),
    "nuget_feed": (
        "QAAS_DOCS_LINK_NUGET_FEED",
        "https://api.nuget.org/v3/index.json",
    ),
    "artifactory": ("QAAS_DOCS_LINK_ARTIFACTORY", "https://jfrog.com/artifactory"),
    "aws_s3_user_metadata": (
        "QAAS_DOCS_LINK_AWS_S3_USER_METADATA",
        "https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingMetadata.html",
    ),
    "aws_s3_head_object": (
        "QAAS_DOCS_LINK_AWS_S3_HEAD_OBJECT",
        "https://docs.aws.amazon.com/AmazonS3/latest/API/API_HeadObject.html",
    ),
    "aws_s3_list_objects_v2": (
        "QAAS_DOCS_LINK_AWS_S3_LIST_OBJECTS_V2",
        "https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html",
    ),
    "aws_s3_prefixes": (
        "QAAS_DOCS_LINK_AWS_S3_PREFIXES",
        "https://docs.aws.amazon.com/AmazonS3/latest/userguide/using-prefixes.html",
    ),
    "regex101_placeholder": (
        "QAAS_DOCS_LINK_REGEX101_PLACEHOLDER",
        "https://regex101.com/?regex=%5C%24%5C%7B.%2A%5C%7D",
    ),
    "json_schema_for_humans": (
        "QAAS_DOCS_LINK_JSON_SCHEMA_FOR_HUMANS",
        "https://github.com/coveooss/json-schema-for-humans",
    ),
    "runner_schema": (
        "QAAS_DOCS_LINK_RUNNER_SCHEMA",
        "../../../assets/schemas/runner-family-schema.json",
    ),
    "mocker_schema": (
        "QAAS_DOCS_LINK_MOCKER_SCHEMA",
        "../../../assets/schemas/mocker-family-schema.json",
    ),
    "image_dotnet_sdk": (
        "QAAS_DOCS_IMAGE_DOTNET_SDK",
        "mcr.microsoft.com/dotnet/sdk:10.0",
    ),
    "image_dotnet_runtime": (
        "QAAS_DOCS_IMAGE_DOTNET_RUNTIME",
        "mcr.microsoft.com/dotnet/runtime:10.0",
    ),
    "image_redis_repository": ("QAAS_DOCS_IMAGE_REDIS_REPOSITORY", "redis"),
    "image_redis_tag": ("QAAS_DOCS_IMAGE_REDIS_TAG", "7-alpine"),
}


def main() -> int:
    if len(sys.argv) != 2:
        raise SystemExit("Usage: write_runtime_link_defaults.py <output-path>")

    output_path = Path(sys.argv[1])
    output_path.parent.mkdir(parents=True, exist_ok=True)

    canonical_defaults = {key: default for key, (_, default) in SETTINGS.items()}
    build_defaults = {
        key: os.environ.get(environment_variable, default)
        for key, (environment_variable, default) in SETTINGS.items()
    }

    output_path.write_text(
        "window.__QAAS_DOCS_CANONICAL_DEFAULTS__ = "
        + json.dumps(canonical_defaults, indent=2, sort_keys=True)
        + ";\nwindow.__QAAS_DOCS_BUILD_DEFAULTS__ = "
        + json.dumps(build_defaults, indent=2, sort_keys=True)
        + ";\n",
        encoding="utf-8",
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
