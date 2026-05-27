#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


DOCS_ROOT = Path("docs")
SKIP_PARTS = {"_generated"}
HEADING_RE = re.compile(r"^(#{2,3})\s+(.+)$")
ANCHOR_RE = re.compile(r"\s+(?:\{#[A-Za-z0-9_-]+\}|\{:\s*#[A-Za-z0-9_-]+\})\s*$")


def main() -> int:
    failed = False
    checked = 0

    for path in sorted(DOCS_ROOT.rglob("*.md")):
        if SKIP_PARTS.intersection(path.parts):
            continue

        in_fence = False
        for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
            stripped = line.lstrip()
            if stripped.startswith("```") or stripped.startswith("~~~"):
                in_fence = not in_fence
                continue

            if in_fence:
                continue

            if not HEADING_RE.match(line):
                continue

            checked += 1
            if ANCHOR_RE.search(line):
                continue

            print(
                f"::error file={path.as_posix()},line={line_number}::heading missing explicit anchor",
                file=sys.stderr,
            )
            failed = True

    if failed:
        print("::error::heading anchor check failed", file=sys.stderr)
        return 1

    print(f"[check-heading-anchors] OK ({checked} headings)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
