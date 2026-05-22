# v2 Source-Fidelity Verification — Runner (`docs/qaas/**`)

Scope: `docs/qaas/**` — 160 markdown files. The "qaas" tree IS the QaaS.Runner section: quickstart, architecture, advancedConcepts, addOns, functions (builder + command function reference), userInterfaces/{logger, runner/{commands, configurationSections, allureReport, configurationResolutionPriority}}.

Read-only audit against authoring contract v2 (`planning/authoring-contract-v2.md`).

Verifier method: spot-read the five CLI verb pages + 15 other pages; cross-grep identifiers against `D:/QaaS/QaaS.Runner/QaaS.Runner/**/*.cs` and the YAML schema set under `D:/QaaS/QaaS.JsonSchemaExtensions/generated-schemas/`.

## Summary

| Area | P0 | P1 |
|---|---|---|
| CLI verbs (5 verb pages + index) | **0 identifier mismatches** | 5× catalog-wide skeleton drift |
| `commands/execute.md` `-s` flag description | **1**: documents stale "switch flag" semantics; real flag is a `string?` folder path with `MetaValue = "folder"` | — |
| `commands/{run,assert}.md` `-s` flag description | **1**: same — flag is `string?` folder path, not bool | — |
| Configuration sections (sessions/dataSources/storages/assertions/links/metaData) | 0 sampled identifier mismatches | universal §7 body-skeleton drift |
| Functions (builders + commands function reference) | 0 sampled identifier mismatches; builder pages auto-generated from XML docs and source lines | repeated filler line "Use this method when working with the documented Runner execution builder API surface in code…" on most builder section pages |
| `quickStart/*` | 0 identifier mismatches | 1× forbidden "simply" (P2 nit) |
| `advancedConcepts/configurationAsCode.md` | 0 | 1× marketing tone hit ("not just defined, it is engineered") |
| Cross-cutting | **No `AI / LLM / Claude / ChatGPT / agent / agentic / ai_summary` occurrences.** §10 forbidden-word policy holds. | "model" string also absent in body usage. |

Net P0 count: **2** (both are the same root cause — the auto-generated CLI-flag tables encode the older bool surface of `-s`/`--serve-results`, but the source has been migrated to a `string?` folder-name surface defaulting to `"allure-results"`). Both surface in three pages: `run.md`, `assert.md`, `execute.md`.

Net P1 count: ~6 systemic items, listed below.

## Methodology

- Read all five verb pages (`commands/{run,act,assert,template,execute}.md`) end-to-end plus `commands/commands.md`.
- Read 15 other pages: `index.md`, `architecture.md`, `quickStart/{installation,runTest,makeTestMoreMaintainable}.md`, `advancedConcepts/configurationAsCode.md` (sampled), `userInterfaces/logger.md`, `userInterfaces/runner/{allureReport,configurationResolutionPriority}.md`, `configurationSections/{configurationSections,sessions/overview,sessions/types/{probes,transactions},dataSources/overview,dataSources/configurations/yamlView,storages/overview}.md`, `addOns/modules.md`, `functions/index.md`, `functions/builders/executions-sections/{general,configuration}.md`, `functions/commands/{bootstrap,runner}.md`.
- Cross-referenced verb / flag / class / method identifiers against `D:/QaaS/QaaS.Runner/QaaS.Runner/Options/{BaseOptions,AssertableOptions,RunOptions,ActOptions,AssertOptions,TemplateOptions,ExecuteOptions}.cs`, `Runner.cs`, `Bootstrap.cs`, `ExecutionBuilder.cs`.
- Grepped whole `docs/qaas/` tree for forbidden v2 words (§10) and for required §7 anchors (`> TL;DR`, `## When to use`, `## See also`).

## Catalog-wide systemic findings

### P0-1 — `commands/execute.md` documents `-s, --serve-results` as a `bool` switch (stale)

- The docs table (`execute.md:46`) lists `-s, --serve-results` as `bool` with default `False`.
- Source (`QaaS.Runner/Options/ExecuteOptions.cs:21-30`) declares it as `public string? ServeResultsFolder { get; set; }` with `MetaValue = "folder"`. The actual contract is "pass a folder name; absence of the flag means do not serve; bare `-s` defaults to `allure-results`; an explicit value (`-s allure-report`) opens a generated report directory."
- The Examples section (`execute.md:88-91`) correctly uses `-s allure-report` (string-shaped), so the body and the table contradict each other. The body example is the truthful one.
- The Raw CLI Help block (`execute.md:99-106`) also says "(Default: false)" which contradicts the source where the flag has no boolean default and is `null` when absent.
- Fix: regenerate the table from the current `[Option]` attribute and `MetaValue`; replace `bool` with `string (optional folder)`; drop the `Default: False` line.

