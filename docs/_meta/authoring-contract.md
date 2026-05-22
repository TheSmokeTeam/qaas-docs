# Authoring Contract (mandatory for every revamped page)

Every page authored as part of the docs revamp MUST conform to this contract. CI gates and `/ultrareview` enforce it. No exceptions.

## 1. Frontmatter (required, validated by CI)

```yaml
---
id: <semantic.dot.path>          # e.g. framework.attributes.iteration.repeat — stable, never renamed
slug: <kebab-case>               # url leaf
type: tutorial | how-to | reference | explanation | cookbook
status: stable | beta | experimental | deprecated
since: <version-or-date>         # e.g. 2.4.0 or 2026-05-22
last_verified: YYYY-MM-DD        # date the author verified examples against source
applies_to: [framework, runner, mocker, assertions, generators, probes, processors, jsonschema, orchestrator]
prerequisites: [path/to/prereq/page.md, ...]
code_langs: [csharp, yaml]       # whichever are present in this page
keywords: [comma, separated, search, hints]
ai_summary: "<= 280 chars one-paragraph TL;DR aimed at LLM agents"
tags: [...optional Material tag plugin tags...]
canonical_url: /<full/url/path/>
---
```

## 2. Body skeleton (fixed order — every page)

1. `> TL;DR — <one sentence>` (Material blockquote, single line)
2. `## When to use {#when-to-use}` — bullet list of decision triggers
3. `## Prerequisites {#prerequisites}` — bullets, optional if empty
4. `## C# implementation {#csharp}` — full runnable snippet, language `csharp` fenced
5. `## YAML wiring {#yaml}` — paired YAML snippet, language `yaml` fenced
6. `## Example (minimal) {#example-minimal}` — smallest standalone example
7. `## Example (realistic) {#example-realistic}` — production-shaped example
8. `## Edge cases {#edge-cases}` — bullets: failure modes, gotchas, surprising defaults
9. `## See also {#see-also}` — relative links to related pages

Notes:
- Extension-point pages (`IAssertion`, `IGenerator`, `IProbe`, `IProcessor`, `IHook`) MUST ship a complete runnable class — not a stub.
- Reference pages MUST have ≥ 1 minimal + 1 realistic example.
- How-to pages MUST pair C# + YAML side-by-side (Material `=== "C#"` / `=== "YAML"` tabs).

## 3. Anchor + ID scheme

- Every `##` and `###` heading carries an explicit `{#stable-anchor}` via `attr_list`.
- Anchors are kebab-case, ≤ 4 words, semantic (not syntactic).
- Anchors NEVER change. If a heading is reworded, the anchor stays. If a heading is split, original anchor goes to the more general half + new anchor added to the new half.
- Cross-page links use relative `..` paths + the explicit anchor: `[See Foo](../bar/foo.md#stable-anchor)`.

## 4. ZIM-readiness rules

- No absolute URLs to our own site. Use relative links only.
- All images committed under `docs/assets/<area>/`; no hot-linked external images.
- No JS-required content in page body. Mermaid is OK (renders to SVG at build).
- All code blocks use fenced ` ``` ` syntax with language identifier (never indented).
- No `target="_blank"` raw HTML.
- Tables render to static HTML (Material's default — do not use JS data-table plugins).

## 5. Example-density rules

| Page type | Minimum examples |
|---|---|
| reference (catalog entry) | 1 minimal + 1 realistic |
| how-to | 1 paired C# + YAML in tabs |
| extension-point | 1 full runnable class + 1 YAML wiring |
| tutorial | ≥ 3 progressive snippets |
| explanation | ≥ 1 illustrative snippet |
| cookbook | full end-to-end project structure shown |

## 6. Forbidden anti-patterns (auto-fail in /ultrareview)

- Pseudocode where a real snippet would fit.
- GitHub blob links instead of in-site canonical references.
- Marketing fluff ("seamless", "powerful", "easy-to-use").
- Mega "API.md" pages — split per symbol.
- Snippets that don't compile or YAML that doesn't parse.
- Frontmatter missing `ai_summary` or `last_verified`.
- Anchor renames without a redirect entry.
- Nav depth > 4 introduced by a new section (current depth is grandfathered; do not deepen further).
- Source guessing — every named API must exist in source.

## 7. mkdocs.yml etiquette during fan-out

- **Never** edit `mkdocs.yml` directly from an authoring agent.
- Append your nav additions to `mkdocs.yml.fragments/<area>.yml` in your worktree.
- Fragment shape:

```yaml
# mkdocs.yml.fragments/<area>.yml
inject_under: "<exact existing nav section path or 'top-level'>"
nav_additions:
  - "Display Name": path/to/page.md
  - "Sub Section":
    - "Inner Page": path/to/inner.md
```

The integration agent merges fragments in alphabetical order at the end of Phase 2 and adjusts plugin block (mkdocs-llmstxt, htmlproofer, awesome-pages, etc.). Existing nav structure is preserved verbatim.

## 8. Commit etiquette

- Conventional Commits, one per logical chunk: `docs(<area>): <subject>`.
- Body explains WHY. Footer: `Verified-against: D:\QaaS\<repo>@<sha>`.
- Push every commit; do not squash locally — final PR review needs the trail.

## 9. Source verification (mandatory, no shortcut)

Before writing each page:
1. Locate the source class/attribute/interface in `D:\QaaS\<repo>`.
2. Read the file via `ctx_execute_file` (NOT bare Read) and print only the public surface + XMLDoc.
3. Cite `Verified-against: <repo>@<sha> <file:line>` in your commit message.
4. If XMLDoc is missing, write the doc page using the class name + observable behavior, AND log the source class in `docs/_meta/xmldoc-gaps.md` (append) so we file a follow-up PR against the source repo.
