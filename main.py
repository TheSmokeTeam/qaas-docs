"""
MkDocs Macros hook — allows overriding any link defined in `extra.links`
via OS environment variables.

Environment variable naming convention:
    QAAS_DOCS_LINK_<KEY_UPPER> overrides extra.links.<key>

Examples:
    export QAAS_DOCS_LINK_REPOSITORY_RUNNER=https://github.com/MyOrg/QaaS.Runner
    export QAAS_DOCS_LINK_ALLURE_INSTALLATION_GUIDE=https://allure.example.com/install
"""

import os

# Prefix used for environment variable overrides
ENV_PREFIX = "QAAS_DOCS_LINK_"


def define_env(env):
    """
    Called by mkdocs-macros-plugin during site build.
    Reads OS environment variables prefixed with QAAS_DOCS_LINK_
    and overrides the corresponding key in extra.links.
    """
    links = env.conf["extra"].get("links", {})

    for key in list(links.keys()):
        env_var = f"{ENV_PREFIX}{key.upper()}"
        env_value = os.environ.get(env_var)
        if env_value is not None:
            links[key] = env_value

    env.conf["extra"]["links"] = links
