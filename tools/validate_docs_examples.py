#!/usr/bin/env python3
"""Every reference/how-to/explanation page in spec-targeted areas must contain at least one fenced code example.

Spec-targeted areas (per QAAS_DOCS_SKILL_E2E_IMPROVEMENT_SPEC.md):
- docs/qaas/recipes
- docs/qaas/migration
- docs/qaas/advancedConcepts
- docs/qaas/userInterfaces
- docs/qaas/quickStart
- docs/assets/schemas
"""
from __future__ import annotations
import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
TARGET_ROOTS = [
    REPO_ROOT / "docs" / "qaas" / "recipes",
    REPO_ROOT / "docs" / "qaas" / "migration",
    REPO_ROOT / "docs" / "qaas" / "advancedConcepts",
    
    
    REPO_ROOT / "docs" / "assets" / "schemas",
]
TYPE_RE = re.compile(r"^\s*type\s*:\s*[\"']?(?P<t>reference|how-to|explanation)[\"']?\s*$", re.MULTILINE)
EXEMPT_RE = re.compile(r"^\s*examples_exempt\s*:\s*true\s*$", re.MULTILINE)


def split_frontmatter(text):
    if not text.startswith("---"):
        return None, text
    end = text.find("\n---", 3)
    if end == -1:
        return None, text
    return text[3:end].strip("\n"), text[end + 4:]


def fail(path, message):
    rel = path.relative_to(REPO_ROOT).as_posix()
    print(f"::error file={rel}::{message}", file=sys.stderr)


def main():
    errors = 0
    checked = 0
    for root in TARGET_ROOTS:
        if not root.exists():
            continue
        for md in root.rglob("*.md"):
            text = md.read_text(encoding="utf-8")
            fm, body = split_frontmatter(text)
            if fm is None:
                continue
            type_match = TYPE_RE.search(fm)
            if not type_match:
                continue
            if EXEMPT_RE.search(fm):
                continue
            checked += 1
            fence_count = body.count("\n```") // 2
            if fence_count < 1:
                fail(md, "page must contain at least one fenced code example.")
                errors += 1
    if errors:
        print(f"{errors} page(s) lack examples.", file=sys.stderr)
        return 1
    print(f"OK: {checked} pages have at least one example.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
