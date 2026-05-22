---
id: integrations.kiwix-mcp
slug: kiwix-mcp
type: how-to
status: stable
since: 2026-05-22
last_verified: 2026-05-22
applies_to: [framework, runner, mocker, assertions, generators, probes, processors, jsonschema, orchestrator]
prerequisites: []
code_langs: [yaml, bash]
keywords: [kiwix, mcp, zim, offline, agent, search, llm]
ai_summary: "How to point a Kiwix-style MCP server at the QaaS docs ZIM so coding agents can search the full QaaS documentation offline, with stable anchors and per-page metadata intact."
tags: [integrations, agents, offline]
canonical_url: /integrations/kiwix-mcp/
---

> TL;DR — Build the `qaas-docs.zim` artifact from CI (or locally via `tools/zim/build-zim.sh`), serve it with `kiwix-serve`, and register the Kiwix MCP server with your Claude/Cursor/Codex agent so it can `search_docs` / `get_page` against the offline archive.

## When to use {#when-to-use}

- Your coding agent needs to look up QaaS APIs without network access (air-gapped CI runners, plane mode, restricted enterprise networks).
- You want the agent to retrieve **stable-anchor** deep-links into the docs (e.g. `framework/attributes/repeat#example-realistic`) instead of guessing.
- You want one self-contained `.zim` file that ships every page, every code example, every YAML schema, and the `llms.txt` index — no JS, no external CDN dependencies.

## Prerequisites {#prerequisites}

- The published `qaas-docs.zim` artifact (downloaded from the latest CI run, or built locally).
- `kiwix-serve` installed (`apt install kiwix-tools` on Debian/Ubuntu, `brew install kiwix-tools` on macOS, or download from [openzim](https://download.openzim.org/release/kiwix-tools/)).
- An MCP-capable agent (Claude Code, Cursor, Codex, Continue, etc.) with permission to add an MCP server.

## C# implementation {#csharp}

<!-- skip-compile -->
```csharp
// Not applicable — this is an integration page, not an extension point.
// See cookbooks/ for runnable C# examples.
```

## YAML wiring {#yaml}

### MCP server config (Claude Code `.mcp.json` example)

```yaml
# .mcp.json (fragment — JSON in the real file)
mcpServers:
  qaas-docs-kiwix:
    command: "npx"
    args:
      - "-y"
      - "@modelcontextprotocol/server-fetch"
      - "--allow-host"
      - "localhost:8888"
    env:
      KIWIX_BASE_URL: "http://localhost:8888"
```

> Note — There is no first-party `kiwix-mcp` package on npm/PyPI as of 2026-05-22. The pattern above uses the official `@modelcontextprotocol/server-fetch` MCP server pointed at a local `kiwix-serve` instance. If a dedicated `kiwix-mcp` ships later, swap it in here; the rest of the integration is unchanged.

### Cursor / Codex equivalent

Place the same `mcpServers` block in `~/.cursor/mcp.json` or `~/.codex/mcp.json` respectively.

## Example (minimal) {#example-minimal}

```bash
# 1. Build (or download) the ZIM
tools/zim/build-zim.sh qaas-docs.zim

# 2. Serve it
kiwix-serve --port 8888 qaas-docs.zim &

# 3. Smoke-test via curl
curl -s http://localhost:8888/search?books.name=qaas-docs&pattern=IProbe | head -20
```

## Example (realistic) {#example-realistic}

End-to-end: an agent answering "how do I write a custom probe that fires on HTTP 503?"

```bash
# Background service (systemd unit example)
cat > /etc/systemd/system/kiwix-qaas-docs.service <<'EOF'
[Unit]
Description=Kiwix server for QaaS docs ZIM
After=network.target

[Service]
ExecStart=/usr/bin/kiwix-serve --port 8888 /var/lib/kiwix/qaas-docs.zim
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
systemctl enable --now kiwix-qaas-docs

# Agent now resolves queries against the local archive:
#   GET http://localhost:8888/search?books.name=qaas-docs&pattern=custom+probe+503
#   → returns ranked hits with deep-links into stable anchors.
#   GET http://localhost:8888/viewer#qaas-docs/A/cookbooks/custom-probe-http-503/index.html
#   → renders the cookbook page including the runnable C# class.
```

## Edge cases {#edge-cases}

- **Anchor stability** — Agents bookmark anchors. If a doc PR renames `{#example-realistic}` to `{#realistic-example}`, every cached agent reference breaks. The authoring contract (`docs/_meta/authoring-contract.md`) and the `/ultrareview` rubric forbid silent anchor renames; redirects must be added in `mkdocs.yml` if a rename is unavoidable.
- **ZIM ↔ live-site drift** — The ZIM is built from the same `mkdocs build` output as the live site, so they cannot drift in content. They CAN drift in freshness — set the agent's MCP server URL to the CI artifact URL (or rebuild on every merge) so production agents follow `main`.
- **`llms.txt` location** — Inside the ZIM, `llms.txt` and `llms-full.txt` live at `/A/llms.txt` and `/A/llms-full.txt`. The Kiwix MCP server should be configured to fetch them as plain text on agent startup.
- **No JS-required content** — Kiwix renders pages without a browser JS engine for most agent flows; mermaid diagrams must be pre-rendered to SVG at `mkdocs build` time (already enforced by the `pymdownx.superfences` config).
- **Search ranking** — Kiwix uses Xapian full-text search. Boost reference and how-to pages via MkDocs Material's `search.boost` frontmatter; this carries into the ZIM index.

## See also {#see-also}

- [Authoring contract](../_meta/authoring-contract.md) — per-page frontmatter + anchor rules
- [Coverage map](../_meta/coverage.md) — what the ZIM contains
- [Cookbook: debugging a failed test](../cookbooks/debugging-failed-test.md) — example of a multi-page agent retrieval flow
- [`tools/zim/build-zim.sh`](https://github.com/TheSmokeTeam/qaas-docs/blob/main/tools/zim/build-zim.sh) — ZIM packager source
- [Kiwix project](https://kiwix.org)
- [MCP fetch server](https://github.com/modelcontextprotocol/servers/tree/main/src/fetch)
