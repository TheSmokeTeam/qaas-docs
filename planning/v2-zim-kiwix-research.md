# v2 ZIM + Kiwix MCP Pipeline — Research

**Status:** research (no code changes). **Date:** 2026-05-22.
**Goal:** define the exact ZIM packaging + Kiwix MCP serving pipeline for qaas-docs so an automation client can search the offline docs at high QPS.

---

## 1. ZIM packager — `zimwriterfs`

- Canonical tool. Ships as part of `openzim/zim-tools`.
- **Latest stable: `zim-tools 3.7.0`** (openzim/zim-tools/releases/tag/3.7.0). Requires `libzim ≥ 9.4`. PR #494 improved file-extension handling in `zimwriterfs` itself.
- Distribution:
  - **Native** (Debian/Ubuntu): `apt-get install zim-tools` (often lags). Prefer the openzim release tarballs (`zim-tools_linux-x86_64-3.7.0.tar.gz`) or build via the openzim Docker base.
  - **Docker**: official `ghcr.io/openzim/zim-tools:3.7.0` (same provenance as `ghcr.io/kiwix/kiwix-tools`). Mount the MkDocs `site/` and stream the resulting `.zim` to a host volume. Pin by tag; do **not** use `:latest`.
- **CLI for our case** — MkDocs static site → `qaas-docs.zim`:

  ```bash
  zimwriterfs \
    --welcome=index.html \
    --favicon=site/assets/favicon.png \
    --language=eng \
    --name="qaas-docs" \
    --title="QaaS Documentation" \
    --description="Offline QaaS docs (runner, framework, mocker, common-*)" \
    --longDescription="Self-contained offline build of qaas-docs (MkDocs Material)." \
    --creator="QaaS" \
    --publisher="QaaS" \
    --tag="qaas;docs;offline" \
    --scraper="zimwriterfs/3.7.0" \
    --withFullTextIndex \
    site/ \
    qaas-docs-${VERSION}.zim
  ```

  Mandatory since 3.4.2: `--name`, `--title`, `--longDescription`. `--withFullTextIndex` is what creates the **Xapian** index (`X/fulltext/xapian`) used by `/search`.

---

## 2. Kiwix MCP server

Candidates surfaced via `gh search repos kiwix mcp` / `zim mcp`:

| Repo | Stack | Notable | Verdict |
|---|---|---|---|
| `mtgibbs/kiwix-mcp` (updated 2026-05-22) | TypeScript | Wraps a Kiwix library (catalog + per-book search). Active. | **Best fit — fork & specialise.** |
| `sparkymat/kiwix-mcp` | Go | Single-ZIM, basic. | Lean alternative. |
| `OscillateLabsLLC/kiwix-mcp` | TS | Hackathon-grade. | Skip. |
| `ThinkInAI-Hackathon/zim-mcp-server` | Python | ZIM file direct (no kiwix-serve). | Reference only. |
| `zicojiao/zim-mcp-server` | — | No releases, no contributors page. | Skip. |