### P0-2 — `commands/{run,assert}.md` repeat the same stale `-s` bool semantics

- `run.md:56`, `assert.md:56` list `-s, --serve-results` as `bool` default `False`.
- Source (`QaaS.Runner/Options/AssertableOptions.cs:13-19`) declares `public string? ServeResultsFolder { get; set; }` with the same `MetaValue = "folder"` shape.
- Examples in both pages correctly use the string-shaped form (`-s allure-report`, `-s allure-results`), again contradicting the in-page table.
- Same root cause as P0-1; same fix.

### P0-3 — None on verb names, option long names, or short letters

Every other flag in the verb tables resolves cleanly against `BaseOptions.cs` + `AssertableOptions.cs` + verb-specific options:

| Flag | Source location | Status |
|---|---|---|
| `-w/--with-files` | `BaseOptions.cs:22` | ok |
| `-f/--with-folders` | `BaseOptions.cs:28` | ok |
| `-r/--overwrite-arguments` | `BaseOptions.cs:33` | ok |
| `-p/--push-references` | `BaseOptions.cs:40` | ok |
| `-c/--cases` | `BaseOptions.cs:86` | ok |
| `-n/--cases-names` | `BaseOptions.cs:91` | ok |
| `--cases-names-ignore` | `BaseOptions.cs:95` | ok |
| `--cases-name-patterns-ignore` | `BaseOptions.cs:99` | ok |
| `-i/--session-names` | `BaseOptions.cs:103` | ok |
| `--session-categories` | `BaseOptions.cs:107` | ok |
| `-a/--assertion-names` | `BaseOptions.cs:111` | ok |
| `--assertion-categories` | `BaseOptions.cs:115` | ok |
| `--resolve-cases-last` | `BaseOptions.cs:120` | ok |
| `--no-env` | `BaseOptions.cs:125` | ok |
| `--no-process-exit` | `BaseOptions.cs:129` and `ExecuteOptions.cs:58` | ok |
| `-l/-g/--send-logs/--elastic-*/--disable-elastic-defaults` | `QaaS.Framework.Executions.Options.LoggerOptions` (verified base class exists at `D:/QaaS/QaaS.Framework/QaaS.Framework.Executions/Options/LoggerOptions.cs:10`) | ok |
| `-e/--empty-results-directory` (run/assert) | `AssertableOptions.cs:38` | ok |
| `-e/--empty-allure-directory` (execute) | `ExecuteOptions.cs:49` | ok |
| `-c/--command-ids-to-run` (execute) | `ExecuteOptions.cs:53` | ok |
| `[Verb("run")] RunOptions` | `RunOptions.cs:10` | ok |
| `[Verb("act")] ActOptions` | `ActOptions.cs:10` | ok |
| `[Verb("assert")] AssertOptions` | `AssertOptions.cs:10` | ok |
| `[Verb("template")] TemplateOptions` | `TemplateOptions.cs:10` | ok |
| `[Verb("execute")] ExecuteOptions` | `ExecuteOptions.cs:8` | ok |

### P0-4 — No private/internal/protected-non-override surface documented

- `functions/commands/runner.md` documents `Runner.Run()`, `Runner.RunAndGetExitCode()`, `Runner.Dispose()` — all `public` on `Runner.cs:78,91` and `virtual void Dispose()` is a documented extension point (a `Runner` subclass via `Bootstrap.New<TRunner>` is the supported override path → `Bootstrap.cs` `New<TRunner>` is the public generic factory). ok.
- `functions/commands/bootstrap.md` documents `Bootstrap.New` and `Bootstrap.New<TRunner>` — both `public static` factories. ok.
- `functions/builders/executions-sections/{general,configuration}.md` documents `ExecutionBuilder.Build()` (override at `ExecutionBuilder.cs:895`), `WithGlobalDict(...)` (`:247`), `SetCase(...)` (`:535`), `WithMetadata(...)` (`:561`). All `public`. ok.
- Hidden / internal members like `RunLoader.BuildContext(...)` are *referenced as implementation pointers* in `configurationResolutionPriority.md:15`. `RunLoader` is internal-by-default in `QaaS.Runner.Loaders`. v2 §2 says "do not document" internal — the page does not document `RunLoader` as a user surface, only mentions it as the source of behaviour. Borderline; recommend removing the implementation-pointer mention to keep §2 clean.

