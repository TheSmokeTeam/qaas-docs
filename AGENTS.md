# AGENTS.md — qaas-docs

Guidance for AI agents working in this repository.

## What this repo is

The **unified documentation site** for the QaaS platform (Runner, Mocker, hooks, Framework), built with MkDocs Material and deployed to GitHub Pages from `master`. Reference docs are generated — not hand-written — by the `tools/QaaS.Docs.Generator` git submodule from mirrored packages and XML doc comments in source repos.

## Layout

| Path | Purpose |
|---|---|
| `docs/` | source markdown by section: mocker/, assertions/, generators/, probes/, processors/, framework/, qaas/ |
| `docs/_generated/` | **generated** reference docs — never hand-edit |
| `docs/assets/` | bundled schema downloads (runner/mocker family schemas from QaaS.PackageMirror) |
| `mkdocs.yml` | MkDocs config; env-var overrides for site_name/site_url/repo_url |
| `tools/QaaS.Docs.Generator/` | git submodule: deterministic reference-doc generator (C#) |
| `tools/write_runtime_link_defaults.py` | snapshots `QAAS_DOCS_*` env vars into build-defaults JS |
| `tools/nginx.conf`, `tools/docker-entrypoint.d/` | runtime image (Nginx, port 8000) + startup overrides |
| `.githooks/` | pre-commit: markdownlint-cli2, strict MkDocs build, llms.txt validation, lychee link checks |

## Build & preview

```bash
pip install -r requirements.txt
python tools/write_runtime_link_defaults.py docs/assets/javascripts/qaas-docs-build-defaults.js
mkdocs build --strict
mkdocs serve
git config core.hooksPath .githooks   # one-time hook setup
```

## Critical gotchas

- **`docs/_generated/` is overwritten** by QaaS.Docs.Generator runs (CRLF-canonical output; placement tags in source repos gate function docs; `--check` mode exits 2 on drift). Edit generated content at its source (XML doc comments in product repos), not here.
- CI builds with `mkdocs build --strict` — any broken nav/link fails the build. Run it locally before pushing.
- Line endings: `.gitattributes` enforces LF for `*.sh`; the generator emits CRLF-canonical content in its domain — don't "fix" endings in bulk.
- 50+ `QAAS_DOCS_*` env vars control links/URLs at build AND container runtime (entrypoint materializes them without rebuilding) — prefer adding a variable over hardcoding a URL.
- Deploys to Pages happen on pushes to `master`, `fix/improve_docs`, and `fix/docs_errors` — treat all three as production branches.

## Process

Docs changes: run markdownlint + `mkdocs build --strict` + lychee link check (pre-commit hooks do this). Conventional commits. Generated-content drift belongs in QaaS.Docs.Generator or the source repos, not here.
