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
import re
import subprocess
from pathlib import Path
from urllib.parse import urlparse

ENV_PREFIX = "QAAS_DOCS_LINK_"
TOP_LEVEL_OVERRIDES = {
    "site_url": "QAAS_DOCS_SITE_URL",
    "repo_name": "QAAS_DOCS_REPO_NAME",
    "repo_url": "QAAS_DOCS_REPO_URL",
}

RUNNER_REPO_SLUG = "TheSmokeTeam/QaaS.Runner"
DOCS_REPO_SLUG = "TheSmokeTeam/qaas-docs"
VERSIONED_REPO_NAME_PATTERN = re.compile(r"^(?P<name>.+?)\s+v?\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?$")
SEMVER_TAG_PATTERN = re.compile(r"^v?(\d+)\.(\d+)\.(\d+)(?:-([0-9A-Za-z.-]+))?$")


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
        if env_value:
            links[key] = env_value

    env.conf["extra"]["links"] = links

    social_github_url = os.environ.get("QAAS_DOCS_SOCIAL_GITHUB_URL")
    if social_github_url:
        for social_link in env.conf["extra"].get("social", []):
            if social_link.get("icon") == "fontawesome/brands/github":
                social_link["link"] = social_github_url

    apply_runner_version_to_repo_name(env.conf)


def apply_runner_version_to_repo_name(config):
    """Append the latest Runner version to the top-right repo name when it points to the Runner repo."""
    repo_url = config.get("repo_url")
    repo_name = config.get("repo_name")
    if not repo_url or not repo_name:
        return

    repo_slug = extract_github_repo_slug(repo_url)
    if not repo_slug or repo_slug == DOCS_REPO_SLUG or repo_slug != RUNNER_REPO_SLUG:
        return

    latest_version = (
        get_latest_version_from_local_runner_repo()
        or get_latest_version_from_remote_tags(repo_url)
    )
    if not latest_version:
        return

    base_repo_name = strip_existing_version_suffix(repo_name)
    config["repo_name"] = f"{base_repo_name} {latest_version}"


def strip_existing_version_suffix(repo_name):
    """Remove an existing semver suffix so version injection stays idempotent."""
    match = VERSIONED_REPO_NAME_PATTERN.match(repo_name.strip())
    return match.group("name") if match else repo_name


def extract_github_repo_slug(repo_url):
    """Return owner/repo from a GitHub HTTPS URL or None when the URL is not a GitHub repo."""
    parsed = urlparse(repo_url)
    if "github.com" not in parsed.netloc.lower():
        return None

    path = parsed.path.strip("/")
    if path.endswith(".git"):
        path = path[:-4]

    parts = [part for part in path.split("/") if part]
    if len(parts) < 2:
        return None

    return f"{parts[0]}/{parts[1]}"


def get_latest_version_from_local_runner_repo():
    """Read the latest semver tag from the sibling Runner repo when it exists locally."""
    local_repo_path = Path(__file__).resolve().parent.parent / "QaaS.Runner"
    if not (local_repo_path / ".git").exists():
        return None

    return get_latest_version_from_git_tags(["git", "-C", str(local_repo_path), "tag", "--list"])


def get_latest_version_from_remote_tags(repo_url):
    """Read the latest semver tag directly from the configured remote repo."""
    return get_latest_version_from_git_tags(["git", "ls-remote", "--tags", "--refs", repo_url])


def get_latest_version_from_git_tags(command):
    """Run a git tag command and return the highest semver-like tag, or None on failure."""
    try:
        completed_process = subprocess.run(
            command,
            check=True,
            capture_output=True,
            text=True,
            timeout=10,
        )
    except (OSError, subprocess.SubprocessError):
        return None

    tags = []
    for line in completed_process.stdout.splitlines():
        tag = line.strip()
        if "\trefs/tags/" in tag:
            tag = tag.split("\trefs/tags/", 1)[1]
        if tag:
            tags.append(tag)

    latest_tag = max(
        (tag for tag in tags if parse_semver_tag(tag) is not None),
        key=parse_semver_tag,
        default=None,
    )
    return latest_tag


def parse_semver_tag(tag):
    """Parse semver-like tags into a sortable key."""
    match = SEMVER_TAG_PATTERN.match(tag)
    if not match:
        return None

    major, minor, patch = (int(match.group(index)) for index in range(1, 4))
    prerelease = match.group(4)
    return major, minor, patch, build_prerelease_key(prerelease)


def build_prerelease_key(prerelease):
    """Build a comparable prerelease tuple where stable releases sort after prereleases."""
    if prerelease is None:
        return (1,)

    parsed_parts = []
    for part in prerelease.split("."):
        if part.isdigit():
            parsed_parts.append((0, int(part)))
        else:
            parsed_parts.append((1, part))

    return (0, *parsed_parts)
