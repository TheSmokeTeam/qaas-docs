from __future__ import annotations

import json
import os
import sys
from pathlib import Path


def resolve_value(name: str, default: str) -> str:
    return os.environ.get(name, default)


def main() -> int:
    if len(sys.argv) != 2:
        raise SystemExit("Usage: write_runtime_link_defaults.py <output-path>")

    output_path = Path(sys.argv[1])
    output_path.parent.mkdir(parents=True, exist_ok=True)

    defaults = {
        "site_url": resolve_value("QAAS_DOCS_SITE_URL", "https://TheSmokeTeam.github.io/qaas-docs/"),
        "repo_url": resolve_value("QAAS_DOCS_REPO_URL", "https://github.com/TheSmokeTeam/QaaS.Runner"),
        "social_github_url": resolve_value("QAAS_DOCS_SOCIAL_GITHUB_URL", "https://github.com/TheSmokeTeam/QaaS.Runner"),
        "docs_site": resolve_value("QAAS_DOCS_LINK_DOCS_SITE", "https://TheSmokeTeam.github.io/qaas-docs/"),
        "repository_docs": resolve_value("QAAS_DOCS_LINK_REPOSITORY_DOCS", "https://github.com/TheSmokeTeam/qaas-docs"),
        "repository_runner": resolve_value("QAAS_DOCS_LINK_REPOSITORY_RUNNER", "https://github.com/TheSmokeTeam/QaaS.Runner"),
        "repository_mocker": resolve_value("QAAS_DOCS_LINK_REPOSITORY_MOCKER", "https://github.com/TheSmokeTeam/QaaS.Mocker"),
        "repository_mocker_communication_objects": resolve_value(
            "QAAS_DOCS_LINK_REPOSITORY_MOCKER_COMMUNICATION_OBJECTS",
            "https://github.com/TheSmokeTeam/Qaas.Mocker.CommunicationObjects",
        ),
        "repository_framework": resolve_value("QAAS_DOCS_LINK_REPOSITORY_FRAMEWORK", "https://github.com/TheSmokeTeam/QaaS.Framework"),
        "repository_assertions": resolve_value("QAAS_DOCS_LINK_REPOSITORY_ASSERTIONS", "https://github.com/TheSmokeTeam/QaaS.Common.Assertions"),
        "repository_generators": resolve_value("QAAS_DOCS_LINK_REPOSITORY_GENERATORS", "https://github.com/TheSmokeTeam/QaaS.Common.Generators"),
        "repository_probes": resolve_value("QAAS_DOCS_LINK_REPOSITORY_PROBES", "https://github.com/TheSmokeTeam/QaaS.Common.Probes"),
        "repository_processors": resolve_value("QAAS_DOCS_LINK_REPOSITORY_PROCESSORS", "https://github.com/TheSmokeTeam/QaaS.Common.Processors"),
        "repository_runner_template": resolve_value(
            "QAAS_DOCS_LINK_REPOSITORY_RUNNER_TEMPLATE",
            "https://github.com/TheSmokeTeam/QaaS.Runner.Template",
        ),
        "repository_mocker_template": resolve_value(
            "QAAS_DOCS_LINK_REPOSITORY_MOCKER_TEMPLATE",
            "https://github.com/TheSmokeTeam/QaaS.Mocker.Template",
        ),
        "repository_runner_quickstart_code": resolve_value(
            "QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_CODE",
            "https://github.com/TheSmokeTeam/DummyAppTests/tree/code_configuration",
        ),
        "repository_runner_quickstart_yaml": resolve_value(
            "QAAS_DOCS_LINK_REPOSITORY_RUNNER_QUICKSTART_YAML",
            "https://github.com/TheSmokeTeam/DummyAppTests/tree/yaml_configuration",
        ),
        "repository_mocker_quickstart_code": resolve_value(
            "QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_CODE",
            "https://github.com/TheSmokeTeam/DummyAppMock/tree/code_configuration",
        ),
        "repository_mocker_quickstart_yaml": resolve_value(
            "QAAS_DOCS_LINK_REPOSITORY_MOCKER_QUICKSTART_YAML",
            "https://github.com/TheSmokeTeam/DummyAppMock/tree/yaml_configuration",
        ),
        "allure_installation_guide": resolve_value(
            "QAAS_DOCS_LINK_ALLURE_INSTALLATION_GUIDE",
            "https://docs.qameta.io/allure/#_installing_a_commandline",
        ),
        "dotnet_sdk": resolve_value("QAAS_DOCS_LINK_DOTNET_SDK", "https://dotnet.microsoft.com/download"),
        "qaas_community": resolve_value("QAAS_DOCS_LINK_QAAS_COMMUNITY", "https://discord.gg/rg2NYT4Mea"),
        "nuget_feed": resolve_value("QAAS_DOCS_LINK_NUGET_FEED", "https://api.nuget.org/v3/index.json"),
        "artifactory": resolve_value("QAAS_DOCS_LINK_ARTIFACTORY", "https://jfrog.com/artifactory"),
        "runner_schema": resolve_value("QAAS_DOCS_LINK_RUNNER_SCHEMA", "../../assets/schemas/runner-family-schema.json"),
        "mocker_schema": resolve_value("QAAS_DOCS_LINK_MOCKER_SCHEMA", "../../assets/schemas/mocker-family-schema.json"),
    }

    output_path.write_text(
        "window.__QAAS_DOCS_BUILD_DEFAULTS__ = "
        + json.dumps(defaults, indent=2, sort_keys=True)
        + ";\n",
        encoding="utf-8",
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
