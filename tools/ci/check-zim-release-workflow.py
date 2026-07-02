#!/usr/bin/env python3
"""Validate that the primary CI workflow publishes a ZIM for tag releases."""

from __future__ import annotations

from pathlib import Path
from typing import Any

import yaml


ROOT = Path(__file__).resolve().parents[2]
WORKFLOW = ROOT / ".github" / "workflows" / "ci.yml"
ZIM_BUILDER = ROOT / "tools" / "zim" / "build-zim.sh"


class GitHubActionsLoader(yaml.SafeLoader):
    """Parse GitHub Actions YAML without YAML 1.1 bool coercion for keys like 'on'."""


for first_letter, mappings in list(GitHubActionsLoader.yaml_implicit_resolvers.items()):
    GitHubActionsLoader.yaml_implicit_resolvers[first_letter] = [
        (tag, regexp)
        for tag, regexp in mappings
        if tag != "tag:yaml.org,2002:bool"
    ]


def fail(message: str) -> None:
    raise SystemExit(f"::error file={WORKFLOW.relative_to(ROOT)}::{message}")


def load_workflow() -> dict[str, Any]:
    if not WORKFLOW.exists():
        fail("primary CI workflow does not exist")

    with WORKFLOW.open("r", encoding="utf-8") as handle:
        loaded = yaml.load(handle, Loader=GitHubActionsLoader)

    if not isinstance(loaded, dict):
        fail("primary CI workflow did not parse as a mapping")

    return loaded


def get_step(job: dict[str, Any], name: str) -> dict[str, Any]:
    for step in job.get("steps", []):
        if isinstance(step, dict) and step.get("name") == name:
            return step

    fail(f"build-zim job is missing step '{name}'")


def main() -> int:
    workflow = load_workflow()
    zim_builder = ZIM_BUILDER.read_text(encoding="utf-8")
    if 'SITE_DIR="${SITE_DIR:-site}"' not in zim_builder:
        fail("tools/zim/build-zim.sh must allow SITE_DIR override for local and CI reuse")
    if "--withFullTextIndex" not in zim_builder:
        fail("tools/zim/build-zim.sh must create a full-text index for searchable OpenZIM output")

    push = workflow.get("on", {}).get("push", {})
    tags = push.get("tags", []) if isinstance(push, dict) else []
    if "**" not in tags:
        fail("CI must run on every tag push")

    jobs = workflow.get("jobs", {})
    if not isinstance(jobs, dict):
        fail("CI workflow jobs must be a mapping")

    build_site = jobs.get("build-site")
    if not isinstance(build_site, dict):
        fail("CI workflow is missing build-site job")

    site_upload = get_step(build_site, "Upload site artifact")
    if "actions/upload-artifact@" not in str(site_upload.get("uses", "")):
        fail("build-site must upload the rendered site for downstream ZIM packaging")
    site_upload_with = site_upload.get("with", {})
    if site_upload_with.get("name") != "qaas-docs-site":
        fail("site artifact must be named qaas-docs-site")
    if str(site_upload_with.get("path", "")).strip() not in {"site/", "./site"}:
        fail("site artifact must upload the rendered site directory")

    build_zim = jobs.get("build-zim")
    if not isinstance(build_zim, dict):
        fail("CI workflow is missing build-zim job")

    if "startsWith(github.ref, 'refs/tags/')" not in str(build_zim.get("if", "")):
        fail("build-zim job must run only for tag refs")

    needs = build_zim.get("needs", [])
    if isinstance(needs, str):
        needs = [needs]
    if "build-site" not in needs:
        fail("build-zim job must depend on build-site")

    permissions = build_zim.get("permissions", {})
    if permissions.get("contents") != "write":
        fail("build-zim needs contents: write to attach the ZIM to the GitHub release")

    download_site = get_step(build_zim, "Download site artifact")
    if "actions/download-artifact@" not in str(download_site.get("uses", "")):
        fail("build-zim must download the rendered site artifact")
    download_with = download_site.get("with", {})
    if download_with.get("name") != "qaas-docs-site":
        fail("build-zim must download the qaas-docs-site artifact")

    build_step = get_step(build_zim, "Build ZIM")
    build_run = str(build_step.get("run", ""))
    if "tools/zim/build-zim.sh" not in build_run:
        fail("build-zim must invoke tools/zim/build-zim.sh")
    if "github.ref_name" not in build_run:
        fail("ZIM file name must include the tag name")
    if 'zim_slug="${zim_path%.zim}"' not in build_run:
        fail("build-zim must derive the smoke-test slug from the built ZIM path")
    if 'zim_slug="${zim_slug,,}"' not in build_run:
        fail("build-zim must lowercase the Kiwix content slug")
    if 'zim_slug="${zim_slug//+/plus}"' not in build_run:
        fail("build-zim must normalize plus signs in the Kiwix content slug")
    if 'echo "slug=$zim_slug"' not in build_run:
        fail("build-zim must expose the Kiwix content slug as an output")

    smoke_step = get_step(build_zim, "Smoke-test ZIM")
    smoke_run = str(smoke_step.get("run", ""))
    if "kiwix-serve" not in smoke_run:
        fail("build-zim must smoke-test the ZIM with kiwix-serve")
    if "search?pattern=IProbe" not in smoke_run:
        fail("build-zim smoke test must exercise ZIM search")
    if "steps.zim.outputs.slug" not in smoke_run:
        fail("build-zim smoke test must use the normalized Kiwix content slug")
    if "steps.zim.outputs.name" in smoke_run:
        fail("build-zim smoke test must not use the raw ZIM basename as the content slug")
    if "/qaas-docs/qaas/index.html" not in smoke_run:
        fail("build-zim smoke test must fetch a rendered docs page from the ZIM")

    artifact_step = get_step(build_zim, "Upload ZIM artifact")
    if "actions/upload-artifact@" not in str(artifact_step.get("uses", "")):
        fail("build-zim must upload the ZIM as a workflow artifact")
    artifact_with = artifact_step.get("with", {})
    if artifact_with.get("name") != "qaas-docs-zim":
        fail("workflow artifact must be named qaas-docs-zim")
    if str(artifact_with.get("path", "")).strip() != "${{ steps.zim.outputs.path }}":
        fail("workflow artifact must upload the exact built ZIM path")

    release_step = get_step(build_zim, "Attach ZIM to GitHub release")
    if "softprops/action-gh-release@" not in str(release_step.get("uses", "")):
        fail("build-zim must attach the ZIM to the tag's GitHub release")
    release_with = release_step.get("with", {})
    release_files = str(release_with.get("files", ""))
    if release_files.strip() != "${{ steps.zim.outputs.path }}":
        fail("GitHub release upload must use the exact built ZIM path")

    print("[check-zim-release-workflow] OK")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
