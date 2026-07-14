#!/usr/bin/env python3
"""Validate fixed-name ZIM generation and its PackageMirror provenance handoff."""

from __future__ import annotations

from pathlib import Path
from typing import Any

import yaml


ROOT = Path(__file__).resolve().parents[2]
PRIMARY_WORKFLOW = ROOT / ".github" / "workflows" / "ci.yml"
DOCS_WORKFLOW = ROOT / ".github" / "workflows" / "docs.yml"
ZIM_BUILDER = ROOT / "tools" / "zim" / "build-zim.sh"
PROVENANCE_TOOL = ROOT / "tools" / "zim" / "sync-zim-provenance.py"
ZIM_PATH = "qaas-docs.zim"
PROVENANCE_PATH = "qaas-docs-zim-provenance.json"
IMAGE_ARCHIVE_PATH = "qaas-docs-image.tgz"


class GitHubActionsLoader(yaml.SafeLoader):
    """Parse GitHub Actions YAML without YAML 1.1 bool coercion for `on`."""


for first_letter, mappings in list(GitHubActionsLoader.yaml_implicit_resolvers.items()):
    GitHubActionsLoader.yaml_implicit_resolvers[first_letter] = [
        (tag, regexp)
        for tag, regexp in mappings
        if tag != "tag:yaml.org,2002:bool"
    ]


def fail(path: Path, message: str) -> None:
    raise SystemExit(f"::error file={path.relative_to(ROOT)}::{message}")


def load_workflow(path: Path) -> dict[str, Any]:
    with path.open("r", encoding="utf-8") as handle:
        loaded = yaml.load(handle, Loader=GitHubActionsLoader)
    if not isinstance(loaded, dict):
        fail(path, "workflow did not parse as a mapping")
    return loaded


def get_job(workflow: dict[str, Any], workflow_path: Path, name: str) -> dict[str, Any]:
    job = workflow.get("jobs", {}).get(name)
    if not isinstance(job, dict):
        fail(workflow_path, f"workflow is missing job '{name}'")
    return job


def get_step(job: dict[str, Any], workflow_path: Path, name: str) -> dict[str, Any]:
    for step in job.get("steps", []):
        if isinstance(step, dict) and step.get("name") == name:
            return step
    fail(workflow_path, f"build-zim job is missing step '{name}'")


def require_paths(value: object, workflow_path: Path, surface: str) -> None:
    paths = {line.strip() for line in str(value).splitlines() if line.strip()}
    expected = {ZIM_PATH, PROVENANCE_PATH, IMAGE_ARCHIVE_PATH}
    if paths != expected:
        fail(
            workflow_path,
            f"{surface} must contain exactly {sorted(expected)}, found {sorted(paths)}",
        )


def validate_builder() -> None:
    builder = ZIM_BUILDER.read_text(encoding="utf-8")
    provenance_tool = PROVENANCE_TOOL.read_text(encoding="utf-8")
    required_builder_fragments = (
        'OUT="qaas-docs.zim"',
        'PROVENANCE_PATH="qaas-docs-zim-provenance.json"',
        "the ZIM filename is fixed",
        'SITE_DIR="${SITE_DIR:-site}"',
        "tools/zim/sync-zim-provenance.py",
        '--name="QaaS Documantation"',
        '--title="Complete QaaS Documantation"',
        '--description="$DOCS_UPDATED_DATE_UTC"',
        "--withFullTextIndex",
    )
    for fragment in required_builder_fragments:
        if fragment not in builder:
            fail(ZIM_BUILDER, f"ZIM builder is missing required contract: {fragment}")

    for fragment in (
        'ZIM_NAME = "QaaS Documantation"',
        'ZIM_TITLE = "Complete QaaS Documantation"',
        'ZIM_FILE_NAME = "qaas-docs.zim"',
        'PROVENANCE_FILE_NAME = "qaas-docs-zim-provenance.json"',
        '"description": validated_date',
    ):
        if fragment not in provenance_tool:
            fail(PROVENANCE_TOOL, f"provenance tool is missing required contract: {fragment}")


