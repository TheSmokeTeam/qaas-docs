#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


DOCS_ROOT = Path("docs")
WORKSPACE_ROOT = Path.cwd().parent
SKIP_PARTS = {"_generated"}
TYPE_RE = re.compile(r"^\s*type\s*:\s*[\"']?reference[\"']?\s*$", re.IGNORECASE)
MARKER_RE = re.compile(r"<!--\s*Verified-against:\s*(?P<source>[^<>]+?)\s*-->")
HOOK_ROOTS = (
    "assertions/availableAssertions/",
    "generators/availableGenerators/",
    "probes/availableProbes/",
    "processors/availableProcessors/",
)
FUNCTION_ROOTS = ("qaas/functions/", "mocker/functions/", "framework/functions/")


def error(path: Path, message: str) -> None:
    print(f"::error file={path.as_posix()}::{message}", file=sys.stderr)


def split_frontmatter(text: str) -> tuple[str | None, str]:
    lines = text.splitlines()
    if not lines or lines[0].strip() != "---":
        return None, text

    for index, line in enumerate(lines[1:], start=1):
        if line.strip() == "---":
            return "\n".join(lines[1:index]), "\n".join(lines[index + 1 :])

    return None, text


def is_reference_page(frontmatter: str | None) -> bool:
    if frontmatter is None:
        return False

    return any(TYPE_RE.match(line) for line in frontmatter.splitlines())


def is_target_page(relative_path: str, frontmatter: str | None) -> bool:
    if not is_reference_page(frontmatter):
        return False

    if relative_path.startswith(HOOK_ROOTS):
        return relative_path.endswith(
            ("/overview.md", "/configuration/tableView.md", "/configuration/yamlView.md")
        )

    if relative_path.startswith(FUNCTION_ROOTS):
        return not relative_path.endswith("/index.md")

    if "/configurationSections/" in relative_path:
        return relative_path.endswith(
            (
                "/configurations/tableView.md",
                "/configurations/yamlView.md",
                "-tableView.md",
                "-yamlView.md",
            )
        )

    return False


def marker_sources(text: str) -> list[str]:
    return [match.group("source").strip() for match in MARKER_RE.finditer(text)]


def marker_path_exists(source: str) -> bool | None:
    parts = re.split(r"[\\/]+", source)
    if not parts:
        return None

    repository_root = WORKSPACE_ROOT / parts[0]
    if not repository_root.exists():
        return None

    source_path = WORKSPACE_ROOT.joinpath(*parts)
    return source_path.exists()


def main() -> int:
    failed = False
    checked = 0

    for path in sorted(DOCS_ROOT.rglob("*.md")):
        if SKIP_PARTS.intersection(path.parts):
            continue

        relative_path = path.relative_to(DOCS_ROOT).as_posix()
        text = path.read_text(encoding="utf-8")
        frontmatter, _ = split_frontmatter(text)
        if not is_target_page(relative_path, frontmatter):
            continue

        checked += 1
        sources = marker_sources(text)
        if not sources:
            error(path, "source-derived reference page is missing a Verified-against marker")
            failed = True
            continue

        duplicate_sources = sorted(
            source for source in set(sources) if sources.count(source) > 1
        )
        if duplicate_sources:
            error(path, f"duplicate verification marker: {', '.join(duplicate_sources)}")
            failed = True

        for source in sources:
            exists = marker_path_exists(source)
            if exists is False:
                error(path, f"verification source does not exist locally: {source}")
                failed = True

    if failed:
        print("::error::verification marker check failed", file=sys.stderr)
        return 1

    print(f"[check-verification-markers] OK ({checked} source-derived reference pages)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
