#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


DOCS_ROOT = Path("docs")
SKIP_PARTS = {"_generated"}
HOOK_OVERVIEW_PARTS = {
    "availableAssertions",
    "availableGenerators",
    "availableProbes",
    "availableProcessors",
}
H1_RE = re.compile(r"^#\s+(.+?)\s*$")


def error(path: Path, line_number: int | None, message: str) -> None:
    if line_number is None:
        print(f"::error file={path.as_posix()}::{message}", file=sys.stderr)
    else:
        print(f"::error file={path.as_posix()},line={line_number}::{message}", file=sys.stderr)


def split_frontmatter(text: str) -> tuple[str | None, str]:
    lines = text.splitlines()
    if not lines or lines[0].strip() != "---":
        return None, text

    for index, line in enumerate(lines[1:], start=1):
        if line.strip() == "---":
            return "\n".join(lines[1:index]), "\n".join(lines[index + 1 :])

    return None, text


def page_h1s(body: str) -> list[tuple[int, str]]:
    headings: list[tuple[int, str]] = []
    in_fence = False

    for line_number, line in enumerate(body.splitlines(), start=1):
        stripped = line.lstrip()
        if stripped.startswith("```") or stripped.startswith("~~~"):
            in_fence = not in_fence
            continue

        if in_fence:
            continue

        match = H1_RE.match(line)
        if match:
            headings.append((line_number, match.group(1).strip()))

    return headings


def is_hook_overview(path: Path) -> bool:
    return path.name == "overview.md" and bool(HOOK_OVERVIEW_PARTS.intersection(path.parts))


def expected_hook_name(path: Path) -> str:
    return path.parent.name


def main() -> int:
    failed = False
    checked = 0

    for path in sorted(DOCS_ROOT.rglob("*.md")):
        if SKIP_PARTS.intersection(path.parts):
            continue

        checked += 1
        _, body = split_frontmatter(path.read_text(encoding="utf-8"))
        headings = page_h1s(body)

        if len(headings) != 1:
            error(path, None, f"expected exactly one page H1 outside code fences, found {len(headings)}")
            failed = True
            continue

        line_number, title = headings[0]
        if is_hook_overview(path):
            expected = expected_hook_name(path)
            if title != expected:
                error(path, line_number, f"hook overview H1 must be {expected!r}, found {title!r}")
                failed = True

    if failed:
        print("::error::page heading check failed", file=sys.stderr)
        return 1

    print(f"[check-page-headings] OK ({checked} pages)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
