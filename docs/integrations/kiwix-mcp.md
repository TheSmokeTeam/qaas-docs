---
id: integrations.kiwix-mcp
type: how-to
status: stable
since: 2026-05-22
last_verified: 2026-05-22
applies_to: [runner, framework, mocker, assertions, generators, probes, processors, jsonschema]
keywords: [kiwix, zim, offline, search, docs]
summary: "Serve the QaaS docs ZIM with kiwix-serve for offline lookup, with stable anchors and per-page metadata intact."
---

> TL;DR — Build the `qaas-docs.zim` artifact in CI (or locally via `tools/zim/build-zim.sh`), serve it with `kiwix-serve`, and reach pages over plain HTTP at `http://localhost:8888/`.

## When to use {#when-to-use}

- You need to look up QaaS APIs without network access (air-gapped CI runners, restricted enterprise networks).
- You want **stable-anchor** deep-links into the docs (e.g. `framework/attributes/repeat#example-realistic`) for bookmarks and tooling.
- You want one self-contained `.zim` file that ships every page, every code example, and every YAML schema with no JS or external CDN dependencies.

## YAML configuration {#yaml}

No QaaS YAML is required to consume the ZIM — `kiwix-serve` is invoked directly. A systemd unit is the typical wiring:

```ini
# /etc/systemd/system/kiwix-qaas-docs.service
[Unit]
Description=Kiwix server for QaaS docs ZIM
After=network.target

[Service]
ExecStart=/usr/bin/kiwix-serve --port 8888 /var/lib/kiwix/qaas-docs.zim
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Enable with `systemctl enable --now kiwix-qaas-docs`.

## Minimal example {#example-minimal}

```bash
# 1. Build (or download) the ZIM
tools/zim/build-zim.sh qaas-docs.zim

# 2. Serve it
kiwix-serve --port 8888 qaas-docs.zim &

# 3. Smoke-test via curl
curl -s 'http://localhost:8888/search?books.name=qaas-docs&pattern=IProbe' | head -20
```

## Realistic example {#example-realistic}

```bash
# Install kiwix-tools (Debian/Ubuntu)
apt-get install -y kiwix-tools

# Stage the ZIM
mkdir -p /var/lib/kiwix
cp qaas-docs.zim /var/lib/kiwix/

# Start service
systemctl enable --now kiwix-qaas-docs

# Verify
curl -sf 'http://localhost:8888/viewer#qaas-docs/A/index.html' >/dev/null \
  && echo "QaaS docs ZIM is being served"
```

## Edge cases {#edge-cases}

- **Anchor stability** — Downstream consumers bookmark anchors. If a doc PR renames `{#example-realistic}` to `{#realistic-example}`, every cached reference breaks. The authoring contract forbids silent anchor renames; add a redirect in `mkdocs.yml` if a rename is unavoidable.
- **ZIM vs live-site drift** — The ZIM is built from the same `mkdocs build` output as the live site, so they cannot drift in content. They CAN drift in freshness — rebuild on every merge so consumers follow `main`.
- **No JS-required content** — `kiwix-serve` renders pages without a browser JS engine in most flows. Mermaid diagrams must be pre-rendered to SVG at `mkdocs build` time (already enforced by the `pymdownx.superfences` config).
- **Search ranking** — Kiwix uses Xapian full-text search. Boost reference and how-to pages via MkDocs Material's `search.boost` frontmatter; this carries into the ZIM index.

## See also {#see-also}

- [Integrations](./index.md) — section landing
- [`tools/zim/build-zim.sh`](https://github.com/TheSmokeTeam/qaas-docs/blob/main/tools/zim/build-zim.sh) — ZIM packager source
- [Kiwix project](https://kiwix.org)
