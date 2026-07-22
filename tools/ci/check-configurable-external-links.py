#!/usr/bin/env python3
"""Fail when a documentation link bypasses the QAAS_DOCS_LINK_* contract."""

from __future__ import annotations

import importlib.util
import json
import os
import re
import subprocess
import sys
import tempfile
from pathlib import Path
from collections.abc import Iterator


ROOT = Path(__file__).resolve().parents[2]
DOCS_ROOT = ROOT / "docs"
SETTINGS_MODULE = ROOT / "tools" / "write_runtime_link_defaults.py"

DIRECT_LINK_PATTERNS = (
    re.compile(r"\]\((https?://[^)\s]+)"),
    re.compile(r"<(https?://[^>\s]+)>"),
    re.compile(r"href=[\"'](https?://[^\"']+)[\"']"),
)
LINK_MACRO_PATTERN = re.compile(r"\{\{\s*links\.([a-z0-9_]+)\s*\}\}")
FENCE_PATTERN = re.compile(r"^\s*(```|~~~)")


def fail(message: str) -> None:
    raise SystemExit(f"::error::{message}")


def load_settings() -> dict[str, tuple[str, str]]:
    spec = importlib.util.spec_from_file_location("qaas_runtime_links", SETTINGS_MODULE)
    if spec is None or spec.loader is None:
        fail(f"Could not load {SETTINGS_MODULE.relative_to(ROOT)}")

    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    settings = getattr(module, "SETTINGS", None)
    if not isinstance(settings, dict):
        fail("tools/write_runtime_link_defaults.py must expose a SETTINGS dictionary")
    return settings


def iter_markdown_lines() -> Iterator[tuple[Path, int, str]]:
    for path in sorted(DOCS_ROOT.rglob("*.md")):
        in_fence = False
        for line_number, line in enumerate(
            path.read_text(encoding="utf-8").splitlines(), start=1
        ):
            if FENCE_PATTERN.match(line):
                in_fence = not in_fence
                continue
            if not in_fence:
                yield path, line_number, line


def validate_document_links(settings: dict[str, tuple[str, str]]) -> tuple[int, int]:
    registered_urls = {
        default
        for environment_variable, default in settings.values()
        if environment_variable.startswith("QAAS_DOCS_LINK_")
        and default.startswith(("http://", "https://"))
    }
    direct_links = 0
    macro_links = 0
    errors: list[str] = []

    for path, line_number, line in iter_markdown_lines():
        relative_path = path.relative_to(ROOT)
        for pattern in DIRECT_LINK_PATTERNS:
            for match in pattern.finditer(line):
                direct_links += 1
                url = match.group(1).rstrip(".,")
                if url not in registered_urls:
                    errors.append(
                        f"{relative_path}:{line_number}: external link is not backed by a "
                        f"QAAS_DOCS_LINK_* setting: {url}"
                    )

        for match in LINK_MACRO_PATTERN.finditer(line):
            macro_links += 1
            key = match.group(1)
            if key not in settings:
                errors.append(
                    f"{relative_path}:{line_number}: links.{key} is not registered in "
                    "tools/write_runtime_link_defaults.py"
                )

    if errors:
        fail("\n".join(errors))
    return direct_links, macro_links