### P0-5 — No AI/agent/LLM/Claude/ChatGPT body usage

Grep across all of `docs/qaas/` for `\b(AI|LLM|Claude|ChatGPT|agent|agentic|ai_summary)\b` returns zero hits. `\bmodel\b` returns zero hits. §10 holds.

### P1-1 — §7 body-skeleton drift catalog-wide

Required order: `> TL;DR` blockquote → `## When to use` → `## YAML configuration` → optional `## C# (CAC) usage` → `## Minimal example` → `## Realistic example` → `## Edge cases` → `## See also`.

Actual across `docs/qaas/`:

- Grep for `> TL;DR` → **zero matches** anywhere in the 160-file tree.
- Grep for `## When to use` → **zero matches**.
- Grep for `## See also` → **zero matches**.

Verb pages have `## Use When` instead of `## When to use` (≈ same intent, wrong header). They use `## Invocation`, `## Positional Arguments`, `## Flags`, `## Flag Notes`, `## Examples`, `## Raw CLI Help` — none of which are in §7. The intent is reasonable for CLI reference pages but the contract names are not used.

Configuration-section pages use ad-hoc headings (`## Usage`, `## Available Storage Types`, `## SessionData Structure`, `## Serialized…`, `## Table View Order`, `## Http`, `## Grpc`). None of these are §7 names. None of the pages carry a `> TL;DR` blockquote.

Function pages use `??? info "Source file, signature, and docstring"` collapsible blocks with no body skeleton at all — they're a generator dump.

This is the dominant gap in the runner tree. Same shape problem as the catalog yamlView pages in the mocker+catalogs audit, but more pervasive (zero pages conform).

### P1-2 — Repeated filler line on builder function-reference pages

`functions/builders/executions-sections/configuration.md` contains the line **"Use this method when working with the documented Runner execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps."** verbatim under `WithGlobalDict` (line 36) and `WithMetadata` (line 82). Same template surfaced in the Mocker-catalogs audit (P1-3) on the Mocker builders. Generator template needs a per-method concrete sentence, not boilerplate.

Affects: most `functions/builders/*-sections/*.md` pages (auto-generated). Rewrite the doc-comment template upstream in builder XML docs in source.

### P1-3 — yamlView pages are schema dumps, not §7 reference pages

`docs/qaas/userInterfaces/runner/configurationSections/dataSources/configurations/yamlView.md` is 28 lines: a `---` frontmatter with `summary: "DataSources:"` (a YAML-key stub, not a TL;DR), an H1, and a single empty-value YAML block. No TL;DR blockquote, no `## When to use`, no minimal/realistic example split, no `## See also`. Same shape on every `configurations/yamlView.md` under `configurationSections/` (assertions, dataSources, links, metaData, sessions, storages, plus the `sessions/types/*-yamlView.md` siblings).

Identical systemic issue to the catalog yamlView problem (mocker-catalogs P1-5). Same auto-rewrite candidate.

### P1-4 — Cosmetic: `False`/`True` capitalisation in flag tables

The auto-table generator emits C#-style `False` / `True` for `bool` defaults. Cosmetic only — not a P0. Harmonise to lower-case for YAML-reader expectations.

### P1-5 — Verb pages restate the entire `--push-references` HelpText in every flag table

The whole HelpText for `-p/--push-references` is encoded in every flag table on `run.md`, `act.md`, `assert.md`, `template.md` (≈40 lines × 4 pages = 160 lines of pure duplication). Source (`BaseOptions.cs:40-82`) is the upstream cause. Recommend collapsing the per-flag long HelpText into `Flag Notes` subsections and keeping the table cell to one sentence + link.

### P1-6 — Forbidden-word P2 nits

- `quickStart/makeTestMoreMaintainable.md:174` — "by simply changing the values" → drop "simply".
- `advancedConcepts/configurationAsCode.md:582` — "configuration is not just defined, it is engineered" → marketing tone, "just" filler. Rewrite or drop.

