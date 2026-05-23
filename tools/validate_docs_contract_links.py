#!/usr/bin/env python3
"""Validate every contract page exists on disk and is registered in mkdocs.yml."""
from __future__ import annotations
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
DOCS = REPO_ROOT / "docs"
MKDOCS = REPO_ROOT / "mkdocs.yml"

CONTRACT_PAGES = [
    "qaas/public-contract.md",
    "assets/schemas/index.md",
    "assets/schemas/runner-family-schema.md",
    "assets/schemas/mocker-family-schema.md",
    "assets/schemas/hook-family-schemas.md",
    "qaas/advancedConcepts/yaml-mechanics.md",
    "qaas/migration/index.md",
    "qaas/migration/runner-yaml.md",
    "qaas/migration/mocker-yaml.md",
    "qaas/migration/hooks.md",
    "qaas/migration/configuration-as-code.md",
    "qaas/migration/command-flags.md",
    "qaas/recipes/act-assert-replay.md",
    "qaas/recipes/dependency-gates.md",
    "qaas/recipes/schema-assertions.md",
    "qaas/recipes/storage-and-save-data.md",
    "qaas/recipes/test-project-readme.md",
]


def fail(path, message):
    print(f"::error file={path}::{message}", file=sys.stderr)


def main():
    errors = 0
    nav_text = MKDOCS.read_text(encoding="utf-8") if MKDOCS.exists() else ""
    for rel in CONTRACT_PAGES:
        abs_path = DOCS / rel
        if not abs_path.exists():
            fail(f"docs/{rel}", "Contract page missing on disk.")
            errors += 1
            continue
        if rel not in nav_text:
            fail(f"docs/{rel}", "Contract page not registered in mkdocs.yml nav.")
            errors += 1
    if errors:
        print(f"{errors} contract link error(s).", file=sys.stderr)
        return 1
    print(f"OK: {len(CONTRACT_PAGES)} contract pages present and linked.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
