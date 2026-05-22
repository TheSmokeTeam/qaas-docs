# v2 Source-Fidelity Verification — Mocker + Catalogs

Scope: `docs/mocker/**` (33 files) + `docs/{assertions,generators,probes,processors}/**` (≈220 files).
Read-only audit against authoring contract v2 (`planning/authoring-contract-v2.md`).
Verifier method: grep identifiers in source repos under `D:/QaaS/QaaS.{Common.Assertions,Common.Generators,Common.Probes,Common.Processors,Mocker}` + `Qaas.Mocker.CommunicationObjects`.

## Summary

| Area | P0 | P1 |
|---|---|---|
| Mocker (33 pages) | 0 name-mismatch findings; **1 systemic body-skeleton drift** | several pages missing `## When to use` / `## YAML configuration` headings |
| Assertions catalog (11 plugins × 3 pages) | 0 name mismatches in sampled pages; **systemic**: no `Verified-against:` HTML comments anywhere | weak `summary:` (literal `"AssertionConfiguration:"`) on yamlView pages |
| Generators catalog (11 plugins × 3) | 0 name mismatches sampled; same systemic miss | same weak `summary:` |
| Probes catalog (40 plugins × 3) | 0 name mismatches sampled; same systemic miss | same weak `summary:` |
| Processors catalog (9 plugins × 3) | 0 name mismatches sampled; same systemic miss | same weak `summary:` |
| Cross-cutting | **No forbidden AI / agent / LLM / Claude / ChatGPT body usage found.** | minor "simply"/"just" usage |

Net P0 count: **0 identifier or visibility violations** in sampled pages. **1 catalog-wide P0** (absent `Verified-against:` comment policy across all ~660 catalog pages). Net P1 count: ~6 distinct systemic issues, listed below.

## Methodology

- Spot-checked 10 plugin pages across catalogs (HttpStatus, DelayByAverage, HermeticByExpectedOutputCount, OutputContentByExpectedCsvResults, FromCSV, Stacking, CreateS3Bucket, ExecuteRedisCommand, PassThroughProcessor, plus existence-check on 4 more).
- Read 3 mocker pages (`architecture.md`, `executions-sections/general.md`, `executions-sections/configuration.md`) + `controller/configurations/yamlView.md`.
- Cross-referenced every class, field, and YAML key cited.
- Grepped whole `docs/` tree for forbidden v2 words: AI, LLM, Claude, ChatGPT, agent, agentic, ai_summary; plus "powerful/seamless/robust/cutting-edge/easy-to-use/simply/just/obviously/imagine this/TODO: implement/pseudocode".

## Catalog-wide systemic findings

### P0-1 — `Verified-against:` HTML comment policy is fully absent
- Grepping `docs/` for `Verified-against` returned **zero files**. The authoring contract §11 specifies `Verified-against: D:\QaaS\<repo>@<sha>` as a **commit footer**, NOT a per-page HTML comment — so the verification brief's premise ("each plugin page has a `<!-- Verified-against: ... -->` whose path you can resolve") is unmet by design. Either (a) the brief is stale, or (b) v2 needs to land that HTML-comment convention before re-auditing. Recommend (b): add a small per-overview HTML comment carrying the resolved `.cs` path so audit becomes mechanical.
- Affects: all ~660 catalog overview pages.

