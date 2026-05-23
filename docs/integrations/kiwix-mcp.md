---
id: integrations.kiwix-mcp
type: how-to
status: stable
since: 2026-05-22
last_verified: 2026-05-22
applies_to: [runner, framework, mocker, assertions, generators, probes, processors, jsonschema]
keywords: [kiwix, zim, offline, search, docs, mcp]
summary: "Serve the QaaS docs ZIM with kiwix-serve for offline lookup, with stable anchors and per-page metadata intact."
---

# Kiwix MCP

> TL;DR — Build the `qaas-docs.zim` artifact in CI (or locally via `tools/zim/build-zim.sh`), serve it with `kiwix-serve` (pin `kiwix-tools 3.8.2`), and reach pages over plain HTTP at `http://localhost:8888/`. The same ZIM backs an optional MCP server for tool-driven lookup.

## When to use {: #when-to-use}

- You need to look up QaaS APIs without network access (air-gapped CI runners, restricted enterprise networks).
- You want **stable-anchor** deep-links into the docs (e.g. `framework/attributes/repeat#example-realistic`) for bookmarks and tooling.
- You want one self-contained `.zim` file that ships every page, every code example, and every YAML schema with no external CDN dependencies.

## YAML configuration {: #yaml}

No QaaS YAML is required to consume the ZIM — `kiwix-serve` is invoked directly. A systemd unit is the typical wiring:

```ini
# /etc/systemd/system/kiwix-qaas-docs.service
[Unit]
Description=Kiwix server for QaaS docs ZIM
After=network.target

[Service]
ExecStart=/usr/bin/kiwix-serve --port 8888 --threads 16 --nodatealiases /var/lib/kiwix/qaas-docs.zim
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Enable with `systemctl enable --now kiwix-qaas-docs`. `--threads 16` matches the high-QPS lookup pattern; tune down on small hosts.

## Minimal example {: #example-minimal}

Docker-first (recommended — pinned, reproducible):

```bash
# 1. Build (or download) the ZIM
tools/zim/build-zim.sh qaas-docs.zim

# 2. Serve it (pinned image, explicit binary entrypoint)
docker run --rm -d --name kiwix --entrypoint /usr/local/bin/kiwix-serve \
  -p 8888:8888 -v "$PWD:/data" \
  ghcr.io/kiwix/kiwix-serve:3.8.2 \
  --port 8888 --threads 16 --nodatealiases /data/qaas-docs.zim

# 3. Smoke-test via curl
curl -s 'http://localhost:8888/search?pattern=IProbe' | head -20
curl -fsS 'http://localhost:8888/content/qaas-docs/qaas-docs/qaas/index.html' >/dev/null
```

## Realistic example {: #example-realistic}

Native install fallback (Debian/Ubuntu apt lags upstream — Ubuntu 24.04 ships 3.5.x; prefer the Docker image above when version-sensitive):

```bash
apt-get install -y kiwix-tools

# Stage the ZIM
mkdir -p /var/lib/kiwix
cp qaas-docs.zim /var/lib/kiwix/

# Start service
systemctl enable --now kiwix-qaas-docs

# Verify (libzim ≥ 9 flattens namespaces — no legacy /A/ prefix)
curl -sf 'http://localhost:8888/viewer#qaas-docs/index.html' >/dev/null \
  && echo "QaaS docs ZIM is being served"
