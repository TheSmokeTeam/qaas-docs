#!/usr/bin/env python3
from __future__ import annotations

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))

from check_yaml_indentation import YamlFence, validate_fence  # noqa: E402


class YamlIndentationTests(unittest.TestCase):
    def make_fence(self, body: str, markdown_indent: str = "") -> YamlFence:
        lines = tuple(f"{markdown_indent}{line}" if line else "" for line in body.splitlines())
        return YamlFence(Path("docs/example.md"), 10, "", markdown_indent, lines)

    def test_accepts_two_space_mapping_and_sequence_indentation(self) -> None:
        findings = validate_fence(
            self.make_fence("Sessions:\n  - Name: example\n    Steps:\n      - Type: publish")
        )

        self.assertEqual([], findings)

    def test_removes_markdown_container_indentation_before_linting(self) -> None:
        findings = validate_fence(
            self.make_fence("Body: value\nMetaData:\n  Http:\n    Uri: value", "        ")
        )

        self.assertEqual([], findings)

    def test_rejects_four_space_yaml_mapping_levels(self) -> None:
        findings = validate_fence(
            self.make_fence("Body: value\nMetaData:\n    Http:\n        Uri: value")
        )

        self.assertTrue(any("wrong indentation" in finding.message for finding in findings))

    def test_rejects_standalone_sequence_dash(self) -> None:
        findings = validate_fence(self.make_fence("Items:\n  -\n    Name: value"))

        self.assertTrue(any("standalone '-'" in finding.message for finding in findings))

    def test_lints_helm_templates_after_sanitizing_expressions(self) -> None:
        findings = validate_fence(
            self.make_fence(
                "metadata:\n  name: {{ .Release.Name }}-docs\nspec:\n  replicas: {{ .Values.replicas }}"
            )
        )

        self.assertEqual([], findings)


if __name__ == "__main__":
    unittest.main()