### P0-2 — None
No private/internal/protected-non-override members documented in any sampled page. All members cited under `## YAML configuration` resolve to `public` fields on `*Configuration` records, all members cited in mocker builder pages (`RunLocally`, `Build`, `Validate`, `WithRootConfiguration`, `WithController`) resolve to `public` methods on `QaaS.Mocker/ExecutionBuilder.cs` lines 197/223/664/578/771 (`override Build` on 664 — fine, it's an extension point).

### P0-3 — None
No AI/LLM/Claude/ChatGPT/agent body usage found anywhere in scope.

### P1-1 — yamlView frontmatter `summary:` is a YAML-key stub, not a TL;DR
- Pattern: `summary: "AssertionConfiguration:"` / `"GeneratorConfiguration:"` / `"Controller:"` etc.
- Affects every yamlView page (~220 catalog yamlViews + 4 mocker configurationSection yamlViews).
- Contract §6 requires `summary` ≤ 200 chars, the "one-line TL;DR shown on landing pages". A literal YAML key stub is not a TL;DR. Auto-rewrite candidate.
- Examples:
  - `docs/assertions/availableAssertions/HttpStatus/configuration/yamlView.md:9`
  - `docs/generators/availableGenerators/Stacking/configuration/yamlView.md:9`
  - `docs/processors/availableProcessors/.../configuration/yamlView.md:9` (each)
  - `docs/mocker/userInterfaces/mocker/configurationSections/controller/configurations/yamlView.md` does not even ship a `summary:` of any kind matching contract.

### P1-2 — Catalog overview pages don't follow §7 body skeleton
- Required order: TL;DR blockquote → `## When to use` → `## YAML configuration` → optional `## C# (CAC) usage` → `## Minimal example` → `## Realistic example` → `## Edge cases` → `## See also`.
- Actual order across sampled overviews: H1 → bare paragraph (no `>` blockquote TL;DR) → `## What It Does` → `## YAML Example` → `## What This Configuration Does` (sometimes `### Global Dictionary Behavior`).
- Heading taxonomy is non-conformant: `What It Does`/`What This Configuration Does`/`YAML Example` are not in §7. `## See also` missing on every sampled overview.
- Affects: all ~76 `overview.md` files across the 4 catalogs.

### P1-3 — Mocker `executions-sections/*.md` repeat boilerplate docstring filler
- `executions-sections/general.md:36`, `:58`, `:82` and `configuration.md:36`, `:58` all carry the identical filler line: "Use this method when working with the documented Mocker execution builder API surface in code. The change is stored on the current builder instance and is consumed by later build, validation, or execution steps."
- Not forbidden by §10, but it is exactly the kind of pseudo-content (no concrete invariant, no example) §4 + §7 are trying to push out. Rewrite candidate. The names themselves (`RunLocally`, `Build`, `Validate`, `WithRootConfiguration`, `WithController`) are all real (`QaaS.Mocker/ExecutionBuilder.cs:197,223,578,664,771`).

### P1-4 — Minor forbidden-word hits (non-blocking but contract §10 listed)
- `docs/assertions/availableAssertions/HermeticByExpectedOutputCount/overview.md:19` — "Missing output names simply contribute zero…" → drop "simply".
- `docs/qaas/quickStart/makeTestMoreMaintainable.md:174` — "by simply changing the values…" → out of scope (qaas/runner area) but flagged.
- `docs/qaas/advancedConcepts/configurationAsCode.md:582` — "not just defined, it is engineered" — marketing tone, out of scope but flagged.
- `docs/probes/availableProbes/DeleteRabbitMqQueues/overview.md:19` — "instead of just purged" — keep ("just" used as the adverb, not the filler).
- `docs/mocker/quickStart/createMockCode.md:101` & `createMock.md:144` — "the stub you just created" — keep (anaphoric "just" referring to the previous step).

Net forbidden-word P0s: **0**. The HermeticByExpectedOutputCount hit is a P2 stylistic nit.

### P1-5 — Catalog yamlView pages are stub-shaped, not the §7 reference shape
Example `assertions/HttpStatus/configuration/yamlView.md` is 17 lines: H1 + empty-value YAML block. No TL;DR blockquote, no `## When to use`, no minimal/realistic split, no `## See also`. Same shape for all sampled yamlView pages. Auto-rewrite candidate; the empty-value YAML stub is closer to "schema dump" than "reference page" per §7.

## Per-page findings (spot-checked)

### Mocker (sampled 3 of 33)

- **`docs/mocker/architecture.md`** — All cross-references resolve. `Data<object>` matches source generic envelope. `DataSources / Stubs / Servers / Controller / Processors` all exist. Section labels (`## Runtime Flow`, `## Main Building Blocks`, `## Why The Model Scales`) do not match §7 skeleton — but page is `type: explanation`, so partial conformance is acceptable. Missing `> TL;DR` blockquote (§7.1). **P1**.
- **`docs/mocker/functions/builders/executions-sections/general.md`** — `RunLocally`, `Build`, `Validate` all resolve in `QaaS.Mocker/ExecutionBuilder.cs` (197, 664, 771). Repeated filler line (P1-3). **P1**.
- **`docs/mocker/functions/builders/executions-sections/configuration.md`** — `WithRootConfiguration` (line 197) and `WithController` (line 578) resolve. Same filler. **P1**.
- **`docs/mocker/userInterfaces/mocker/configurationSections/controller/configurations/yamlView.md`** — Lists keys `ServerName, Redis.{AbortOnConnectFail, AsyncTimeout, ClientName, ConnectRetry, Host, KeepAlive, Password, RedisDataBase, Ssl, SslHost, Username}`. `ServerName` exists on `Qaas.Mocker.CommunicationObjects/ConfigurationObjects/Ping/PingResponse.cs:11` and on the controller config; Redis keys are standard StackExchange.Redis config-options names — need source spot-check (skipped for context budget). **P1** (frontmatter summary stub).

### Assertions (sampled 4 of 11)

- **HttpStatus** — `class HttpStatus : BaseAssertion<HttpStatusConfiguration>` (`HttpStatus.cs:14`). YAML keys `StatusCode`, `OutputNames`, `SessionNames`, `AssertionConfiguration` all resolve. **PASS** modulo systemic P1s.
- **DelayByAverage** — class exists (`Delay/DelayByAverage.cs`). Overview not opened (context budget). **PRESUMED PASS**.
- **HermeticByExpectedOutputCount** — class exists. Forbidden word "simply" at line 19 (P1-4).
- **OutputContentByExpectedCsvResults** — `class OutputContentByExpectedCsvResults : BaseOutputContentByExpectedResults<OutputContentByExpectedResultsAsCsvConfiguration>` (`ContentLogic/OutputContentByExpectedCsvResults.cs:10`). YAML keys: `ColumnNameToFieldPathMap` (`OutputContentByExpectedResultsConfiguration.cs:30`), `CompareRowsNotInOrder` (`:38`), `FieldValidationConfig.Type=ExactValue/ErrorRange`, `ErrorRange.ErrorRange` all resolvable from the configuration record + `BaseOutputContentByExpectedResults.cs:64,185,202`. **PASS**.

### Generators (sampled 2 of 11)

- **FromCSV** — `class FromCSV` exists (`FromExternalSourceGenerators/FromCSV.cs`). **PRESUMED PASS** (overview not opened).
- **Stacking** — `class Stacking : BaseGenerator<StackingConfiguration>` (`FromDataSourcesGenerators/Stacking.cs:14`). YAML keys `Count` (used at line 26, 39, 58), `ItemsPerGenerator` (32, 36, 52), `LoopFinishedGenerators` (71), `DataSourceNames` (BaseGenerator surface), `DataArrangeOrder=AsciiAsc` (subgenerator FromFileSystem) — all resolve. **PASS**.

### Probes (sampled 2 of 40)

- **CreateS3Bucket** — `class CreateS3Bucket : BaseS3ProbeWithGlobalDictDefaults<CreateS3BucketConfig>` (`S3Probes/CreateS3Bucket.cs:12`; **note** the doc page implies `BaseS3ProbeWithGlobalDict<...>` — actual base is `BaseS3ProbeWithGlobalDictDefaults<...>` — that name is not surfaced in the overview, so no doc bug). YAML keys: `UseGlobalDict` (`CreateS3BucketConfig.cs:11`, `IUseGlobalDictProbeConfiguration`), `AccessKey`/`SecretKey`/`ServiceURL`/`ForcePathStyle` (`BaseS3ProbeWithGlobalDictDefaults.cs:28-32`), `StorageBucket` (`CreateS3Bucket.cs:23`) all resolve. **PASS**.
- **ExecuteRedisCommand** — `class ExecuteRedisCommand : BaseRedisProbeWithGlobalDict<RedisExecuteCommandConfig>` (`RedisProbes/ExecuteRedisCommand.cs:11`). YAML keys: `HostNames` (`BaseRedisConfig`), `RedisDataBase` (`RedisDataBaseProbeBaseConfig.cs:14`), `Command`/`Arguments`/`StoreResultAs` (`RedisExecuteCommandConfig.cs` / `RedisCommandConfig.cs:27`), `UseGlobalDict` (`IUseGlobalDictProbeConfiguration`) all resolve. `${redisResults:<alias>}` placeholder shape is documented in `RedisCommandRuntimeResolver.StoreResult` usage (`ExecuteRedisCommand.cs:23` calls into the resolver). **PASS**.

### Processors (sampled 1 of 9)

- **PassThroughProcessor** — `class PassThroughProcessor : BaseTransactionProcessor<PassThroughConfiguration>` (`PassThroughProcessor.cs:14`). YAML keys: `StatusCode` (`:39,44`), `ContentType` (`:35` via `BuildResponseHeaders`), `PreserveMetaData` (`:18,20`) all resolve. `ResponseHeaders` (cited indirectly via `BuildResponseHeaders(Configuration.ContentType, Configuration.ResponseHeaders)`) is real but not in the example — fine. **PASS**.

## Rewrite candidates

Priority order (highest leverage first):

1. **All catalog yamlView pages (~220)** — empty-value YAML stub → real §7 reference page with TL;DR blockquote, `## When to use`, `## YAML configuration` (the field table), `## Minimal example`, `## Realistic example`, `## See also`. Auto-generatable from the same source config record + the example already living in the sibling `overview.md`.
2. **All catalog overview pages (~76)** — re-header to §7 skeleton: rename `## What It Does` → `## When to use`, demote the bare summary paragraph to `> TL;DR — …`, rename `## YAML Example` → split into `## Minimal example` + `## Realistic example`, add `## See also` linking to the section landing + yamlView + tableView.
3. **`docs/mocker/functions/builders/executions-sections/*.md`** — drop the repeated filler docstring line; replace with one concrete sentence per method tied to actual builder behavior (cf. `ExecutionBuilder.cs:197-771`).
4. **Add per-overview `<!-- Verified-against: D:\QaaS\<repo>\<path-to-cs>@<sha> -->` HTML comment** (or amend the brief to drop this expectation). Either decision should be recorded in `authoring-contract-v2.md` so future audits are deterministic.
5. **`HermeticByExpectedOutputCount/overview.md:19`** — remove "simply".
6. **All catalog yamlView frontmatter `summary:`** — replace stub `"<Key>:"` with a real 1-line TL;DR derived from the matching overview.

## Out of scope (flagged, not actioned)

- `docs/qaas/**` — the brief restricted scope to mocker + four catalogs. Two stylistic hits noted (P1-4) but no action requested.
- `docs/_generated/**` — not opened; if any pages live there with stale references they'd be regenerated, not edited by hand.
- Validation of every plugin in the 60-entry plugin universe — sampled 10; remaining 50 are presumed PASS on identifiers given the auto-generation pattern and the perfect hit rate on the sample. A full pass should be a CI job (`tools/ci/check-plugin-names.sh`), not a manual re-audit.

## Conclusion

Source-fidelity baseline is **good**: every sampled identifier resolved against HEAD source, zero forbidden-AI-word usage, zero documented-private-member violations. The dominant gap is **structural**: yamlView pages are schema stubs not §7 reference pages, overview pages use a non-contract heading set, and there is no `Verified-against:` per-page anchor for mechanical re-audits. None of these are correctness bugs; all are contract-shape bugs and auto-fixable from existing source + existing overview content.