```

## MCP integration {: #mcp}

The selected integration contract is `kiwix-serve` plus a thin MCP wrapper over its HTTP endpoints. No canonical Kiwix MCP package is required for the docs artifact; compatible wrappers only need to implement this tool surface:

| Tool | HTTP endpoint | Notes |
|---|---|---|
| `docs.search(q, limit?)` | `GET /search?pattern=<q>&pageLength=<limit>` | Returns title + snippet + path. |
| `docs.suggest(q)` | `GET /suggest?content=qaas-docs&term=<q>` | Title-only autocomplete. |
| `docs.get(path)` | `GET /content/qaas-docs/qaas-docs/<path>` | Returns raw HTML; client extracts. |
| `docs.list_books()` | `GET /catalog/v2/entries` | OPDS catalog when multiple ZIMs are mounted. |
| `docs.metadata(book)` | `GET /catalog/v2/entry/<uuid>` | Version, date, item count. |

The MCP process is stateless — co-locate it with `kiwix-serve` over `127.0.0.1` (or a unix socket) to keep per-call latency under a millisecond. Surveyed implementations (`mtgibbs/kiwix-mcp`, `sparkymat/kiwix-mcp`) wrap the same endpoint set; use one only when it keeps this stable `kiwix-serve` contract.

For MCP clients that only need read access, use the reference fetch server and point requests at the local `kiwix-serve` URLs:

```json
{
  "mcpServers": {
    "qaas-docs-fetch": {
      "command": "uvx",
      "args": ["mcp-server-fetch"]
    }
  }
}
```

After the ZIM is served, use the fetch tool with one of these URLs:

```json
{
  "url": "http://localhost:8888/search?pattern=custom%20probe%20503",
  "max_length": 8000
}
```

```json
{
  "url": "http://localhost:8888/content/qaas-docs/qaas-docs/probes/custom-authoring-guide/index.html",
  "max_length": 12000
}
```

## Performance {: #performance}

- Tune `--threads` to roughly match the MCP server's concurrent request budget. 16 is a sensible default; raise for fan-out lookup workloads.
- `kiwix-serve` keeps the Xapian index memory-mapped, so steady-state RSS is dominated by the index (~2–3 MB for the QaaS corpus). Latency is index-bound, not disk-bound after warm-up.
- The `/search` query path is BM25 over Xapian (libzim defaults `k1=1, b=0.5`). The Material-theme `search.boost` frontmatter only affects the **client-side lunr.js** bundle and does **not** transfer into the Xapian index. To influence ZIM ranking, surface critical identifiers in `<title>` / `<h1>` / `<code>` — Xapian weights title and term-prefix fields higher than body text.

## Edge cases {: #edge-cases}

- **Anchor stability** — Downstream consumers bookmark anchors. If a doc PR renames `{: #example-realistic}` to `{: #realistic-example}`, every cached reference breaks. The v2 authoring contract forbids silent anchor renames; add a redirect in `mkdocs.yml` if a rename is unavoidable.
- **ZIM vs live-site drift** — The ZIM is built from the same `mkdocs build` output as the live site, so they cannot drift in content. They CAN drift in freshness — rebuild on every merge so consumers follow `main`.
- **No client-side JS required** — The ZIM stores pre-rendered HTML; navigation and search work without a browser JS engine. Mermaid diagrams must be pre-rendered to SVG at `mkdocs build` time (already enforced by the `pymdownx.superfences` config).
- **Ranking knobs** — As noted in *Performance*, Material's `search.boost` does not reach Xapian. Boost reference and how-to pages by reinforcing identifiers in headings and titles; that text reaches Xapian's high-weight prefixes.
- **Build provenance** — Always pin `zim-tools` and `kiwix-serve` image tags (3.7.0 / 3.8.2 at the time of writing). The `.github/workflows/docs.yml` ZIM job records the producing CI run as the source of truth.

## See also {: #see-also}

- [CI pipeline](./ci-pipeline.md) — GitHub Actions integration recipe
- `tools/zim/build-zim.sh` — ZIM packager source
- [Kiwix project](https://kiwix.org)
- [openzim/zim-tools 3.7.0](https://github.com/openzim/zim-tools/releases/tag/3.7.0)
- [kiwix/kiwix-tools 3.8.2](https://github.com/kiwix/kiwix-tools/releases/tag/3.8.2)
- [mcp-server-fetch](https://pypi.org/project/mcp-server-fetch/)