No package in `mcp.so`/`glama.ai`/`smithery.ai` is materially better; `awesome-mcp-servers` lists none in this niche. **Recommendation:** thin-wrap `kiwix-serve` (don't reinvent libzim bindings). Either vendor `mtgibbs/kiwix-mcp` (License permitting) or write a 200-line wrapper.

**Endpoints to expose as MCP tools:**

| Tool | Backed by | Notes |
|---|---|---|
| `docs.search(q, limit, book?)` | `GET /search?books.name=qaas-docs&pattern=<q>&pageLength=<limit>` | Returns title + snippet + path. |
| `docs.get(path)` | `GET /content/qaas-docs/<path>` | Returns raw HTML; client extracts. |
| `docs.suggest(q)` | `GET /suggest?content=qaas-docs&term=<q>` | Title-only autocomplete. |
| `docs.list_books()` | `GET /catalog/v2/entries` | OPDS catalog (multiple ZIMs). |
| `docs.metadata(book)` | `GET /catalog/v2/entry/<uuid>` | Version, date, item count. |

Run `kiwix-serve --port 8888 --threads 16 --nodatealiases qaas-docs.zim`; the MCP process is stateless and front-ends it. Co-locate (unix socket or `127.0.0.1`) for high QPS.

---

## 3. Search ranking (Xapian)

- `kiwix-serve` builds its query as `Xapian::Query` over the full-text index that `zimwriterfs --withFullTextIndex` produced. Ranking is **BM25** with default `k1=1, b=0.5` (libzim defaults).
- Tuning levers we control:
  1. **MkDocs Material `search.boost`** frontmatter (`8.3.0+`) is honoured by the lunr.js client search, **not** by Xapian. For ZIM, boosts must be applied at index time → use `M/X-Boost`-style metadata is **not** supported; instead, **duplicate critical terms in `<title>` + `<h1>`** (Xapian's prefix `S` / `T` weight is higher than body `P`).
  2. **Anchor-aware ranking** — Kiwix indexes per-page, not per-anchor. To make `framework/attributes/repeat#example-realistic` rank, embed the anchor slug in the heading text (`### Realistic example {#example-realistic}`) so the slug enters the indexed term stream.
  3. **Exact-match prefer** — wrap identifiers in `<code>`; Kiwix tokenises code identifiers and they weight via the `T` field. For API names (`IProbe`, `QaaS.Runner`), also surface them in `<title>` of the reference page.
  4. **Code-block boosting** — no native knob. Workaround: index a synthetic `keywords:` line in body (MkDocs Material already emits a `<meta>` keywords tag from frontmatter `keywords:`). Confirm the meta is rendered into the HTML head (it is, by default).
  5. **Suggestions vs full search** — `/suggest` only indexes titles; ensure page titles contain the canonical noun (don't title pages "Overview" when "Probes overview" is searchable).

---

## 4. CI integration — `.github/workflows/docs.yml`

```yaml
  zim:
    needs: build
    runs-on: ubuntu-24.04
    permissions: { contents: read }
    steps:
      - uses: actions/checkout@v4
      - uses: actions/download-artifact@v4
        with: { name: mkdocs-site, path: site }
      - name: Build ZIM
        run: |
          docker run --rm -v "$PWD:/data" -w /data \
            ghcr.io/openzim/zim-tools:3.7.0 \
            zimwriterfs \
              --welcome=index.html \
              --favicon=site/assets/favicon.png \
              --language=eng --name=qaas-docs \
              --title="QaaS Documentation" \
              --description="Offline QaaS docs" \
              --longDescription="Self-contained MkDocs build of qaas-docs." \
              --creator=QaaS --publisher=QaaS \
              --tag="qaas;docs;offline" \
              --withFullTextIndex \
              site/ "qaas-docs-${GITHUB_SHA::8}.zim"
      - name: Smoke-test
        run: |
          docker run --rm -d --entrypoint /usr/local/bin/kiwix-serve \
            -v "$PWD:/data" -p 8888:8888 \
            ghcr.io/kiwix/kiwix-serve:3.8.2 \
            --port 8888 --threads 4 --nodatealiases "/data/qaas-docs-${GITHUB_SHA::8}.zim"
          sleep 2
          curl -fsS 'http://localhost:8888/search?books.name=qaas-docs&pattern=IProbe' >/dev/null
      - uses: actions/upload-artifact@v4
        with:
          name: qaas-docs-zim
          path: qaas-docs-*.zim
          retention-days: 14
```

Pin `zim-tools:3.7.0` and `kiwix-serve:3.8.2` explicitly. For `ghcr.io/kiwix/kiwix-serve:3.8.2`, call `/usr/local/bin/kiwix-serve` as the entrypoint; the image wrapper prepends an invalid `--port=8080` argument when additional CLI flags are supplied. On tag push, additionally `gh release upload` (see §5).

---

## 5. Versioning & release

- Filename: **`qaas-docs-<semver>.zim`** matching the docs site tag (e.g. `qaas-docs-2.1.0.zim`). For PR artifacts, append `+<sha8>`. The ZIM's internal `M/Name=qaas-docs` is stable; only the file *path* carries the version.
- **Publish location:** attach as a release asset on the **qaas-docs repo's own tag** (no separate `qaas-docs-zim` repo). Rationale: single source of truth, release notes co-located, `gh release download v2.1.0 -p '*.zim'` works for consumers.
- Add a `latest.zim` redirect via a GitHub Release tagged `zim-latest` updated on each main merge (or use `kiwix-serve --library` with a small `library.xml` that resolves the alias).
- For nightly builds, push to `ghcr.io/<org>/qaas-docs-zim:<sha>` as an OCI artifact (oras) — optional v2.2 follow-up.

---

## 6. Size estimate

- `find docs -name '*.md' | wc -l` = **492** Markdown sources → ~492 HTML pages after MkDocs build.
- Source corpus: **4.9 MB** Markdown. After Material rendering (≈3–4× expansion incl. nav, anchors, JSON-LD) → ~18 MB raw HTML.
- ZIM is ZSTD-compressed and de-dups assets; observed compression on Material sites ≈ **0.45×** of HTML size.
- **Projected `qaas-docs.zim` ≈ 12–18 MB** including Xapian index. Index alone ≈ 2–3 MB. Easily fits in a release asset; negligible to host. Even a 10× docs growth stays under 200 MB.

---

## 7. Existing `docs/integrations/kiwix-mcp.md` — discrepancies & recommended edits

Current page is correct in spirit but understates / overstates several specifics. Do **not** edit yet (per instructions); deltas to apply next pass:

1. **L31 / L47 — `--port 8888 file.zim`** is fine, but add `--threads 16` for the high-QPS use case the new MCP brings.
2. **L50 — search URL** uses `books.name=qaas-docs&pattern=` — correct for kiwix-serve ≥ 3.x; pin the version (`kiwix-tools 3.8.2`) so the URL contract is documented.
3. **L56 — `apt-get install kiwix-tools`** lags upstream (Ubuntu 24.04 ships 3.5.x). Recommend `ghcr.io/kiwix/kiwix-serve:3.8.2` with the direct `/usr/local/bin/kiwix-serve` entrypoint as the *first* example, apt as fallback.
4. **L67 — `/viewer#qaas-docs/A/index.html`** uses the legacy `A/` namespace. Modern ZIMs (libzim ≥ 9) flatten namespaces; correct URL is `/viewer#qaas-docs/index.html`. Verify against produced ZIM and update.
5. **L75 — "kiwix-serve renders pages without a browser JS engine"** is imprecise. kiwix-serve serves bytes; the *client* renders. Reword to "ZIM stores pre-rendered HTML; no client-side JS is required for navigation or search".
6. **L76 — `search.boost` "carries into the ZIM index"** is **wrong**. MkDocs Material's `search.boost` only affects the lunr.js *client* search bundle; it has no effect on the Xapian index inside the ZIM. Replace with the heading/anchor/`<code>` tactics in §3 above.
7. **Missing sections to add:**
   - Build provenance (which CI job, which `zim-tools` version).
   - MCP integration (`docs.search` / `docs.get` tool surface, the new bullet).
   - Performance: thread tuning, `/search` QPS budget.
8. **Anchor stability claim (L73)** is reinforced by §3.2 — keep, but cross-link to the new authoring contract.

---

## Sources

- `openzim/zim-tools` 3.7.0 — github.com/openzim/zim-tools/releases/tag/3.7.0
- `kiwix/kiwix-tools` 3.8.2 — github.com/kiwix/kiwix-tools/releases/tag/3.8.2
- `kiwix/kiwix-tools` Docker — ghcr.io/kiwix/kiwix-serve, ghcr.io/kiwix/kiwix-tools
- `mtgibbs/kiwix-mcp` — github.com/mtgibbs/kiwix-mcp (TS, updated 2026-05-22)
- `sparkymat/kiwix-mcp`, `ThinkInAI-Hackathon/zim-mcp-server`, `zicojiao/zim-mcp-server`
- MkDocs Material search boost — squidfunk.github.io/mkdocs-material/setup/setting-up-site-search/#search-boosting
- Existing page — `docs/integrations/kiwix-mcp.md` (this repo)
