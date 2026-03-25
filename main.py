"""
MkDocs macros hook that allows overriding docs URLs via OS environment variables.

Environment variable naming conventions:
    QAAS_DOCS_LINK_<KEY_UPPER> overrides extra.links.<key>
    QAAS_DOCS_SITE_URL overrides site_url
    QAAS_DOCS_REPO_NAME overrides repo_name
    QAAS_DOCS_REPO_URL overrides repo_url
    QAAS_DOCS_SOCIAL_GITHUB_URL overrides the default GitHub social link
"""

import os

ENV_PREFIX = "QAAS_DOCS_LINK_"
TOP_LEVEL_OVERRIDES = {
    "site_url": "QAAS_DOCS_SITE_URL",
    "repo_name": "QAAS_DOCS_REPO_NAME",
    "repo_url": "QAAS_DOCS_REPO_URL",
}


def define_env(env):
    """Apply environment-variable overrides to MkDocs settings and extra links."""
    for setting_name, env_var in TOP_LEVEL_OVERRIDES.items():
        env_value = os.environ.get(env_var)
        if env_value:
            env.conf[setting_name] = env_value

    links = env.conf["extra"].get("links", {})

    for key in list(links.keys()):
        env_var = f"{ENV_PREFIX}{key.upper()}"
        env_value = os.environ.get(env_var)
        if env_value is not None:
            links[key] = env_value

    env.conf["extra"]["links"] = links

    social_github_url = os.environ.get("QAAS_DOCS_SOCIAL_GITHUB_URL")
    if social_github_url:
        for social_link in env.conf["extra"].get("social", []):
            if social_link.get("icon") == "fontawesome/brands/github":
                social_link["link"] = social_github_url
