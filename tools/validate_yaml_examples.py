#!/usr/bin/env python3
"""Parse every fenced yaml block under docs/qaas/ using PyYAML."""
from __future__ import annotations
import re
import sys
from pathlib import Path

try:
    import yaml
except ImportError:
    print("::notice::PyYAML not available, skipping YAML example validation.", file=sys.stderr)
    sys.exit(0)

REPO_ROOT = Path(__file__).resolve().parents[1]
DOCS = REPO_ROOT / "docs" / "qaas"

FENCE_OPEN = re.compile(r"^```yaml(?P<flags>.*?)$", re.MULTILINE)


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
    print(f"::error file={path.relative_to(REPO_ROOT).as_posix()},line={line}::{message}", file=sys.stderr)


def main():
    errors = 0
    checked = 0
    for md in DOCS.rglob("*.md"):
        text = md.read_text(encoding="utf-8")
        for flags, body, line in iter_blocks(text):
            if "allow-invalid" in flags:
                continue
            checked += 1
            try:
                yaml.safe_load(body)
            except yaml.YAMLError as exc:
                fail(md, line, f"Invalid YAML example: {exc}")
                errors += 1
    if errors:
        print(f"{errors} YAML example error(s) across {checked} blocks.", file=sys.stderr)
        return 1
    print(f"OK: {checked} YAML examples parsed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
