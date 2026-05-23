#!/usr/bin/env python3
"""Structural validation of fenced csharp blocks in spec-targeted areas."""
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
FENCE_OPEN = re.compile(r"^```csharp(?P<flags>.*?)$", re.MULTILINE)
FORBIDDEN = ("null!", ".Result", ".Wait()", "GetAwaiter().GetResult()")


def iter_blocks(text):
    for m in FENCE_OPEN.finditer(text):
        flags = m.group("flags").strip()
        start = m.end() + 1
        close = text.find("\n```", start)
        if close == -1:
            continue
        body = text[start:close]
        line = text.count("\n", 0, m.start()) + 1
        yield flags, body, line


def fail(path, line, message):
    rel = path.relative_to(REPO_ROOT).as_posix()
    print(f"::error file={rel},line={line}::{message}", file=sys.stderr)


def check_block(path, start_line, body):
    errors = 0
    if body.count("{") != body.count("}"):
        fail(path, start_line, "Unbalanced braces in C# snippet.")
        errors += 1
    if body.count("(") != body.count(")"):
        fail(path, start_line, "Unbalanced parens in C# snippet.")
        errors += 1
    for token in FORBIDDEN:
        if token in body:
            fail(path, start_line, f"Forbidden token in C# snippet: {token}")
            errors += 1
    return errors


def main():
    errors = 0
    checked = 0
    for root in TARGET_ROOTS:
        if not root.exists():
            continue
        for md in root.rglob("*.md"):
            text = md.read_text(encoding="utf-8")
            for flags, body, line in iter_blocks(text):
                if "allow-incomplete" in flags:
                    continue
                checked += 1
                errors += check_block(md, line, body)
    if errors:
        print(f"{errors} C# snippet issue(s) across {checked} blocks.", file=sys.stderr)
        return 1
    print(f"OK: {checked} C# snippets structurally valid.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
