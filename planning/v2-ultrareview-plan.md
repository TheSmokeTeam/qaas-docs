# v2 Ultrareview Plan — PR #43 Merge Gate

Goal: PR #43 passes `/ultrareview` at 10/10 across all 12 v2 rubric dimensions before merge.

## 1. Revised 12-Dim Rubric (v2)

v1 dim 7 "agent ingestibility" is OBSOLETE — v2 bans AI/agent/LLM wording and drops `ai_summary`. Replaced with **"structural conformance to §7 body skeleton"**.

| # | Dimension                              | Intent                                                                 |
|---|----------------------------------------|------------------------------------------------------------------------|
| 1 | Source fidelity                        | Every claim traces to a verified source file/line in qaas-core/-runner |
| 2 | Coverage                               | All public surface of milestone scope documented                       |
| 3 | Example density                        | ≥1 runnable example per public type/method/CLI verb                    |
| 4 | Example correctness                    | Examples compile/run against current source; YAML schema-valid         |
| 5 | Frontmatter conformance                | `tools/ci/check-frontmatter.sh` exits 0; required keys present         |
| 6 | Anchor stability                       | All intra-doc links resolve; no orphan/dangling anchors                |
| 7 | **Structural conformance to §7 skeleton** (NEW) | Body sections follow contract-v2 §7 order/headings              |
| 8 | Human navigability                     | mkdocs nav coherent; breadcrumbs; index pages per section              |
| 9 | ZIM compatibility                      | Offline build clean; no external runtime deps; relative links only     |
| 10| Structural fidelity                    | Tables/lists/code-fences well-formed; markdownlint clean               |
| 11| PR hygiene                             | Commits scoped; diff matches stated intent; no stray files             |
| 12| Anti-patterns                          | Zero forbidden words (AI/agent/LLM/etc.); no `ai_summary`; no TODOs    |

## 2. Checkable Assertions Per Dimension

1. **Source fidelity** — each doc page has a `verified_against:` frontmatter pointing to verification report; grep `planning/v2-verification-*.md` for unreferenced claims.
2. **Coverage** — `tools/ci/coverage-matrix.sh` (NEW) diffs documented symbols vs. `qaas-core` public API export list; exit 0.
3. **Example density** — `tools/ci/example-density.sh` (NEW) asserts ≥1 fenced ```yaml/```csharp block per H2 under "Examples" / "Usage".
4. **Example correctness** — `mkdocs build --strict` + snippet extraction → `dotnet build` for C# samples, `qaas validate` for YAML samples; exit 0.
5. **Frontmatter** — `bash tools/ci/check-frontmatter.sh` exit 0 (already GREEN).
6. **Anchor stability** — `lychee --offline --no-progress docs/` exit 0.
7. **§7 skeleton** — `tools/ci/skeleton-check.sh` (NEW) regex-asserts H2 order: Overview → Surface → Examples → Edge cases → References.
8. **Human navigability** — `mkdocs build --strict` (warnings = errors); manual nav.yml review checklist.
9. **ZIM compatibility** — `zimit` dry-run or `mkdocs build` + `htmlproofer --offline --disable-external` on `site/`.
10. **Structural fidelity** — `markdownlint-cli2 "docs/**/*.md"` exit 0.
11. **PR hygiene** — `gh pr diff 43 --name-only` review; commit message lint (`commitlint`); no `.bak`/`*.orig` files.
12. **Anti-patterns** — extend `check-frontmatter.sh` with `tools/ci/forbidden-words.sh` (NEW) scanning body prose too.

## 3. Tooling To Add

Confirmed existing: `tools/ci/check-frontmatter.sh` (forbidden words + frontmatter, GREEN).

To add (under `tools/ci/`):
- `coverage-matrix.sh` — symbol diff vs core/runner exports.
- `example-density.sh` — fenced-block-per-H2 counter.
- `skeleton-check.sh` — H2 order validator.
- `forbidden-words.sh` — body-prose scan (sister to frontmatter check).
- `snippet-extract.{sh,py}` — pulls fenced blocks into `out/snippets/` for compile/validate.
- mkdocs.yml: enable `strict: true`, `validation.links: warn → error`.
- CI workflow `qa.yml`: lychee, markdownlint-cli2, htmlproofer, mkdocs-strict, snippet-build matrix.

## 4. Iteration Protocol

Loop:
1. Run rubric tooling → collect findings as `{dim, file, line, severity, msg}` JSONL.
2. Group by dim; spawn one subagent per dim with non-empty findings (fan-out, max 6 concurrent).
3. Each subagent: fix → re-run that dim's check → report pass/fail + diff summary.
4. After fan-in: re-run FULL rubric. Record per-dim score delta.
5. "No progress" = a pass where total findings count did not decrease AND no dim moved closer to 10/10.
6. **Escalation rule**: 5 consecutive no-progress passes → halt loop, write `planning/v2-ultrareview-escalation.md`, hand back to human with top-3 blocking findings and proposed scope cut.
7. Exit condition: all 12 dims score 10/10 AND `gh pr checks 43` all green.

## 5. Pre-Loop Checklist (Known Outstanding)

From `v2-verification-framework.md`:
- [ ] Resolve `ProblemDetailsProcessor` table conflict (duplicate/inconsistent entries between framework & processors doc).

From `v2-verification-mocker-catalogs.md`:
- [ ] Address all P1 processor findings (mocker-catalogs report §P1).
- [ ] Reconcile catalog entries with `qaas-core` processor registry.

From `v2-verification-runner.md`:
- [ ] Fix P1: `Parallel` YAML key in `runner/execute.md` (key name + schema example).

Other:
- [ ] Land cookbook fold (agent `af25a566f1f3d3ec1`) before final rubric pass — affects coverage + skeleton dims.
- [ ] Confirm forbidden-words CI GREEN persists after fold.

## 6. Open Questions

1. Is `mkdocs build --strict` wired in CI today? (grep `.github/workflows/`).
2. Does `lychee` exist in repo tooling, or must we add via `lycheeverse/lychee-action`?
3. Are YAML snippet validation gates present (does `qaas validate` accept stdin / file globs)?
4. Snippet-compile harness for C# examples — exists, or must we author (csproj + `dotnet build` over extracted files)?
5. Is `markdownlint-cli2` config (`.markdownlint.yaml`) already present, or do we ship one?
6. Does `htmlproofer` run against `mkdocs` `site/` output, or need a separate post-build step?
7. Is `commitlint` configured for PR commit-message hygiene (dim 11)?
8. ZIM gate — real `zimit` job, or enforced indirectly via offline-link checks only?
9. Coverage-matrix source of truth: does qaas-core publish a machine-readable public-API manifest, or must we generate via `dotnet` reflection?
10. Does §7 skeleton apply to ALL pages or only reference pages? (Cookbook pages may legitimately diverge.)