Both were already flagged in mocker-catalogs P1-4 and remain unaddressed.

## Per-page findings (spot-checked 20 of 160)

### Commands (5 verb pages + index)

- **`commands/commands.md`** — Index page. Verb descriptions, common-flag table, raw CLI help all match `Bootstrap.cs` verb wiring. Missing §7 anchors (P1-1). Cross-links to verb pages all resolve. **P1.**
- **`commands/run.md`** — All flags resolve. `-s` table cell is **stale** (P0-2). `## Use When` ≠ `## When to use`. Examples block uses correct string-shaped `-s allure-report`. **P0.**
- **`commands/act.md`** — All flags resolve. `act` is `BaseOptions`-only (no `-s/-e`), so `act.md` correctly omits `-s`. Source: `ActOptions.cs:11 record ActOptions : BaseOptions`. Missing §7 anchors. **P1.**
- **`commands/assert.md`** — Same as `run.md`: stale `-s` bool. **P0.**
- **`commands/template.md`** — `TemplateOptions : BaseOptions`. Same flag set as `act.md`. No `-s` flag (template doesn't serve), correctly omitted. Missing §7 anchors. **P1.**
- **`commands/execute.md`** — All flags resolve. `-s` is the source-of-truth stale-bool case (P0-1). The executable YAML format block (`Commands: [- Command: …, Id: …, Parallel: …]`) needs to be checked against `ExecuteConfigurations` shape — `ExecuteLoader.cs` was found but not opened; recommend a follow-up verifier run that opens `QaaS.Runner/ConfigurationObjects/CommandConfig.cs` to confirm the `Parallel: false` example. **P0.**

### Configuration sections (sampled 6)

- **`configurationSections/configurationSections.md`** — Top-level list (`Links`, `Storages`, `DataSources`, `Sessions`, `Assertions`, `MetaData`) matches Runner top-level YAML sections. Section order in the prose differs from the YAML example below — cosmetic. Missing §7 anchors. **P1.**
- **`configurationSections/sessions/overview.md`** — `Probes / Publishers / Consumers / Collectors / Transactions / MockerCommands` all resolve as Action types in `QaaS.Runner.Sessions/Actions/**` (verified via tree listing). `SessionData` envelope shape correct. Missing §7 anchors. **P1.**
- **`configurationSections/sessions/types/probes.md`** — `IProbe` hook name correct (cross-repo: `QaaS.Framework.SDK` IProbe). Page is 17 lines, no minimal/realistic example. Skeleton-light. **P1.**
- **`configurationSections/sessions/types/transactions.md`** — Mentions `Http`, `Grpc` sub-types with `Sessions[].Transactions[].Http` / `.Grpc` property paths. Sub-types resolvable in `QaaS.Runner.Sessions/Actions/Transactions/**`. Skeleton non-conformant. **P1.**
- **`configurationSections/dataSources/overview.md`** — `IGenerator` hook name correct. **P1.**
- **`configurationSections/storages/overview.md`** — `FileSystem` and `S3` storage types match `QaaS.Runner.Storage/{FileSystem,S3}` projects. Per-case folder naming rule matches `QaaS.Runner.Storage` behaviour (case-name folder with illegal-char replacement). **P1.**
- **`configurationSections/dataSources/configurations/yamlView.md`** — `summary: "DataSources:"` stub frontmatter (same systemic shape as the mocker-catalogs P1-5). Empty-value YAML dump. **P1.**

### Functions reference (sampled 5)

- **`functions/index.md`** — Index. Lists every builder + bootstrap/runner function reference. All link targets exist. **P1.**
- **`functions/commands/bootstrap.md`** — `Bootstrap.New(IEnumerable<string>?)` matches `Bootstrap.cs` public static factory. `Bootstrap.New<TRunner>(IEnumerable<string>?) where TRunner : Runner` confirmed in source. **PASS modulo §7.**
- **`functions/commands/runner.md`** — `Runner.Run()`, `Runner.RunAndGetExitCode()`, `Runner.Dispose()` all resolve at `Runner.cs:78,91` and `Dispose()` is virtual (extension-point override path). **PASS modulo §7.**
- **`functions/builders/executions-sections/general.md`** — `ExecutionBuilder.Build()` (override) at `ExecutionBuilder.cs:895`. **PASS.**
- **`functions/builders/executions-sections/configuration.md`** — `WithGlobalDict`, `SetCase`, `WithMetadata` resolve at `ExecutionBuilder.cs:247,535,561`. Filler-line P1-2. **P1.**

### Quickstart + advanced (sampled 5)

- **`quickStart/installation.md`** — Package name `QaaS.Runner`, optional `QaaS.Common.Assertions/Generators/Probes` packages, `dotnet new qaas-runner` template all match conventions in `D:/QaaS/QaaS.Runner/README.md`. **P1** (skeleton).
- **`quickStart/runTest.md`** — `dotnet run -- run test.qaas.yaml` correct. **P1.**
- **`quickStart/makeTestMoreMaintainable.md`** — Forbidden "simply" at `:174` (P1-6). **P1+P2.**
- **`advancedConcepts/configurationAsCode.md`** — Sample code (`var runner = Bootstrap.New(args); runner.ExitProcessOnCompletion = false; runner.Run();`) resolves to `Bootstrap.cs` and `Runner.cs:33 ExitProcessOnCompletion`. Marketing tone hit at `:582` (P1-6). **P1+P2.**
- **`architecture.md`** — Storages/DataSources/Sessions/Assertions/Links component list matches runtime. **P1** (skeleton).

### Other pages (sampled 4)

- **`userInterfaces/logger.md`** — `-l/--logger-level` and `-g/--logger-configuration-file` resolve via `LoggerOptions` base class. Page is 32 lines; correct in substance. **P1** (skeleton).
- **`userInterfaces/runner/configurationResolutionPriority.md`** — References `RunLoader.BuildContext(...)` and `ContextBuilder.GetConfiguration()`. Both exist in source (`Loaders/RunLoader.cs`, `QaaS.Framework.SDK/ContextBuilder`). Behaviour description matches the resolution order encoded in `RunLoader`. Borderline: cites `RunLoader` internal type as evidence — see P0-4 note. Sub-pipeline for `execute` correctly says it uses `ExecuteLoader`, which exists. **P1.**
- **`userInterfaces/runner/allureReport.md`** — `SaveSessionData / SaveLogs / SaveTemplate / SaveAttachments / DisplayTrace / AssertionMessage / AssertionTrace / AssertionAttachments / SerializationType` are all assertion-hook configuration knobs; need a deeper cross-check against `QaaS.Framework.SDK` assertion hook surface to confirm every name. Spot-check via grep returns matches in framework. **P1** (skeleton); recommend a targeted re-verify of the field names.
- **`addOns/modules.md`** — Describes Artifactory module shape. No source identifiers cited; purely conventional. **P1** (skeleton).

## Rewrite candidates (priority order)

1. **`commands/{run,assert,execute}.md` `-s/--serve-results` row** — regenerate the flag row from current source: type `string (optional folder)`, default behaviour "absent → not served; bare `-s` → `allure-results`; `-s <folder>` → open that folder". Remove the `(Default: false)` line from the Raw CLI Help block (regenerate the block from `--help` against the current build). **P0.**
2. **All five verb pages** — re-header to §7 skeleton. Rename `## Use When` → `## When to use`. Add `> TL;DR` blockquote at top. Add `## See also` linking to `commands/commands.md` + sibling verb pages + `configurationResolutionPriority.md`. Collapse the duplicated `-p/--push-references` HelpText block into one `Flag Notes` subsection per page (P1-5).
3. **All `functions/builders/*-sections/*.md` pages** — rewrite the boilerplate "Use this method when working with the documented Runner execution builder API surface in code…" template upstream in builder XML docs (source-of-truth: `QaaS.Runner/ExecutionBuilder.cs` XML docs on `WithGlobalDict`, `WithMetadata`, and similar public methods).
4. **All `configurationSections/**/configurations/yamlView.md`** — same auto-rewrite pattern as the mocker-catalogs yamlView fix: replace the empty-value YAML dump with TL;DR + `## When to use` + `## YAML configuration` (field table) + `## Minimal example` + `## Realistic example` + `## See also`. Replace `summary: "<Key>:"` stub with a real one-line TL;DR.
5. **All `configurationSections/**/overview.md`** — re-header to §7 skeleton; add TL;DR blockquote; add `## See also`.
6. **`configurationResolutionPriority.md`** — drop the `RunLoader.BuildContext(...)` implementation-pointer mention or move it to a comment block; v2 §2 says don't document internal types.
7. **`quickStart/makeTestMoreMaintainable.md:174`** and **`advancedConcepts/configurationAsCode.md:582`** — drop "simply" / "not just defined, it is engineered" (P1-6).
8. **`commands/execute.md`** — open `QaaS.Runner/ConfigurationObjects/CommandConfig.cs` and reverify the executable-YAML example (`Command:`, `Id:`, `Parallel:` keys); skipped here due to context budget.

## Legacy tree restructure recommendation

**Keep `docs/qaas/` as the URL path. Re-label in nav to "Runner".**

Rationale:

- v2 §8 forbids new top-level sections / top-level section reshuffling. A directory rename from `docs/qaas/` → `docs/runner/` is a top-level reshuffle and would break every external link (the live site is at `https://docs.qaas.online/qaas/...`).
- Internal docs already say "**QaaS.Runner** is the execution engine of the QaaS ecosystem" (`docs/qaas/index.md:13`). The naming overlap is historical: when the repo was created the runner was the only product, so it got the bare `qaas` namespace. Now that there is also `docs/mocker/`, `docs/framework/`, `docs/{assertions,generators,probes,processors}/`, the `qaas` tree is *de facto* the runner section but not labelled as such.
- Recommendation:
  1. Keep the filesystem path `docs/qaas/`.
  2. In `mkdocs.yml`, label the top-level nav entry "QaaS Runner" (instead of "QaaS"). Site nav stays section-stable.
  3. Add a one-paragraph note on `docs/qaas/index.md` that this section IS the Runner; the URL stem is historical.
  4. The cross-section links from the catalog pages (`qaas/userInterfaces/runner/...`) stay verbatim; the existing internal links survive.
- Do **not** add a `docs/runner/` synonym tree. Two trees pointing at the same content invites drift.

Net effect: zero broken links; nav clarity gained; v2 §8 respected.

## Out of scope (flagged, not actioned)

- The `_meta/` workspace move (v2 §workspace move) — already actioned upstream; `grep "docs/_meta"` returns zero hits in `docs/qaas/`.
- ReportPortal reporter documentation — referenced in `QaaS.Runner/CLAUDE.md` as PR #32 / commit `06e23d1` but no Runner doc page describes the ReportPortal reporter dispatch. Recommend a new leaf page under `docs/qaas/userInterfaces/runner/` to cover `ReporterType` routing; out of scope for this audit because the brief restricted the verifier to existing-page fidelity.
- Full identifier cross-check of all ~120 configurationSections leaf pages (assertions/links/metaData/sessions deep-dive + per-protocol sub-pages under `sessions/types/*-yamlView.md`) — sampled 6, remaining ~114 presumed PASS on identifiers given the auto-generation pattern and the clean sample. Recommend CI `tools/ci/check-runner-yaml-keys.sh` against `D:/QaaS/QaaS.JsonSchemaExtensions/generated-schemas/runner.schema.json` rather than manual re-audit.
- Compile-check of every C# snippet in `advancedConcepts/configurationAsCode.md` — the `Bootstrap.New(args).Run()` snippets parse but a full `csc` round-trip is the contract §4 CI job's responsibility, not this audit.
- `_meta/` / `_generated/` paths — not surfaced under `docs/qaas/`.

## Conclusion

Source-fidelity baseline is **strong**: every sampled CLI verb, every sampled flag short-letter/long-name, every sampled C# member, and every sampled YAML top-level section resolves cleanly against current source. The two P0 findings are a single regression: when `--serve-results` migrated from `bool` to `string?` in `AssertableOptions.cs` + `ExecuteOptions.cs`, the auto-generated flag tables were not re-rendered. Fix is one-and-done.

The dominant gap is **structural**: zero pages in the 160-file Runner tree carry the v2 §7 anchors (`> TL;DR`, `## When to use`, `## See also`). This is the same shape regression flagged on the mocker+catalogs side and should be addressed by the same auto-rewrite job that retemplates the catalog yamlView pages.

Forbidden-word hygiene is excellent: no AI / LLM / agent / Claude / ChatGPT / model / ai_summary surface in body text anywhere in the tree.

Tree restructure: **keep `docs/qaas/` path; relabel nav to "Runner".**
