#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path

import yaml
from yaml.nodes import MappingNode, ScalarNode, SequenceNode


DOCS_ROOT = Path("docs")
MKDOCS_CONFIG = Path("mkdocs.yml")
EXPECTED_TOP_NAV = ("Home", "Runner", "Mocker", "Hooks", "Framework", "Integrations")
SKIP_PARTS = {"_generated"}
LEGACY_META = "docs" + "/_meta"


class ConfigLoader(yaml.SafeLoader):
    pass


def construct_any(loader: ConfigLoader, node: yaml.Node) -> object:
    if isinstance(node, ScalarNode):
        return loader.construct_scalar(node)
    if isinstance(node, SequenceNode):
        return loader.construct_sequence(node)
    if isinstance(node, MappingNode):
        return loader.construct_mapping(node)
    return None


ConfigLoader.add_constructor(None, construct_any)


def error(path: Path, message: str) -> None:
    print(f"::error file={path.as_posix()}::{message}", file=sys.stderr)


def load_config() -> dict:
    return yaml.load(MKDOCS_CONFIG.read_text(encoding="utf-8"), Loader=ConfigLoader)


def top_title(item: object) -> str:
    if isinstance(item, dict) and item:
        return str(next(iter(item)))
    return str(item)


def collect_nav_paths(node: object) -> set[str]:
    paths: set[str] = set()
    if isinstance(node, str):
        if node.endswith(".md"):
            paths.add(node)
        return paths

    if isinstance(node, list):
        for item in node:
            paths.update(collect_nav_paths(item))
        return paths

    if isinstance(node, dict):
        for value in node.values():
            paths.update(collect_nav_paths(value))
        return paths

    return paths


def docs_pages(skip_generated: bool) -> set[str]:
    pages: set[str] = set()
    for path in DOCS_ROOT.rglob("*.md"):
        if skip_generated and SKIP_PARTS.intersection(path.parts):
            continue
        pages.add(path.relative_to(DOCS_ROOT).as_posix())
    return pages


def main() -> int:
    failed = False
    config = load_config()
    nav = config.get("nav")

    if not isinstance(nav, list):
        error(MKDOCS_CONFIG, "nav must be a list")
        return 1

    actual_top_nav = tuple(top_title(item) for item in nav)
    if actual_top_nav != EXPECTED_TOP_NAV:
        error(
            MKDOCS_CONFIG,
            f"top-level nav changed: expected {EXPECTED_TOP_NAV}, got {actual_top_nav}",
        )
        failed = True

    nav_paths = collect_nav_paths(nav)
    for nav_path in sorted(nav_paths):
        if "\\" in nav_path:
            error(MKDOCS_CONFIG, f"nav path must use forward slashes: {nav_path}")
            failed = True
        if nav_path.startswith("/") or ".." in Path(nav_path).parts:
            error(MKDOCS_CONFIG, f"nav path must stay under docs: {nav_path}")
            failed = True
        if f"docs/{nav_path}".startswith(LEGACY_META):
            error(MKDOCS_CONFIG, f"nav path uses the legacy metadata tree: {nav_path}")
            failed = True
        if not (DOCS_ROOT / nav_path).exists():
            error(MKDOCS_CONFIG, f"nav path does not exist: {nav_path}")
            failed = True

    source_pages = docs_pages(skip_generated=True)
    all_pages = docs_pages(skip_generated=False)
    omitted = sorted(source_pages - nav_paths)
    stale = sorted(nav_paths - all_pages)

    for page in omitted:
        error(DOCS_ROOT / page, "page is not listed in mkdocs nav")
        failed = True
    for nav_path in stale:
        error(MKDOCS_CONFIG, f"nav path is not a source page: {nav_path}")
        failed = True

    if failed:
        print("::error::navigation structure check failed", file=sys.stderr)
        return 1

    print(f"[check-nav-structure] OK ({len(nav_paths)} nav pages)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