def validate_delivery_surfaces(settings: dict[str, tuple[str, str]]) -> None:
    mkdocs = (ROOT / "mkdocs.yml").read_text(encoding="utf-8")
    dockerfile = (ROOT / "Dockerfile").read_text(encoding="utf-8")
    workflow = (ROOT / ".github" / "workflows" / "ci.yml").read_text(
        encoding="utf-8"
    )
    entrypoint = (
        ROOT / "tools" / "docker-entrypoint.d" / "qaas-docs-runtime-overrides.sh"
    ).read_text(encoding="utf-8")
    nginx = (ROOT / "tools" / "nginx.conf").read_text(encoding="utf-8")
    readme = (ROOT / "README.md").read_text(encoding="utf-8")

    errors: list[str] = []
    link_settings = {
        key: setting
        for key, setting in settings.items()
        if setting[0].startswith("QAAS_DOCS_LINK_")
        and setting[1].startswith(("http://", "https://"))
    }
    for key, (environment_variable, default) in link_settings.items():
        expected_mkdocs = f'{key}: !ENV [{environment_variable}, "{default}"]'
        expected_docker_arg = f"ARG {environment_variable}={default}"
        expected_docker_env = f"{environment_variable}=${{{environment_variable}}}"
        expected_entrypoint = f"{key} {environment_variable}"
        expected_workflow = (
            f"{environment_variable}: ${{{{ vars.{environment_variable} || '{default}' }}}}"
        )
        for surface, expected, content in (
            ("mkdocs.yml", expected_mkdocs, mkdocs),
            ("Dockerfile ARG", expected_docker_arg, dockerfile),
            ("Dockerfile ENV", expected_docker_env, dockerfile),
            ("container entrypoint", expected_entrypoint, entrypoint),
            ("CI workflow", expected_workflow, workflow),
        ):
            if expected not in content:
                errors.append(f"{surface} is missing {environment_variable} ({key})")

        if environment_variable not in readme or f"`{key}`" not in readme:
            errors.append(f"README.md does not document {environment_variable} ({key})")

    runtime_contract = (
        ("Dockerfile", 'USER 101', dockerfile),
        (
            "Dockerfile",
            'ENTRYPOINT ["/usr/local/bin/qaas-docs-entrypoint"]',
            dockerfile,
        ),
        ("container entrypoint", 'runtime_dir="/tmp/qaas-docs"', entrypoint),
        ("container entrypoint", 'exec "$@"', entrypoint),
        ("Nginx config", "pid /tmp/qaas-docs/nginx.pid;", nginx),
        (
            "Nginx config",
            "location = /assets/javascripts/qaas-docs-runtime-overrides.min.js",
            nginx,
        ),
        ("Nginx config", 'Cache-Control "no-store, no-cache', nginx),
    )
    for surface, expected, content in runtime_contract:
        if expected not in content:
            errors.append(f"{surface} is missing runtime image contract: {expected}")

    if errors:
        fail("\n".join(errors))


def validate_build_time_overrides(settings: dict[str, tuple[str, str]]) -> None:
    link_settings = {
        key: setting
        for key, setting in settings.items()
        if setting[0].startswith("QAAS_DOCS_LINK_")
        and setting[1].startswith(("http://", "https://"))
    }
    environment = os.environ.copy()
    expected_overrides: dict[str, str] = {}
    for key, (environment_variable, _) in link_settings.items():
        override = f"https://qaas-docs-override.invalid/{key}"
        environment[environment_variable] = override
        expected_overrides[key] = override

    with tempfile.TemporaryDirectory() as temporary_directory:
        output_path = Path(temporary_directory) / "runtime-link-defaults.js"
        subprocess.run(
            [sys.executable, str(SETTINGS_MODULE), str(output_path)],
            cwd=ROOT,
            env=environment,
            check=True,
        )
        generated = output_path.read_text(encoding="utf-8")

    def read_object(global_name: str) -> dict[str, str]:
        match = re.search(
            rf"window\.{re.escape(global_name)}\s*=\s*(\{{.*?\}});",
            generated,
            re.DOTALL,
        )
        if match is None:
            fail(f"Generated runtime settings are missing {global_name}")
        return json.loads(match.group(1))

    canonical_defaults = read_object("__QAAS_DOCS_CANONICAL_DEFAULTS__")
    build_defaults = read_object("__QAAS_DOCS_BUILD_DEFAULTS__")
    errors: list[str] = []
    for key, (_, default) in link_settings.items():
        if canonical_defaults.get(key) != default:
            errors.append(f"canonical default changed while overriding links.{key}")
        if build_defaults.get(key) != expected_overrides[key]:
            errors.append(f"build-time environment override did not reach links.{key}")

    runtime_script = (
        ROOT / "docs" / "assets" / "javascripts" / "runtime-link-overrides.js"
    ).read_text(encoding="utf-8")
    for required_fragment in (
        "__QAAS_DOCS_CANONICAL_DEFAULTS__",
        "replacements.set(canonicalValue, effectiveValue)",
        "replacements.set(buildValue, effectiveValue)",
        "orderedReplacementSources",
        "return value.replace(pattern",
    ):
        if required_fragment not in runtime_script:
            errors.append(
                "runtime-link-overrides.js cannot replace literal generated links: "
                f"missing {required_fragment}"
            )

    if errors:
        fail("\n".join(errors))


def main() -> int:
    settings = load_settings()
    direct_links, macro_links = validate_document_links(settings)
    validate_delivery_surfaces(settings)
    validate_build_time_overrides(settings)
    print(
        "[check-configurable-external-links] OK: "
        f"{direct_links} direct and {macro_links} macro link occurrences are configurable"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
