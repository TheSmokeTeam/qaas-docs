#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


DOCS_ROOT = Path("docs")
REQUIRED = ("id", "type", "status", "since", "last_verified", "applies_to", "keywords", "summary")
SKIPPED_PATHS = {Path("docs/index.md")}
SKIPPED_PARTS = {"_meta", "_generated"}
FORBIDDEN_WORDS = re.compile(
    r"\b("
    r"A" r"I|"
    r"ag" r"ents?|"
    r"L" r"LMs?|"
    r"Clau" r"de|"
    r"ChatG" r"PT|"
    r"co" r"pilot|"
    r"a" r"i_summary|"
    r"mo" r"dels?|"
    r"sea" r"mless|"
    r"power" r"ful|"
    r"easy-to-" r"use|"
    r"ro" r"bust|"
    r"cutting-" r"edge|"
    r"simp" r"ly|"
    r"ju" r"st|"
    r"obvi" r"ously"
    r")\b|"
    r"TO" r"DO: implement|"
    r"pseudo" r"code|"
    r"imagine" r" this",
    re.IGNORECASE,
)


def error(path: Path, message: str) -> None:
    print(f"::error file={path.as_posix()}::{message}", file=sys.stderr)


def should_skip(path: Path) -> bool:
    return path in SKIPPED_PATHS or bool(SKIPPED_PARTS.intersection(path.parts))


def split_frontmatter(text: str) -> tuple[str | None, str]:
    lines = text.replace("\r\n", "\n").replace("\r", "\n").split("\n")
    if not lines or lines[0].strip() != "---":
        return None, text

    for index, line in enumerate(lines[1:], start=1):
        if line.strip() == "---":
            return "\n".join(lines[1:index]), "\n".join(lines[index + 1 :])

    return None, text


def has_key(frontmatter: str, key: str) -> bool:
    return re.search(rf"^[ \t]*{re.escape(key)}[ \t]*:", frontmatter, re.MULTILINE) is not None


def summary_value(frontmatter: str) -> str:
    match = re.search(r"^[ \t]*summary:[ \t]*(.*)$", frontmatter, re.MULTILINE)
    return "" if match is None else match.group(1).replace('"', "")


def main() -> int:
    failed = False

    for path in sorted(DOCS_ROOT.rglob("*.md")):
        if should_skip(path):
            continue

        text = path.read_text(encoding="utf-8")
        frontmatter, body = split_frontmatter(text)
        if not frontmatter:
            error(path, "missing frontmatter block")
            failed = True
            continue

        for key in REQUIRED:
            if not has_key(frontmatter, key):
                error(path, f"frontmatter missing required field: {key}")
                failed = True

        if has_key(frontmatter, "ai_summary"):
            error(path, "frontmatter contains removed v1 summary field")
            failed = True

        summary = summary_value(frontmatter)
        if len(summary) > 200:
            error(path, f"summary exceeds 200 chars ({len(summary)})")
            failed = True

        if FORBIDDEN_WORDS.search(frontmatter):
            error(path, "frontmatter contains blocked word/phrase from authoring-contract-v2")
            failed = True

        if FORBIDDEN_WORDS.search(body):
            error(path, "contains forbidden word/phrase from authoring-contract-v2")
            failed = True

    if failed:
        print("::error::frontmatter conformance failed", file=sys.stderr)
        return 1

    print("[check-frontmatter] OK")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
