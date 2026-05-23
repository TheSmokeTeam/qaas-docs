#!/usr/bin/env python3
from __future__ import annotations

import json
import sys
from dataclasses import dataclass
from pathlib import Path


DOCS_ROOT = Path("docs")
MKDOCS_CONFIG = Path("mkdocs.yml")


@dataclass(frozen=True)
class Catalog:
    label: str
    schema: Path
    collection: str
    selector: str
    config: str
    pages_dir: Path
    index_page: Path
    applies_to: str


CATALOGS = (
    Catalog(
        label="assertions",
        schema=DOCS_ROOT / "assets" / "schemas" / "assertions.schema.json",
        collection="Assertions",
        selector="Assertion",
        config="AssertionConfiguration",
        pages_dir=DOCS_ROOT / "assertions" / "availableAssertions",
        index_page=DOCS_ROOT / "assertions" / "index.md",
        applies_to="assertions",
    ),
    Catalog(
        label="generators",
        schema=DOCS_ROOT / "assets" / "schemas" / "generators.schema.json",
        collection="Generators",
        selector="Generator",
        config="GeneratorConfiguration",
        pages_dir=DOCS_ROOT / "generators" / "availableGenerators",
        index_page=DOCS_ROOT / "generators" / "index.md",
        applies_to="generators",
    ),
    Catalog(
        label="probes",
        schema=DOCS_ROOT / "assets" / "schemas" / "probes.schema.json",
        collection="Probes",
        selector="Probe",
        config="ProbeConfiguration",
        pages_dir=DOCS_ROOT / "probes" / "availableProbes",
        index_page=DOCS_ROOT / "probes" / "index.md",
        applies_to="probes",
    ),
    Catalog(
        label="processors",
        schema=DOCS_ROOT / "assets" / "schemas" / "processors.schema.json",
        collection="Processors",
        selector="Processor",
        config="ProcessorConfiguration",
        pages_dir=DOCS_ROOT / "processors" / "availableProcessors",
        index_page=DOCS_ROOT / "processors" / "index.md",
        applies_to="processors",
    ),
)


def error(path: Path, message: str) -> None:
    print(f"::error file={path.as_posix()}::{message}", file=sys.stderr)


def load_schema(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def item_properties(schema: dict, catalog: Catalog) -> dict:
    items = schema["properties"][catalog.collection]["items"]
    if isinstance(items, list):
        items = items[0]
    return items["properties"]


def enum_values(properties: dict, name: str) -> list[str]:
    values: list[str] = []
    for option in properties[name].get("anyOf", []):
        for value in option.get("enum", []):
            if isinstance(value, str):
                values.append(value)
    return values


def config_titles(properties: dict, name: str) -> list[str]:
    titles: list[str] = []
    for option in properties[name].get("anyOf", []):
        title = option.get("title")
        if isinstance(title, str):
            titles.append(title)
    return titles


def read_if_present(path: Path) -> str | None:
    if not path.exists():
        return None
    return path.read_text(encoding="utf-8")


def require_text(path: Path, text: str | None, needle: str, message: str) -> bool:
    if text is None:
        error(path, "missing expected catalog page")
        return False
    if needle not in text:
        error(path, message)
        return False
    return True


def docs_path(path: Path) -> str:
    return path.relative_to(DOCS_ROOT).as_posix()


def check_catalog(catalog: Catalog, mkdocs_text: str) -> tuple[bool, int]:
    failed = False
    schema = load_schema(catalog.schema)
    properties = item_properties(schema, catalog)
    names = enum_values(properties, catalog.selector)
    titles = config_titles(properties, catalog.config)

    if not names:
        error(catalog.schema, f"{catalog.selector} enum is empty")
        return True, 0

    missing_titles = sorted(set(names) - set(titles))
    extra_titles = sorted(set(titles) - set(names))
    if missing_titles:
        error(catalog.schema, f"{catalog.config} titles missing: {', '.join(missing_titles)}")
        failed = True
    if extra_titles:
        error(catalog.schema, f"{catalog.config} titles without selector enum: {', '.join(extra_titles)}")
        failed = True

    page_dirs = {path.name for path in catalog.pages_dir.iterdir() if path.is_dir()}
    missing_dirs = sorted(set(names) - page_dirs)
    extra_dirs = sorted(page_dirs - set(names))
    if missing_dirs:
        error(catalog.pages_dir, f"missing catalog directories: {', '.join(missing_dirs)}")
        failed = True
    if extra_dirs:
        error(catalog.pages_dir, f"stale catalog directories: {', '.join(extra_dirs)}")
        failed = True

    index_text = read_if_present(catalog.index_page)
    if index_text is None:
        error(catalog.index_page, "missing family index page")
        return True, len(names)

    for marker in ("<!-- generated hook catalog start -->", "<!-- generated hook catalog end -->"):
        if marker not in index_text:
            error(catalog.index_page, f"missing generated catalog marker: {marker}")
            failed = True

    schema_name = catalog.schema.name
    expected_frontmatter = (f"applies_to: [{catalog.applies_to}]", f"type: reference")

    for name in names:
        base = catalog.pages_dir / name
        pages = (
            base / "overview.md",
            base / "configuration" / "tableView.md",
            base / "configuration" / "yamlView.md",
        )

        for page in pages:
            page_text = read_if_present(page)
            if page_text is None:
                error(page, "missing expected catalog page")
                failed = True
                continue

            for needle in expected_frontmatter:
                if needle not in page_text:
                    error(page, f"missing frontmatter entry: {needle}")
                    failed = True
            if "Verified-against:" not in page_text:
                error(page, "missing verification marker")
                failed = True

            nav_path = docs_path(page)
            if nav_path not in mkdocs_text:
                error(MKDOCS_CONFIG, f"missing nav entry for {nav_path}")
                failed = True

        overview = base / "overview.md"
        table = base / "configuration" / "tableView.md"
        yaml = base / "configuration" / "yamlView.md"
        overview_text = read_if_present(overview)
        table_text = read_if_present(table)
        yaml_text = read_if_present(yaml)

        if not require_text(overview, overview_text, f"# {name}", "overview heading does not match selector name"):
            failed = True
        for linked_page in ("configuration/tableView.md", "configuration/yamlView.md"):
            if not require_text(overview, overview_text, linked_page, f"overview missing link to {linked_page}"):
                failed = True

        for page, page_text in ((table, table_text), (yaml, yaml_text)):
            if not require_text(page, page_text, schema_name, f"page does not cite {schema_name}"):
                failed = True
            if not require_text(page, page_text, "../overview.md", "configuration page missing overview link"):
                failed = True

        index_link = f"{catalog.pages_dir.name}/{name}/overview.md"
        if index_link not in index_text:
            error(catalog.index_page, f"missing generated catalog link for {name}")
            failed = True

    return failed, len(names)


def main() -> int:
    mkdocs_text = MKDOCS_CONFIG.read_text(encoding="utf-8")
    failed = False
    checked = 0

    for catalog in CATALOGS:
        catalog_failed, catalog_checked = check_catalog(catalog, mkdocs_text)
        failed = failed or catalog_failed
        checked += catalog_checked

    if failed:
        print("::error::catalog coverage check failed", file=sys.stderr)
        return 1

    print(f"[check-catalog-coverage] OK ({checked} hooks)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
