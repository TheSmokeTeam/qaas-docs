# v2 Source-Fidelity Verification — `docs/framework/**`

Verifier: PR #43 read-only audit against authoring contract v2 (`planning/authoring-contract-v2.md`).
Source-of-truth repo: `D:\QaaS\QaaS.Framework@e7ee3d4`.
Docs scope: 51 markdown pages under `docs/framework/`.
Date: 2026-05-22.

## Summary

| Metric | Count |
|---|---|
| Pages verified | 51 / 51 |
| P0 findings | 0 (after false-positive review) |
| P1 findings | 0 |
| Forbidden branding words (`AI`, `agent`, `LLM`, `Claude`, `ChatGPT`) | 0 |
| Forbidden marketing words (`seamless`, `powerful`, `easy-to-use`, `robust`, `cutting-edge`, `simply`, `just`, `obviously`) | 0 |
| Legacy `ai_summary` frontmatter (v2 §6 violation) | 0 |
| Frontmatter compliance (`id`, `type`, `status`, `since`, `last_verified`, `applies_to`, `keywords`, `summary`) | 51 / 51 |
| Non-public symbols documented (v2 §2 violation) | 0 |
| Pages needing rewrite (>5 fixes) | 0 |

Conclusion: the framework area of PR #43 is **clean against contract v2**. CI's branding/marketing guards have already eliminated forbidden vocabulary, and every PascalCase API token referenced in code blocks or inline code resolves to a public symbol in `D:\QaaS\QaaS.Framework@e7ee3d4`.

## Method

1. Walked `D:\QaaS\QaaS.Framework` (307 `.cs` files, excluding `bin`/`obj`) and built three symbol sets:
   - Public surface (`public`, `protected`): 1130 class / interface / struct / enum / record / method / property names.
   - Non-public surface (`private`, `internal`): 366 names.
   - Wide universe (every PascalCase token defined or referenced + namespace parts + folder segments): 3756 names.
2. Walked all 51 `docs/framework/**/*.md` pages.
3. For each page, parsed frontmatter, body, fenced code blocks, and inline-code spans separately.
4. Identifier candidates were only flagged when one of the following held:
   - Token appears inside a fenced code block, **or**
   - Token appears inside an inline-code span that contains `.`, `(`, `<`, or ends with `.cs` (i.e. looks like an API/file reference, not a prose section heading like `` `General` `` or `` `Collection helpers` ``), **or**
   - Token in prose is immediately followed by `(`, `<`, or `.Member` (call/generic/member access).
5. Tokens matching the BCL / framework allowlist (HTTP, JSON, common runtime types, common doc nouns like "Note", "Warning") were filtered out to suppress noise.
6. Cross-referenced remaining candidates against the source symbol universe and the non-public set.
7. Verified every flagged item by hand via `grep` / `Read` against the source repo.

## Per-page findings

After false-positive review, **no page has remaining P0 or P1 findings**. The detector raised two candidates which I subsequently verified to be intentional documentation-of-absence (not violations):

### docs/framework/projects/executions.md
- (False positive, no action) — L26: ``This package no longer defines mode-specific logic such as `ShouldRun(ExecutionType)` in `ILogic`. That older shape is not the current interface.`` — explicitly negative reference, contract v2 §3 does not prohibit naming a removed symbol in order to disambiguate from stale prior docs. `ShouldRun` is confirmed absent from `QaaS.Framework@e7ee3d4`. Leave as-is.

### docs/framework/projects/sdk.md
- (False positive, no action) — L96: ``The current SDK does not expose the old `BaseProcessor<TConfiguration>` shape that some stale docs referenced.`` — same pattern; intentional negative mention to redirect readers away from a removed API. `BaseProcessor` is confirmed absent from `QaaS.Framework@e7ee3d4`. Leave as-is.

### All other 49 pages
No findings. Every documented type, method, property, and `.cs` file name resolves against `QaaS.Framework@e7ee3d4`. Frontmatter on every page contains all eight required v2 §6 keys (`id`, `type`, `status`, `since`, `last_verified`, `applies_to`, `keywords`, `summary`) and no legacy `ai_summary` field. No forbidden branding or marketing words. No non-public members documented.

## Spot-check confirmations

To guard against tooling blind spots I spot-checked five high-risk pages by hand:

- `projects/configuration.md` — every `*.cs` filename (`ConfigurationPlaceHolderParser.cs`, `ConfigurationDictionaryUtils.cs`, `ConfigurationListUtils.cs`, `ConfigurationTypeUtils.cs`, `ValidationUtils.cs`) exists under `QaaS.Framework.Configurations/`.
- `projects/policies.md` — `Exceptions/CountStop.cs`, `Exceptions/TimeoutStop.cs`, `Exceptions/StopAction.cs`, `PolicyBuilder.cs`, `AdvancedLoadBalance/`, `LoadBalancePolicy.cs` all confirmed present.
- `projects/sdk.md` — `AssertionMessage`, `AssertionTrace`, `AssertionAttachments`, `AssertionStatus`, `Assert`, `StatusCodeTransactionProcessor`, `ExecutionData`, `DataSources`, `SessionDatas`, `AssertionResults`, `RootConfiguration`, `Bind`, `MetaData` all confirmed present in `QaaS.Framework.SDK/`.
- `projects/executions.md` — `IRunner.Run()`, `BaseExecution`, `Context`, `ExecutionType`, `Start()`, `Dispose()`, `BaseExecutionBuilder`, `Logics/ILogic.cs`, `ILogic.Run(ExecutionData)` all confirmed.
- `functions/builders/data-sources.md` and section pages — `DataSourceBuilder.Register()`, `Framework.DataSourceObjects` namespace path, and supporting helpers resolved against current source.

## Rewrite candidates

None. No page exceeds five fixes — no page has more than two findings, and both of those are false positives. No page requires rewriting on source-fidelity or v2-vocabulary grounds.

## Risks / blind spots

The verifier is deliberately conservative. It will under-report when:

1. **Method signatures**: it confirms the *name* exists but not the parameter list or return type. A renamed parameter or a method whose arity changed would slip through. Recommend a follow-up pass that parses method signatures from source and grep-matches against `\`Method(...)\`` spans in the docs.
2. **YAML keys**: the verifier only checks C# identifiers. YAML keys must be cross-checked against `D:\QaaS\QaaS.JsonSchemaExtensions\generated-schemas\` separately (v2 §4 — CI's `validate-yaml-snippets.sh` is the authoritative gate).
3. **CLI flags**: out of scope for the framework area (no CLI surface in `QaaS.Framework`).
4. **`[Obsolete]` deprecation banners** (v2 §2 last bullet): the verifier does not yet enforce the "single banner, no examples" rule. Recommend a future linter rule that detects `[Obsolete]`-decorated symbols in source and confirms each documented occurrence is wrapped in an admonition with no following code blocks.

These three gaps should be filed against a v2.1 verifier sweep; they do not affect the PASS verdict for the current PR #43 framework area.

## Verdict

**PASS.** `docs/framework/**` is contract-v2 compliant. Zero blocking findings. Two cosmetic false positives left documented above for reviewer awareness. Safe to merge the framework portion of PR #43 on source-fidelity grounds.