def validate_common_zim_job(
    job: dict[str, Any], workflow_path: Path, build_step_name: str, smoke_step_name: str
) -> None:
    build_step = get_step(job, workflow_path, build_step_name)
    build_run = str(build_step.get("run", ""))
    if "tools/zim/build-zim.sh" not in build_run:
        fail(workflow_path, "build-zim must invoke tools/zim/build-zim.sh")
    if "qaas-docs-${" in build_run or "github.ref_name" in build_run:
        fail(workflow_path, "ZIM filename must not depend on a tag, image, commit, or version")

    smoke_step = get_step(job, workflow_path, smoke_step_name)
    smoke_run = str(smoke_step.get("run", ""))
    if "kiwix-serve" not in smoke_run or "/data/qaas-docs.zim" not in smoke_run:
        fail(workflow_path, "build-zim must smoke-test the fixed qaas-docs.zim asset")
    if "search?pattern=IProbe" not in smoke_run:
        fail(workflow_path, "build-zim smoke test must exercise ZIM search")
    if "/content/qaas-docs/qaas-docs/qaas/index.html" not in smoke_run:
        fail(workflow_path, "build-zim smoke test must fetch a rendered page from qaas-docs")

    image_step = get_step(job, workflow_path, "Build latest docs image archive")
    image_run = str(image_step.get("run", ""))
    for fragment in (
        "docker build --tag qaas-docs:latest .",
        "docker image save qaas-docs:latest",
        "gzip --best > qaas-docs-image.tgz",
        "gzip --test qaas-docs-image.tgz",
    ):
        if fragment not in image_run:
            fail(workflow_path, f"docs image archive step is missing: {fragment}")

    artifact_step = get_step(job, workflow_path, "Upload ZIM artifact")
    if "actions/upload-artifact@" not in str(artifact_step.get("uses", "")):
        fail(workflow_path, "build-zim must upload a workflow artifact")
    artifact_with = artifact_step.get("with", {})
    if artifact_with.get("name") != "qaas-docs-zim":
        fail(workflow_path, "workflow artifact must be named qaas-docs-zim")
    require_paths(artifact_with.get("path", ""), workflow_path, "ZIM artifact")


def validate_primary_workflow() -> None:
    workflow = load_workflow(PRIMARY_WORKFLOW)
    push = workflow.get("on", {}).get("push", {})
    tags = push.get("tags", []) if isinstance(push, dict) else []
    if "**" not in tags:
        fail(PRIMARY_WORKFLOW, "CI must run on every tag push")

    job = get_job(workflow, PRIMARY_WORKFLOW, "build-zim")
    if "startsWith(github.ref, 'refs/tags/')" not in str(job.get("if", "")):
        fail(PRIMARY_WORKFLOW, "build-zim must run only for tag refs")
    if job.get("permissions", {}).get("contents") != "write":
        fail(PRIMARY_WORKFLOW, "build-zim needs contents: write for release assets")

    validate_common_zim_job(job, PRIMARY_WORKFLOW, "Build ZIM", "Smoke-test ZIM")
    release_step = get_step(job, PRIMARY_WORKFLOW, "Attach ZIM to GitHub release")
    if "softprops/action-gh-release@" not in str(release_step.get("uses", "")):
        fail(PRIMARY_WORKFLOW, "build-zim must attach assets to the tag release")
    require_paths(
        release_step.get("with", {}).get("files", ""),
        PRIMARY_WORKFLOW,
        "GitHub release",
    )


def validate_docs_workflow() -> None:
    workflow = load_workflow(DOCS_WORKFLOW)
    job = get_job(workflow, DOCS_WORKFLOW, "build-zim")
    validate_common_zim_job(
        job,
        DOCS_WORKFLOW,
        "Build ZIM via configured zim-tools image",
        "Smoke-test ZIM with configured kiwix-serve image",
    )


def main() -> int:
    validate_builder()
    validate_primary_workflow()
    validate_docs_workflow()
    print("[check-zim-release-workflow] OK")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
