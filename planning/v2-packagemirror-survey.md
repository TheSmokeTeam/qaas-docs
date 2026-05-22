# QaaS.PackageMirror — v2 Docs Pipeline Survey

## Overview

QaaS.PackageMirror does **not** publish a docs site, ZIM, nginx, or S3 artifact itself. Its docs role is upstream: a single GitHub Actions workflow (`.github/workflows/sync-packages.yml`) periodically rebuilds the NuGet package mirror + family JSON schemas, then — when `create_docs_pr` is enabled — checks out `TheSmokeTeam/qaas-docs@master` plus the source repos at the tags recorded in `state/*.json`, runs `pip install -r qaas-docs/requirements.txt`, invokes the **docs-side** generator `qaas-docs/tools/QaaS.Docs.Generator/QaaS.Docs.Tools` with `generate-reference-docs --docs-root … --mirror-root … --runner-root … --mocker-root … --framework-root …`, commits the regenerated reference pages onto a `feature/package-mirror-docs-<run-id>` branch in qaas-docs, pushes, and opens a PR with `gh pr create`. The mirror itself only produces `schemas/<family>/latest/{schema.json, docs-manifest.json, hook-catalog.json}` — these stable contracts are consumed by the qaas-docs generator. PackageMirror never reads or writes markdown frontmatter, never references `docs/_meta/`, never builds MkDocs, never publishes a site or ZIM. All v2 docs-content concerns live in the docs-side generator; PackageMirror's only contract is which paths/refs/files it hands to that generator.

## File inventory

| File | Purpose |
|---|---|
| `.github/workflows/sync-packages.yml` | Sole workflow. Builds mirror, validates outputs, opens qaas-docs PR by invoking docs-side generator. |
| `QaaS.PackageMirror.Tools/QaaS.PackageMirror.Tools.csproj` | CLI that runs `sync-restored-packages` and `publish-mirror-release` (no docs commands). |
| `QaaS.PackageMirror.Tools/Program.cs` | Tools CLI entrypoint. |
| `QaaS.PackageMirror.Tools/Commands/*.cs` | Mirror commands; `GenerateFamilySchemasCommand.cs` writes/cleans `schemas/<family>/latest/` (incl. deletes stale `docs-diff.json`). |
| `QaaS.PackageMirror.FamilySchemas/` | Generator for `schema.json` / `docs-manifest.json` / `hook-catalog.json` consumed by the docs-side generator. |
| `QaaS.PackageMirror.FamilySchemas/README.md` | References `qaas-docs/tools/QaaS.Docs.Generator` as consumer of manifests. |
| `schemas/runner-family/latest/{schema,docs-manifest,hook-catalog}.json` | Stable contracts published to qaas-docs reference pages. |
| `schemas/mocker-family/latest/{schema,docs-manifest,hook-catalog}.json` | Same for the Mocker family. |
| `state/TheSmokeTeam_QaaS.*.json` | Records last successful source tag per repo; workflow reads `.tag` to resolve docs source refs. |
| `README.md` | Documents mirror behaviour incl. docs PR step. |

No Dockerfile, no nginx config, no MkDocs config, no ZIM tooling, no S3 upload, no `scripts/` content (empty).

## v2 breakage analysis

- **`docs/_meta/` deletion** — no references in PackageMirror. Workflow does `git -C qaas-docs add .` after the generator runs, so anything the generator deletes (including a removed `docs/_meta/` tree) is committed transparently. No update needed here.
- **`ai_summary` → `summary` frontmatter rename** — no references in PackageMirror. Frontmatter is owned by the docs-side generator (`qaas-docs/tools/QaaS.Docs.Generator`), not this repo. No update needed here.
- **YAML-first body skeleton / no AI-agent wording** — no markdown templates, prose, or frontmatter literals exist in PackageMirror. Out of scope.
- **Section-level nav unchanged** — confirmed safe; PackageMirror never asserts on qaas-docs nav, MkDocs structure, or section ordering.
- **`docs-manifest.json` schema** — this *is* a structural contract PackageMirror owns. If v2 reshapes how the docs-side generator interprets sections/fields in `docs-manifest.json` or `hook-catalog.json`, the producer in `QaaS.PackageMirror.FamilySchemas/` may need to follow. **Currently no evidence v2 changes the manifest schema** — v2 changes are markdown-frontmatter / publish-tree only — but flag for confirmation.
- **`docs-diff.json` cleanup** — `GenerateFamilySchemasCommand.cs:55` defensively deletes any legacy `docs-diff.json` under `schemas/<family>/latest/`. Harmless; no v2 action.
- **Docs PR body** — workflow's `gh pr create --body` string is human-prose only ("sync generated docs from the latest mirrored package state…"); no forbidden v1 wording flagged, but a scrub pass should confirm it doesn't say "AI", "agent", "ai_summary", or reference `_meta/`.
- **Workflow assumes `qaas-docs/requirements.txt` exists** — fine, v2 keeps it.
- **Workflow assumes `qaas-docs/tools/QaaS.Docs.Generator/QaaS.Docs.Tools/QaaS.Docs.Tools.csproj` path** — fine if v2 keeps that project path. Confirm PR #43 does not relocate the generator.

## Recommended changes

Minimal — almost all v2 work lives in qaas-docs, not here.

| File | Change |
|---|---|
| `.github/workflows/sync-packages.yml` (PR body block) | Scrub the `gh pr create --body` string for any AI/agent wording or references to `_meta/`/`ai_summary`. Current copy is clean but re-verify post-merge of v2 docs PR. |
| `.github/workflows/sync-packages.yml` (post-generate step) | (Optional defense-in-depth) After `generate-reference-docs`, add a guard step that fails the run if `qaas-docs/docs/_meta/` exists OR if any generated `*.md` under `qaas-docs/docs/` contains an `ai_summary:` frontmatter key. Prevents regression from a stale generator. |
| `QaaS.PackageMirror.FamilySchemas/` (no change expected) | Hold unless PR #43 redefines `docs-manifest.json` / `hook-catalog.json` consumer contract. If it does, mirror the schema shape here. |
| `README.md` | Optional: drop the "AI"-flavoured language if any appears post-scrub (none found at survey time). |
| `QaaS.PackageMirror.Tools/Commands/GenerateFamilySchemasCommand.cs:55` | No change. Legacy `docs-diff.json` cleanup is still appropriate. |

No work required on: Dockerfiles (none), nginx (none), ZIM (not here), MkDocs config (not here), S3 (not here), `scripts/` (empty).

## Open questions

1. Does PR #43 change the shape/fields of `docs-manifest.json` or `hook-catalog.json` (the contracts PackageMirror produces under `schemas/<family>/latest/`)? If yes, `QaaS.PackageMirror.FamilySchemas/` must follow. If no (frontmatter-only change), zero code work here.
2. Does PR #43 relocate `qaas-docs/tools/QaaS.Docs.Generator/QaaS.Docs.Tools/QaaS.Docs.Tools.csproj`? Workflow hard-codes this path.
3. Does PR #43 change `qaas-docs/requirements.txt` location or split it (e.g., separate MkDocs vs generator requirements)? Workflow installs a single `qaas-docs/requirements.txt`.
4. Should the optional `_meta`/`ai_summary` post-generate guard be added now (cheap, defensive) or skipped (trust the generator)? Recommend: add — one-shot cost, prevents silent v1 regressions.
5. Is the PR body's "sync generated reference docs" wording acceptable under v2 "no AI/agent wording" rules? It contains no AI references currently; confirm "reference docs" / "generated" stay allowed.
