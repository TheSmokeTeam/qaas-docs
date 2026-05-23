#!/usr/bin/env python3
from __future__ import annotations

import re
import sys
from pathlib import Path


DOCS_ROOT = Path("docs")
HOOK_CATALOGS = (
    DOCS_ROOT / "assertions" / "availableAssertions",
    DOCS_ROOT / "generators" / "availableGenerators",
    DOCS_ROOT / "probes" / "availableProbes",
    DOCS_ROOT / "processors" / "availableProcessors",
)
CUSTOM_GUIDES = (
    DOCS_ROOT / "assertions" / "custom-authoring-guide.md",
    DOCS_ROOT / "generators" / "custom-authoring-guide.md",
    DOCS_ROOT / "probes" / "custom-authoring-guide.md",
    DOCS_ROOT / "processors" / "custom-authoring-guide.md",
)

H2_RE = re.compile(r"^##\s+(.+?)(?:\s+\{[:#].*)?\s*$")
FENCE_RE = re.compile(r"^```([A-Za-z0-9_+.#-]*)\s*$", re.MULTILINE)


def error(path: Path, message: str) -> None:
    print(f"::error file={path.as_posix()}::{message}", file=sys.stderr)


def sections(text: str) -> dict[str, str]:
    lines = text.splitlines()
    result: dict[str, str] = {}
    current: str | None = None
    start = 0

    for index, line in enumerate(lines):
        match = H2_RE.match(line)
        if not match:
            continue

        if current is not None:
            result[current] = "\n".join(lines[start:index])
        current = match.group(1).strip()
        start = index + 1

    if current is not None:
        result[current] = "\n".join(lines[start:])

    return result


def fence_langs(text: str) -> set[str]:
    return {match.group(1).lower() for match in FENCE_RE.finditer(text)}


def has_body_text(text: str) -> bool:
    for line in text.splitlines():
        stripped = line.strip()
        if stripped and not stripped.startswith("```"):
            return True
    return False


def check_hook_overview(path: Path) -> bool:
    failed = False
    page_sections = sections(path.read_text(encoding="utf-8"))

    for heading in ("Minimal example", "Realistic example"):
        if heading not in page_sections:
            error(path, f"missing {heading} section")
            failed = True

    minimal = page_sections.get("Minimal example", "")
    if "yaml" not in fence_langs(minimal):
        error(path, "minimal example must include a YAML block")
        failed = True

    realistic = page_sections.get("Realistic example", "")
    if not has_body_text(realistic):
        error(path, "realistic example must include explanatory content")
        failed = True

    return failed


def check_yaml_scaffold(path: Path) -> bool:
    failed = False
    page_sections = sections(path.read_text(encoding="utf-8"))

    if "Minimal example" not in page_sections:
        error(path, "missing Minimal example section")
        return True

    if "yaml" not in fence_langs(page_sections["Minimal example"]):
        error(path, "minimal example must include a YAML block")
        failed = True

    return failed


def check_custom_guide(path: Path) -> bool:
    failed = False
    text = path.read_text(encoding="utf-8")
    page_sections = sections(text)
    langs = fence_langs(text)

    for heading in ("Minimal example", "Realistic example"):
        if heading not in page_sections:
            error(path, f"missing {heading} section")
            failed = True
        elif not has_body_text(page_sections[heading]):
            error(path, f"{heading} section must not be empty")
            failed = True

    if "yaml" not in langs:
        error(path, "missing YAML example block")
        failed = True

    if not {"csharp", "cs"}.intersection(langs):
        error(path, "missing C# example block")
        failed = True

    return failed


def main() -> int:
    failed = False
    checked = 0

    for catalog in HOOK_CATALOGS:
        for hook_dir in sorted(path for path in catalog.iterdir() if path.is_dir()):
            overview = hook_dir / "overview.md"
            yaml_scaffold = hook_dir / "configuration" / "yamlView.md"

            checked += 1
            if check_hook_overview(overview):
                failed = True

            checked += 1
            if check_yaml_scaffold(yaml_scaffold):
                failed = True

    for guide in CUSTOM_GUIDES:
        checked += 1
        if check_custom_guide(guide):
            failed = True

    if failed:
        print("::error::example density check failed", file=sys.stderr)
        return 1

    print(f"[check-example-density] OK ({checked} pages)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
