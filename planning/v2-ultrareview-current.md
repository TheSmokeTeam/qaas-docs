# v2 Ultrareview Current-State Report

Date: 2026-05-23

Verdict: FAIL. This is a v2-compatible current-state review, not a pass report. The current local v2 gate refresh passes, but PR hygiene, remote checks, preview, merge, post-merge, and tagging requirements are not yet satisfied.

Authoritative rubric: `planning/v2-ultrareview-plan.md`.

Authoritative contract: `planning/authoring-contract-v2.md`.

## Scores

| # | Dimension | Score | Status | Evidence |
|---|---|---:|---|---|
| 1 | Source fidelity | 10/10 | Pass locally | Verification markers passed for 399 source-derived reference pages, schema-extension source markers remain recorded, and the deterministic 15-page overview source spot-check passed again. |
| 2 | Coverage | 10/10 | Pass locally | Catalog coverage passed for 72 hooks in the current local gate refresh. |
| 3 | Example density | 10/10 | Pass locally | Example density passed for 148 high-value pages in the current local gate refresh. |
| 4 | Example correctness | 10/10 | Pass locally | YAML validation passed for 277 blocks, C# syntax validation passed for 80 snippets, and standalone semantic probing passed for 80 snippets across 18 pages against current QaaS assemblies. |
| 5 | Frontmatter conformance | 10/10 | Pass locally | Frontmatter passed; `ai_summary`, `docs/_meta`, and `docs\_meta` scans returned no matches. |
| 6 | Anchor stability | 10/10 | Pass locally | Heading anchors passed for 3324 headings, htmltest passed 490 documents, and offline lychee checked 266041 links with 0 errors. |
| 7 | Structural conformance to v2 skeleton | 10/10 | Pass locally | Reference skeleton passed for 435 reference pages in the current local gate refresh. |
| 8 | Human navigability | 10/10 | Pass locally | Nav structure passed for 489 nav pages in the current local gate refresh. |
| 9 | ZIM compatibility | 10/10 | Pass locally | WSL ZIM packaging and serving plus Docker ZIM/Kiwix smoke are recorded in `planning/v2-completion-audit.md:30` and `planning/v2-completion-audit.md:31`; remote workflow proof is still explicitly separated from local ZIM success. |
| 10 | Structural fidelity | 10/10 | Pass locally | Markdownlint passed for 485 docs, yamllint and actionlint passed for workflows, strict MkDocs passed, llms validation passed for 485 pages and 5 shards, htmltest passed, and offline lychee passed with 0 errors. |
| 11 | PR hygiene | 2/10 | Fail | Atomic commits, push, current PR checks, preview, merge, post-merge, and tag are not achieved in `planning/v2-completion-audit.md:42`, `planning/v2-completion-audit.md:43`, `planning/v2-completion-audit.md:44`, `planning/v2-completion-audit.md:45`, `planning/v2-completion-audit.md:46`, `planning/v2-completion-audit.md:47`, and `planning/v2-completion-audit.md:48`. |
| 12 | Anti-patterns | 10/10 | Pass locally | Full v2 forbidden phrase scans, v1 artifact scans, and public-surface leak scans passed locally; the installed `ultrareview` skill rejects v1 metadata and uses the v2 contract. |

## Findings

### P0

- `planning/v2-completion-audit.md:42` - Atomic Conventional Commits are not achieved. Fix: after explicit authorization, stage and commit according to `planning/v2-commit-split-map.md`.
- `planning/v2-completion-audit.md:43` - Current local work is not pushed to PR #43. Fix: after explicit authorization and successful local verification, push the mapped commits to `feature/document-actions`.
- `planning/v2-completion-audit.md:44` - Current PR checks do not prove the local work. Fix: after push, wait for fresh GitHub Actions results and record the new rollup.
- `planning/v2-completion-audit.md:45` - PR preview is not verified for the current local state. Fix: after push and preview deployment, smoke the preview URL.
- `planning/v2-completion-audit.md:46` - PR #43 is not merged. Fix: merge only after fresh checks, preview smoke, and explicit merge authorization.
- `planning/v2-completion-audit.md:47` - Post-merge ultrareview against `main` is not achieved. Fix: after merge, rerun this v2 rubric against `main`.
- `planning/v2-completion-audit.md:48` - Docs are not tagged at the merge SHA. Fix: after merge and post-merge verification, create the requested deterministic docs tag.

### P1

- `planning/v2-completion-audit.md:37` - Nested docs-generator output is synchronized locally, but nested generator changes are not committed. Fix: after authorization, create the branch recorded in `planning/v2-authorization-runbook.md`, commit the generator chunks, then stage the parent gitlink update.
- `planning/v2-completion-audit.md:38` - PackageMirror's v2 guard is locally verified, but PackageMirror-state regeneration is not byte-identical yet and the changes are not committed, pushed, PR'd, or workflow-dispatch tested. Fix: after authorization and docs/source-ref finalization, move the dirty `master` work to the feature branch recorded in `planning/v2-authorization-runbook.md`, rerun the bytecheck from `planning/v2-packagemirror-bytecheck.md`, and handle it as a separate PackageMirror PR.
- `planning/v2-completion-audit.md:41` - Weekly sweep direct run passed, but the scheduled task has not naturally run. Fix: inspect the Monday 2026-05-25 scheduled run; broad npm/winget drift is separate machine maintenance unless explicitly authorized.
- `planning/v2-completion-audit.md:61` - `QaaS.Common.Probes` is dirty only because local graph output is untracked and its configured upstream branch is gone. Fix: keep graph output out of source PRs unless graph artifacts are explicitly requested.
- `planning/v2-completion-audit.md:65` - `QaaS.Framework` has dirty source-doc files and its configured upstream branch is gone. Fix: after authorization, use the fresh source-doc branch strategy in `planning/v2-authorization-runbook.md`.
- `planning/v2-completion-audit.md:67` - `QaaS.Mocker` has dirty source-doc files plus untracked graph output. Fix: after authorization, use the source-doc branch strategy in `planning/v2-authorization-runbook.md`.
- `planning/v2-completion-audit.md:70` - `QaaS.Runner` has dirty source-doc files plus an untracked `AGENTS.md`, and its configured upstream branch is gone. Fix: after authorization, use the fresh source-doc branch strategy in `planning/v2-authorization-runbook.md` and explicitly decide whether `AGENTS.md` belongs in the repo.

### P2

- None after the Graphify skill update. Remaining non-P0/P1 freshness drift is tracked in the weekly sweep report.

## Next Dispatch

- area=git-pr: execute the staged branch/commit/push/check/preview/merge/tag flow from `planning/v2-authorization-runbook.md` after explicit authorization.
- area=packagemirror: execute the separate PackageMirror branch/PR path after docs PR state is current, unless the user authorizes parallelization.
- area=tooling: inspect the natural 2026-05-25 weekly scheduled run and handle broad machine-maintenance drift only with explicit authorization.
