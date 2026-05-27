#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


DOCS_ROOT = Path("docs")
SKIP_PARTS = {"_generated"}

RULES = (
    (
        "remote Markdown image",
        re.compile(r"!\[[^\]]*\]\(\s*(?:https?:)?//", re.IGNORECASE),
    ),
    (
        "remote HTML image",
        re.compile(r"<img\b[^>]*\bsrc\s*=\s*['\"]?\s*(?:https?:)?//", re.IGNORECASE),
    ),
    (
        "runtime embed tag",
        re.compile(r"<\s*(?:iframe|script|embed)\b|<\s*object\s", re.IGNORECASE),
    ),
    (
        "absolute docs self-link",
        re.compile(
            r"(?:https?:)?//(?:thesmoketeam\.github\.io/qaas-docs|docs\.qaas\.online|qaas-docs)(?:[/#?)]|$)",
            re.IGNORECASE,
        ),
    ),
    (
        "file URL",
        re.compile(r"\bfile://", re.IGNORECASE),
    ),
    (
        "root-relative Markdown link",
        re.compile(r"\]\(\s*/(?!/)[^)]+\)"),
    ),
)


def error(path: Path, line_number: int, message: str) -> None:
    print(f"::error file={path.as_posix()},line={line_number}::{message}", file=sys.stderr)


def check_page(path: Path) -> bool:
    failed = False
    in_fence = False

    for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
        stripped = line.lstrip()
        if stripped.startswith("```") or stripped.startswith("~~~"):
            in_fence = not in_fence
            continue

        if in_fence:
            continue

        for label, pattern in RULES:
            if pattern.search(line):
                error(path, line_number, f"offline readiness violation: {label}")
                failed = True

    return failed


def main() -> int:
    failed = False
    checked = 0

    for path in sorted(DOCS_ROOT.rglob("*.md")):
        if SKIP_PARTS.intersection(path.parts):
            continue

        checked += 1
        if check_page(path):
            failed = True

    if failed:
        print("::error::offline readiness check failed", file=sys.stderr)
        return 1

    print(f"[check-offline-readiness] OK ({checked} pages)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
