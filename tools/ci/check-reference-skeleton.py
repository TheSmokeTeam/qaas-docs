#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


DOCS_ROOT = Path("docs")
SKIP_PARTS = {"_generated"}
TYPE_RE = re.compile(r"^\s*type\s*:\s*[\"']?reference[\"']?\s*$", re.IGNORECASE)
TLDR_RE = re.compile(r"^> TL;DR\b", re.MULTILINE)
H2_RE = re.compile(r"^##\s+(.+?)(?:\s+\{[:#].*)?\s*$")
SEE_ALSO_RE = re.compile(
    r"^## See also(?:\s+(?:\{#[A-Za-z0-9_-]+\}|\{:\s*#[A-Za-z0-9_-]+\}))?\s*$",
    re.MULTILINE,
)
SKELETON_ORDER = (
    "When to use",
    "YAML configuration",
    "C# (CAC) usage",
    "Minimal example",
    "Realistic example",
    "Edge cases",
    "See also",
)
SKELETON_RANK = {heading: index for index, heading in enumerate(SKELETON_ORDER)}


def split_frontmatter(text: str) -> tuple[str | None, str]:
    lines = text.splitlines()
    if not lines or lines[0].strip() != "---":
        return None, text

    for index, line in enumerate(lines[1:], start=1):
        if line.strip() == "---":
            return "\n".join(lines[1:index]), "\n".join(lines[index + 1 :])

    return None, text


def is_reference_page(frontmatter: str) -> bool:
    return any(TYPE_RE.match(line) for line in frontmatter.splitlines())


def error(path: Path, message: str, line: int | None = None) -> None:
    if line is None:
        print(f"::error file={path.as_posix()}::{message}", file=sys.stderr)
    else:
        print(f"::error file={path.as_posix()},line={line}::{message}", file=sys.stderr)


def h2_headings(body: str) -> list[tuple[int, str]]:
    headings: list[tuple[int, str]] = []
    for line_number, line in enumerate(body.splitlines(), start=1):
        match = H2_RE.match(line)
        if match:
            headings.append((line_number, match.group(1).strip()))
    return headings


def first_tldr_line(body: str) -> int | None:
    for line_number, line in enumerate(body.splitlines(), start=1):
        if line.startswith("> TL;DR"):
            return line_number
    return None


def main() -> int:
    failed = False
    checked = 0

    for path in sorted(DOCS_ROOT.rglob("*.md")):
        if SKIP_PARTS.intersection(path.parts):
            continue

        text = path.read_text(encoding="utf-8")
        frontmatter, body = split_frontmatter(text)
        if frontmatter is None or not is_reference_page(frontmatter):
            continue

        checked += 1
        tldr_line = first_tldr_line(body)
        headings = h2_headings(body)

        if tldr_line is None or not TLDR_RE.search(body):
            error(path, "missing required TL;DR blockquote")
            failed = True
        elif headings and tldr_line > headings[0][0]:
            error(path, "TL;DR blockquote must appear before the first H2", tldr_line)
            failed = True

        if not SEE_ALSO_RE.search(body):
            error(path, "missing required See also section")
            failed = True
        elif headings and headings[-1][1] != "See also":
            error(path, "See also must be the final H2 section", headings[-1][0])
            failed = True

        previous_rank = -1
        for line_number, heading in headings:
            if heading not in SKELETON_RANK:
                continue

            rank = SKELETON_RANK[heading]
            if rank < previous_rank:
                error(path, f"section out of v2 skeleton order: {heading}", line_number)
                failed = True
            previous_rank = max(previous_rank, rank)

    if failed:
        print("::error::reference skeleton check failed", file=sys.stderr)
        return 1

    print(f"[check-reference-skeleton] OK ({checked} reference pages)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
