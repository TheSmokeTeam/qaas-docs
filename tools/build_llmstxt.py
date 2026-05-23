#!/usr/bin/env python3
"""Build llms.txt and shard-sized full-text bundles from docs frontmatter."""

from __future__ import annotations

import argparse
import re
from dataclasses import dataclass
from pathlib import Path

import yaml


MAX_BYTES = 900_000


@dataclass(frozen=True)
class Page:
    path: Path
    url: str
    title: str
    summary: str
    page_type: str
    status: str
    applies_to: tuple[str, ...]
    body: str


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--docs-dir", default="docs", help="MkDocs source directory")
    parser.add_argument("--site-dir", default="site", help="MkDocs output directory")
    parser.add_argument("--max-bytes", type=int, default=MAX_BYTES, help="Maximum bytes per llms-full shard")
    return parser.parse_args()


def read_page(path: Path, docs_dir: Path) -> Page | None:
    text = path.read_text(encoding="utf-8")
    if not text.startswith("---\n"):
        return None

    end = text.find("\n---\n", 4)
    if end == -1:
        return None

    frontmatter = yaml.safe_load(text[4:end]) or {}
    body = text[end + len("\n---\n") :].strip()
    title = first_heading(body) or str(frontmatter.get("id") or path.stem)
    summary = str(frontmatter.get("summary") or title).replace("\n", " ").strip()
    page_type = normalize_type(str(frontmatter.get("type") or "reference"))
    applies_to = tuple(str(item) for item in frontmatter.get("applies_to") or [])

    return Page(
        path=path,
        url=markdown_url(path, docs_dir),
        title=title,
        summary=summary,
        page_type=page_type,
        status=str(frontmatter.get("status") or "stable"),
        applies_to=applies_to,
        body=clean_body(body),
    )


def markdown_url(path: Path, docs_dir: Path) -> str:
    rel = path.relative_to(docs_dir).with_suffix("")
    parts = list(rel.parts)
    if parts == ["index"]:
        return "/"
    if parts[-1] == "index":
        parts = parts[:-1]
    return "/" + "/".join(parts) + "/"


def first_heading(body: str) -> str | None:
    match = re.search(r"^#\s+(.+?)\s*$", body, flags=re.MULTILINE)
    return match.group(1).strip() if match else None


def normalize_type(value: str) -> str:
    normalized = value.strip().lower()
    return {
        "tutorial": "tutorials",
        "tutorials": "tutorials",
        "how-to": "how-to",
        "howto": "how-to",
        "guide": "how-to",
        "reference": "reference",
        "explanation": "explanation",
    }.get(normalized, "reference")


def clean_body(body: str) -> str:
    body = re.sub(r"<!--.*?-->", "", body, flags=re.DOTALL)
    body = re.sub(r"\n{3,}", "\n\n", body)
    return body.strip()


def collect_pages(docs_dir: Path) -> list[Page]:
    pages: list[Page] = []
    for path in sorted(docs_dir.rglob("*.md")):
        page = read_page(path, docs_dir)
        if page is not None:
            pages.append(page)
    return pages


def page_record(page: Page) -> str:
    components = ", ".join(page.applies_to) if page.applies_to else "general"
    return (
        f"## {page.title}\n\n"
        f"Source: {page.url}\n"
        f"Type: {page.page_type}\n"
        f"Applies to: {components}\n"
        f"Summary: {page.summary}\n\n"
        f"{page.body}\n"
    )


def shard_pages(pages: list[Page], max_bytes: int) -> list[tuple[str, list[Page]]]:
    shards: list[tuple[str, list[Page]]] = []
    for page_type in ("tutorials", "how-to", "explanation", "reference"):
        typed_pages = [page for page in pages if page.page_type == page_type and page.status != "deprecated"]
        current: list[Page] = []
        current_size = 0
        index = 1
        for page in typed_pages:
            record_size = len(page_record(page).encode("utf-8")) + 2
            if current and current_size + record_size > max_bytes:
                shards.append((f"{page_type}-{index}", current))
                current = []
                current_size = 0
                index += 1
            current.append(page)
            current_size += record_size
        if current:
            shards.append((f"{page_type}-{index}", current))
    return shards


def write_llms_txt(site_dir: Path, pages: list[Page], shards: list[tuple[str, list[Page]]]) -> None:
    lines = [
        "# QaaS Documentation",
        "",
        "> Runner, Mocker, Framework, hook catalog, and offline packaging documentation.",
        "",
        "This index is generated from checked frontmatter summaries. Use the full-content shards when page bodies are needed.",
        "",
    ]

    for heading, page_type in (
        ("Tutorials", "tutorials"),
        ("How-To", "how-to"),
        ("Explanation", "explanation"),
        ("Reference", "reference"),
    ):
        section_pages = [page for page in pages if page.page_type == page_type and page.status != "deprecated"]
        if not section_pages:
            continue
        lines.extend([f"## {heading}", ""])
        for page in section_pages:
            lines.append(f"- [{page.title}]({page.url}): {page.summary}")
        lines.append("")

    deprecated = [page for page in pages if page.status == "deprecated"]
    if deprecated:
        lines.extend(["## Optional", ""])
        for page in deprecated:
            lines.append(f"- [{page.title}]({page.url}): {page.summary}")
        lines.append("")

    lines.extend(["## Full Content", ""])
    for shard_name, _ in shards:
        lines.append(f"- [{shard_name}](/{shard_name_to_file(shard_name)}): Full page bodies for {shard_name}.")
    lines.append("")

    (site_dir / "llms.txt").write_text("\n".join(lines), encoding="utf-8", newline="\n")


def shard_name_to_file(shard_name: str) -> str:
    return f"llms-full-{shard_name}.txt"


def write_full_shards(site_dir: Path, shards: list[tuple[str, list[Page]]]) -> None:
    index_lines = [
        "# QaaS Full Content Shards",
        "",
        "> Full page content is split into files below 1 MB.",
        "",
    ]
    for shard_name, pages in shards:
        filename = shard_name_to_file(shard_name)
        title = f"QaaS full content: {shard_name}"
        content_lines = [f"# {title}", ""]
        for page in pages:
            content_lines.append(page_record(page))
        (site_dir / filename).write_text(
            "\n\n".join(content_lines).strip() + "\n", encoding="utf-8", newline="\n"
        )
        index_lines.append(f"- [{shard_name}](/{filename}): {len(pages)} pages.")

    (site_dir / "llms-full.txt").write_text(
        "\n".join(index_lines) + "\n", encoding="utf-8", newline="\n"
    )


def main() -> int:
    args = parse_args()
    docs_dir = Path(args.docs_dir)
    site_dir = Path(args.site_dir)
    site_dir.mkdir(parents=True, exist_ok=True)

    pages = collect_pages(docs_dir)
    shards = shard_pages(pages, args.max_bytes)
    write_llms_txt(site_dir, pages, shards)
    write_full_shards(site_dir, shards)

    print(f"[build-llmstxt] pages={len(pages)} shards={len(shards)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
