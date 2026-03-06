import os
import re


REPOSITORIES = {
    "docs": ("QAAS_REPO_DOCS_URL", "https://github.com/TheSmokeTeam/qaas-docs"),
    "runner": ("QAAS_REPO_RUNNER_URL", "https://github.com/TheSmokeTeam/QaaS.Runner"),
    "framework": ("QAAS_REPO_FRAMEWORK_URL", "https://github.com/TheSmokeTeam/QaaS.Framework"),
    "mocker": ("QAAS_REPO_MOCKER_URL", "https://github.com/TheSmokeTeam/QaaS.Mocker"),
    "assertions": (
        "QAAS_REPO_ASSERTIONS_URL",
        "https://github.com/TheSmokeTeam/QaaS.Common.Assertions",
    ),
    "generators": (
        "QAAS_REPO_GENERATORS_URL",
        "https://github.com/TheSmokeTeam/QaaS.Common.Generators",
    ),
    "probes": (
        "QAAS_REPO_PROBES_URL",
        "https://github.com/TheSmokeTeam/QaaS.Common.Probes",
    ),
    "processors": (
        "QAAS_REPO_PROCESSORS_URL",
        "https://github.com/eldarush/QaaS.Common.Processors",
    ),
    "mocker-communication-objects": (
        "QAAS_REPO_MOCKER_COMMUNICATION_OBJECTS_URL",
        "https://github.com/TheSmokeTeam/Qaas.Mocker.CommunicationObjects",
    ),
    "project-templates": (
        "QAAS_REPO_PROJECT_TEMPLATES_URL",
        "https://github.com/TheSmokeTeam/QaaS.ProjectTemplates",
    ),
}

EXTERNAL_LINKS = {
    "dotnet-install": (
        "QAAS_DOTNET_INSTALL_URL",
        "https://dotnet.microsoft.com/download/dotnet/10.0",
    ),
    "allure-cli": (
        "QAAS_ALLURE_CLI_URL",
        "https://allurereport.org/docs/install/",
    ),
    "commandlineparser": (
        "QAAS_COMMANDLINEPARSER_URL",
        "https://github.com/commandlineparser/commandline",
    ),
    "autofac": ("QAAS_AUTOFAC_URL", "https://docs.autofac.org/en/latest/"),
    "serilog": ("QAAS_SERILOG_URL", "https://serilog.net/"),
    "yamldotnet": ("QAAS_YAMLDOTNET_URL", "https://github.com/aaubry/YamlDotNet"),
    "rabbitmq-dotnet": (
        "QAAS_RABBITMQ_DOTNET_URL",
        "https://www.rabbitmq.com/client-libraries/dotnet-api-guide",
    ),
    "redis": (
        "QAAS_STACKEXCHANGE_REDIS_URL",
        "https://stackexchange.github.io/StackExchange.Redis/",
    ),
    "kubernetes-client": (
        "QAAS_KUBERNETES_CLIENT_URL",
        "https://github.com/kubernetes-client/csharp",
    ),
    "aws-sdk-dotnet": (
        "QAAS_AWS_SDK_DOTNET_URL",
        "https://docs.aws.amazon.com/sdk-for-net/v4/developer-guide/welcome.html",
    ),
}

TOKEN_PATTERN = re.compile(r"\[\[(repo|nuget|ext|env):([^\]]+)\]\]")


def _resolve_repo(name: str) -> str:
    env_name, default = REPOSITORIES.get(name, (None, name))
    return os.getenv(env_name, default) if env_name else name


def _resolve_nuget(package_id: str) -> str:
    base = os.getenv("QAAS_NUGET_BASE_URL", "https://www.nuget.org/packages").rstrip("/")
    return f"{base}/{package_id}/"


def _resolve_ext(name: str) -> str:
    env_name, default = EXTERNAL_LINKS.get(name, (None, name))
    return os.getenv(env_name, default) if env_name else name


def _resolve_env(payload: str) -> str:
    env_name, _, default = payload.partition("|")
    return os.getenv(env_name.strip(), default.strip())


def on_page_markdown(markdown, **_kwargs):
    def replace(match):
        kind, payload = match.group(1), match.group(2).strip()
        if kind == "repo":
            return _resolve_repo(payload)
        if kind == "nuget":
            return _resolve_nuget(payload)
        if kind == "ext":
            return _resolve_ext(payload)
        if kind == "env":
            return _resolve_env(payload)
        return match.group(0)

    return TOKEN_PATTERN.sub(replace, markdown)
