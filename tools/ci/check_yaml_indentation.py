#!/usr/bin/env python3
"""Enforce canonical indentation in every Markdown YAML fence."""

from __future__ import annotations

import re
import sys
from dataclasses import dataclass
from pathlib import Path

from yamllint import linter
from yamllint.config import YamlLintConfig


ROOT = Path(__file__).resolve().parents[2]
DOCS_ROOT = ROOT / "docs"
FENCE_OPEN = re.compile(r"^(?P<indent> *)```yaml(?P<flags>[^\r\n]*)$")
FENCE_CLOSE = re.compile(r"^ *```[ \t]*$")
TEMPLATE_EXPRESSION = re.compile(r"\{\{.*?\}\}")
TEMPLATE_STATEMENT = re.compile(r"\{%.*?%\}")
STANDALONE_SEQUENCE_ITEM = re.compile(r"^ *- *(?:#.*)?$")
INDENTATION_CONFIG = YamlLintConfig(
    """rules:
  indentation:
    spaces: 2
    indent-sequences: consistent
    check-multi-line-strings: false
"""
)


@dataclass(frozen=True)
class YamlFence:
    path: Path
    opening_line: int
    flags: str
    markdown_indent: str
    body_lines: tuple[str, ...]


@dataclass(frozen=True)
class Finding:
    line: int
    column: int
    message: str


def iter_yaml_fences(path: Path) -> list[YamlFence]:
    lines = path.read_text(encoding="utf-8").splitlines()
    fences: list[YamlFence] = []
    index = 0

    while index < len(lines):
        opening = FENCE_OPEN.match(lines[index])
        if opening is None:
            index += 1
            continue

        closing_index = index + 1
        while closing_index < len(lines) and FENCE_CLOSE.match(lines[closing_index]) is None:
            closing_index += 1

        if closing_index >= len(lines):
            break

        fences.append(
            YamlFence(
                path=path,
                opening_line=index + 1,
                flags=opening.group("flags").strip(),
                markdown_indent=opening.group("indent"),
                body_lines=tuple(lines[index + 1 : closing_index]),
            )
        )
        index = closing_index + 1

    return fences


def normalize_markdown_indentation(fence: YamlFence) -> tuple[list[str], list[Finding]]:
    normalized: list[str] = []
    findings: list[Finding] = []
    prefix = fence.markdown_indent

    for offset, line in enumerate(fence.body_lines, start=1):
        if not line.strip():
            normalized.append("")
            continue
        if prefix and not line.startswith(prefix):
            findings.append(
                Finding(
                    line=fence.opening_line + offset,
                    column=1,
                    message="YAML content is indented less than its Markdown fence",
                )
            )
            normalized.append(line)
            continue
        normalized.append(line[len(prefix) :])

    return normalized, findings


def sanitize_templates(lines: list[str]) -> str:
    sanitized: list[str] = []
    for line in lines:
        stripped = line.strip()
        if (
            (stripped.startswith("{{") and stripped.endswith("}}"))
            or (stripped.startswith("{%") and stripped.endswith("%}"))
        ):
            indentation = line[: len(line) - len(line.lstrip())]
            sanitized.append(f"{indentation}# template directive")
            continue

        line = TEMPLATE_EXPRESSION.sub("template", line)
        line = TEMPLATE_STATEMENT.sub("template", line)
        sanitized.append(line)

    return "\n".join(sanitized) + "\n"


def validate_fence(fence: YamlFence) -> list[Finding]:
    if "allow-invalid" in fence.flags:
        return []

    lines, findings = normalize_markdown_indentation(fence)
    for offset, line in enumerate(lines, start=1):
        if STANDALONE_SEQUENCE_ITEM.match(line):
            findings.append(
                Finding(
                    line=fence.opening_line + offset,
                    column=len(line) - len(line.lstrip()) + 1,
                    message=(
                        "standalone '-' sequence items are not canonical; put the first "
                        "mapping key on the dash or use an explicit value"
                    ),
                )
            )

    sanitized = sanitize_templates(lines)
    for problem in linter.run(sanitized, INDENTATION_CONFIG):
        findings.append(
            Finding(
                line=fence.opening_line + problem.line,
                column=problem.column,
                message=problem.desc,
            )
        )

    return findings


def main() -> int:
    checked = 0
    failures = 0
    for path in sorted(DOCS_ROOT.rglob("*.md")):
        for fence in iter_yaml_fences(path):
            checked += 1
            for finding in validate_fence(fence):
                failures += 1
                relative_path = path.relative_to(ROOT).as_posix()
                print(
                    f"::error file={relative_path},line={finding.line},"
                    f"col={finding.column}::{finding.message}"
                )

    if failures:
        print(f"[yaml-indentation] FAILED: {failures} finding(s) across {checked} blocks")
        return 1

    print(f"[yaml-indentation] OK: {checked} YAML blocks use canonical indentation")
    return 0


if __name__ == "__main__":
    sys.exit(main())
