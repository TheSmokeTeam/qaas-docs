# v2 Agentic Workflow Architecture

> Read-only research. No code, no repo changes. Targets autonomous automation clients (Claude / Codex / GPT / Gemini) consuming QaaS via docs + source + standard tools.
>
> Scope: how an automation client uses QaaS end-to-end given (a) Kiwix-served docs ZIM, (b) read access to `D:/QaaS/QaaS.*` repos, (c) graphify MCPs, (d) shell + editor.
>
> Per authoring contract v2 §10: **no AI / agent / LLM / Claude / GPT wording in any docs content**. All proposals below use "automation client / consumer / tool" in *docs* surface; this planning file may use "client" freely.

---

## 1. Knowledge surface map

Five primary tasks. For each: canonical docs section, current gap (citing verification reports), source refs needed.

### 1.1 Write QaaS test YAMLs (`*.qaas.yaml`)
- **Canonical docs**: `docs/qaas/quickStart/writeTestYaml.md`, `docs/qaas/userInterfaces/runner/configurationSections/**` (sessions / dataSources / storages / assertions / links / metaData).
- **Authoritative schema**: `D:/QaaS/QaaS.JsonSchemaExtensions/generated-schemas/runner.schema.json` (also `assertions/generators/probes/processors.schema.json`).
- **Real-world examples found**: `D:/QaaS/DummyAppTests/DummyAppTests/test.qaas.yaml`, `D:/QaaS/QaaS.Mocker/QaaS.Mocker.Example/mocker.qaas.yaml`. **Not** under `docs/examples/` (directory empty — see §3.4 gap).
- **Gaps** (from `v2-verification-runner.md` lines 108, 221):
  - Zero pages in the 160-file Runner tree carry §7 anchors (`> TL;DR`, `## When to use`, `## See also`). A client scanning for a TL;DR will not find one.
  - `configurationSections/*/yamlView.md` pages are schema *stubs*, not §7 references — frontmatter `summary:` is a placeholder.
  - `-s/--serve-results` flag documented as `bool` switch; actual surface is `string?` folder path (P0).
- **Source refs the client should fetch**: `QaaS.Runner/QaaS.Runner.Sessions/ConfigurationObjects/*Config.cs` (one record per YAML section root), `QaaS.JsonSchemaExtensions/generated-schemas/runner.schema.json`.

### 1.2 Author custom hooks in C# (Assertion / Generator / Probe / Processor)
- **Canonical docs**: `docs/{assertions,generators,probes,processors}/custom-authoring-guide.md` (one per category) + `availableXxx/` catalog leaves.
- **Source refs**: `QaaS.Framework/QaaS.Framework.SDK/Hooks/{Assertion,Generator,Probe,Processor}/Base*.cs` and `I*.cs`. Verified existing:
  - `QaaS.Framework.SDK/Hooks/Assertion/BaseAssertion.cs` (`abstract bool Assert(IImmutableList<SessionData>, IImmutableList<DataSource>)`, `[JsonSchema]` attribute, `Configuration : TConfiguration`).
  - `QaaS.Framework.SDK/Hooks/Assertion/IAssertion.cs`, plus `Hooks/BaseHooks/` shared base.
- **Gaps** (from `v2-verification-mocker-catalogs.md` lines 52, 120):
  - Catalog overview pages use non-contract headings (`What It Does` / `What This Configuration Does` / `YAML Example`) — a client looking for `## When to use` / `## YAML configuration` finds nothing.
  - No copy-pastable, *compilable* skeleton at the top of any `custom-authoring-guide.md` (cookbook fold plan promises to add via "Realistic example" sections — see §3.3).
  - `[JsonSchema]` attribute role on hook config records is not explained on any guide page; client cannot infer that adding the attribute triggers JSON-schema emission into `generated-schemas/*.schema.json`.
- **What's needed**: every guide must show full skeleton (`MyAssertion : BaseAssertion<MyAssertionConfiguration>`), required overrides (`Assert(...)`), config record with `[Required]` / `[Description]` (matching `CommandConfig.cs` style), and the YAML snippet that references the hook by type-name.

### 1.3 Run the Runner CLI (verbs: `run`, `act`, `assert`, `template`, `execute`)
- **Canonical docs**: `docs/qaas/userInterfaces/runner/commands/{run,act,assert,template,execute}.md`.
- **Gaps** (from `v2-verification-runner.md`):
  - **P0**: `-s/--serve-results` table on `run.md` / `assert.md` / `execute.md` documents stale bool semantics. Real surface (per source): `string?` folder, absent → not served, bare `-s` → `allure-results`, `-s <folder>` → that folder. **Regen from `--help` against current build.**
  - **P0**: Raw CLI Help block on `execute.md:99-106` still says `(Default: false)`.
  - **P1**: No exit-code documentation on any verb page. Automation clients rely on exit codes to branch — currently they have to read `Bootstrap.cs` to learn them.
  - **P1**: No `## When to use` / `## See also` anchors — no machine-discoverable "next-step" links.
- **Source refs**: `QaaS.Runner/QaaS.Runner/Bootstrap.cs`, `Execution.cs`, `ExecutionBuilder.cs`, `ConfigurationObjects/CommandConfig.cs`.

### 1.4 Author Mocker stubs (`mocker.qaas.yaml`)
- **Canonical docs**: `docs/mocker/` (33 files) — `architecture.md`, `userInterfaces/mocker/configurationSections/**`, `functions/builders/executions-sections/**`.
- **Sample YAMLs (verified present)**: `QaaS.Mocker.Example/mocker.qaas.yaml`, `mocker.runner.qaas.yaml`, `mocker.grpc.qaas.yaml`. Not surfaced from docs — client has to find them by repo grep.
- **Gaps** (from `v2-verification-mocker-catalogs.md` lines 18-52, 120):
  - `Verified-against:` HTML comment policy absent across ~660 catalog pages — client cannot tell which source commit a page reflects (stale-detection blocker).
  - yamlView pages are key lists without §7 shape — no `## YAML configuration` anchor.
  - Mocker `executions-sections/*.md` repeat the boilerplate filler ("Use this method when working with the documented Runner execution builder API surface in code…") instead of stating intent.
- **Source refs**: `QaaS.Mocker/ExecutionBuilder.cs` (`RunLocally`, `Build`, `Validate`, `WithRootConfiguration`, `WithController`), `Qaas.Mocker.CommunicationObjects/ConfigurationObjects/**`.

### 1.5 Debug failing tests
- **Canonical docs**: `docs/qaas/quickStart/debugTestFailure.md` (the cookbook-fold plan will merge `debugging-failed-test.md` into this).
- **Gaps**: no per-hook "error you'll see if X" reference. No documented error-message *format* — a client cannot pattern-match runner output (e.g. "Assertion `X` returned false: …" vs "Hook configuration validation failed: …") because the canonical strings are nowhere indexed.
- **Source refs**: exception types under `QaaS.Runner/**/Exceptions/*.cs`, e.g. `MockerCommandRequestFailedException.cs` already exists but is not documented.

---

## 2. MCP / tool layer

Inventory of what an automation client needs, what exists, and what's worth building.

| MCP / tool | Purpose | Status | Recommended source | Build cost |
|---|---|---|---|---|
| **Kiwix MCP** | Offline full-text search over the docs ZIM | Planned (`docs/integrations/kiwix-mcp.md` complete; ZIM build via `tools/zim/build-zim.sh`) | upstream `kiwix-tools` + thin MCP wrapper; check `mcp.so` / `awesome-mcp-servers` for an existing kiwix MCP before authoring | Low (wrap kiwix-serve HTTP) |
| **Graphify MCPs** | AST / call-graph queries per repo | Exists (15 servers: `mcp-qaas-framework`, `mcp-qaas-runner`, `mcp-qaas-mocker`, … + meta `mcp-qaas`) | already shipped; per global `CLAUDE.md` | n/a |
| **YAML schema validator MCP** | Validate `*.qaas.yaml` / `mocker.qaas.yaml` against `generated-schemas/*.schema.json` and return JSONPath-precise errors | **Missing** | wrap `Ajv` or `python-jsonschema` over the 6 schemas (`runner.schema.json`, `mocker` equivalent, `assertions/generators/probes/processors.schema.json`); or use the existing `tools/ci/validate-yaml-snippets.sh` as backend | Low (one-day MCP) |
| **QaaS CLI executor MCP** | Wrapper around `dotnet run --project QaaS.Runner -- run|act|assert|template|execute <yaml>` returning structured `{exitCode, stdout, stderr, allureFolder}` | **Missing**. Generic shell is the alternative. | Custom thin MCP that knows the verbs + flags from the schema set, surfaces exit codes | Low-Med (avoids re-parsing freeform output) |
| **Hook scaffolder MCP** | Generate skeleton `MyAssertion : BaseAssertion<MyAssertionConfiguration>` + config record + registration | **Missing** | Templating from `BaseAssertion.cs` / `BaseProbe.cs` / `BaseGenerator.cs` / `BaseProcessor.cs`; equivalent for Mocker | Med (per-category templates) |
| **Mocker scaffolder MCP** | Generate stub set (`mocker.qaas.yaml` + endpoint stubs + `mocker.runner.qaas.yaml` consumption sample) | **Missing** | Reuse the existing `QaaS.Mocker.Template` (artifacts under `QaaS.Mocker.Template/artifacts/local-release-validation/**` show the template machinery works) — wrap it as MCP rather than rebuild | Low (template already exists) |
| **C# snippet compiler MCP** | Compile a hook snippet against `QaaS.Framework.SDK` + relevant Commons; return diagnostics | **Missing**. The CI script `tools/ci/compile-csharp-snippets.sh` (contract v2 §4) is the offline form. | Wrap that script + Roslyn-scripting | Med |
| **Kiwix-search "errors index"** | Look up "what does error X mean" | New page-set (see §3.6); served via Kiwix once written | n/a (docs content) | Low (content task) |

**Recommendation**: build only the YAML-schema-validator MCP and QaaS-CLI MCP as first-class. Hook + Mocker scaffolders can be plain CLI templates invoked via shell — clients can call them through the shell. The C# snippet compiler can stay as the CI script; clients call it directly. This keeps MCP count manageable.

---

## 3. Docs structure changes needed

### 3.1 Task-oriented landing pages (no "agent" wording)
Per contract v2 §10 the docs MUST NOT mention AI / agent / LLM / Claude / GPT. Compliance check on Runner tree: confirmed clean (`v2-verification-runner.md` line 20 — zero hits). Solution: ship plain task-titled how-to pages a client can rank without prompting:

- `docs/qaas/quickStart/writeFirstTest.md` (already exists as `writeTestYaml.md` + `writeTestCode.md` + `runTest.md` per cookbook fold plan — verified).
- `docs/{assertions,generators,probes,processors}/custom-authoring-guide.md` — extend each with "Realistic example" (cookbook fold mapping, lines 41-44 of `v2-cookbook-fold-plan.md`).
- New leaves the cookbook plan already promises:
  - `docs/mocker/authoring-guide/multi-server-routing.md`
  - `docs/qaas/userInterfaces/runner/schema-extensions.md`
  - `docs/integrations/ci-pipeline.md`

No "for automation" sidebar. Task titles already disambiguate.

### 3.2 `llms.txt` / `llms-full.txt`
- **Verified**: `find D:/QaaS/qaas-docs -name 'llms*.txt'` → no matches. Currently not produced.
- **Decision needed** (see §6): generate at MkDocs build time vs. ship by hand. Recommend auto-generation: emit `llms.txt` (index of top-level sections + 1-line summaries pulled from frontmatter `summary:`) and `llms-full.txt` (concatenated body, sectioned by `id:`).
- **Source for summaries**: the slimmed frontmatter `summary:` field is mandatory per contract v2 §6 — already enforced by `tools/ci/check-frontmatter.sh`. Auto-gen is feasible from existing fields.

### 3.3 Cookbook fold = aligned with this plan
`planning/v2-cookbook-fold-plan.md` already routes the 10 v1 cookbooks into existing sections as how-to pages. This work directly serves automation clients (concrete tasks, runnable examples) without requiring any "agent-aware" annotation. **No additional structural work** beyond executing the fold.

### 3.4 JSON schemas exposed at predictable URLs
- Schemas exist at `D:/QaaS/QaaS.JsonSchemaExtensions/generated-schemas/{runner,assertions,generators,probes,processors,manifest}.schema.json`.
- **Gap**: MkDocs site does not surface them at a predictable URL. Add `docs/_schemas/` (or copy at build) so clients can fetch e.g. `/schemas/runner.schema.json`. Add a `### YAML schema` link on each `configurationSections/*/yamlView.md`.

### 3.5 Sample YAMLs in `docs/examples/`
- **Verified**: `D:/QaaS/qaas-docs/docs/examples/` does **not** exist (`find ... -name '*.qaas.yaml'` under docs → zero). Real samples live under `DummyAppTests/`, `QaaS.Mocker/QaaS.Mocker.Example/`, `QaaS.Mocker.Template/artifacts/`.
- **Proposal**: do **not** add a `docs/examples/` tree (would duplicate). Instead, on each how-to page that already shows YAML, add a `<!-- Verified-against: DummyAppTests/test.qaas.yaml@<sha> -->` comment so a client can chase the live sample. Matches the `Verified-against:` policy demanded by `v2-verification-mocker-catalogs.md` P0-1.

### 3.6 Per-hook "what error you'll see if X" reference
- New section under each custom-authoring guide: `## Error reference` table with columns `Error message regex | Cause | Fix | Source line`.
- Source for canonical strings: grep `throw new .*Exception($"…")` in `QaaS.Runner` + `QaaS.Framework` + `QaaS.Mocker`. ~50 patterns total.
- This is the single highest-leverage addition for a debugging-capable client (§1.5 gap).

---

## 4. Agentic workflow archetypes

Three reference workflows. Tool-call sequences. Each step is one MCP/shell invocation.

### 4.1 "Add a new HTTP probe test"
1. `kiwix-mcp.search("probe custom authoring")` → `docs/probes/custom-authoring-guide.md`.
2. `kiwix-mcp.fetch("/probes/custom-authoring-guide#realistic-example")` → skeleton + config record.
3. `mcp-qaas-framework.get_node("BaseProbe")` → confirm abstract members + namespace.
4. `mcp-qaas-framework.shortest_path("BaseProbe","IProbe")` → confirms interface contract.
5. `shell: dotnet new classlib -n MyProbes` → write `HttpProbe.cs` and `HttpProbeConfiguration.cs`.
6. `csharp-snippet-compile` (CI script) → diagnostics: 0 errors.
7. `kiwix-mcp.search("write test yaml")` → `docs/qaas/quickStart/writeTestYaml.md`.
8. Author `tests/myProbe.qaas.yaml` referencing the new probe type.
9. `yaml-schema-validator-mcp.validate(tests/myProbe.qaas.yaml, schema=runner+probes)` → JSONPath errors if any, else OK.
10. `qaas-cli-mcp.run(tests/myProbe.qaas.yaml)` → `{exitCode:0, allureFolder:"allure-results"}`.
11. Parse allure → pass.

### 4.2 "Diagnose why my test fails on stage 2 only"
1. `qaas-cli-mcp.run(test.qaas.yaml)` → `{exitCode:1, stderr:"Assertion 'StatusOk' returned false at session 'stage2': expected 200 got 502"}`.
2. `kiwix-mcp.search("Assertion returned false error")` → `docs/assertions/custom-authoring-guide#error-reference` (new, §3.6) → "expected/got mismatch → upstream returned non-2xx" + fix hints.
3. `mcp-qaas-runner.query_graph("stage2 -> sessions -> dataSources")` → reveals the dataSource that feeds stage2.
4. `kiwix-mcp.fetch("/qaas/userInterfaces/runner/configurationSections/sessions/yamlView")` → confirm the YAML key `Stages[].Sessions[].DataSources[]`.
5. Optionally `mcp-qaas-mocker.query_graph(...)` if the dataSource is a mock; check if a stub mismatches.
6. Edit YAML / stub.
7. `qaas-cli-mcp.run` → exit 0.

### 4.3 "Mock an external dependency for a transaction test"
1. `kiwix-mcp.search("mocker authoring guide multi server routing")` → `docs/mocker/authoring-guide/multi-server-routing.md` (new, per cookbook fold).
2. `mcp-qaas-mocker.get_node("ExecutionBuilder")` → lines 197 (`WithRootConfiguration`), 578 (`WithController`), 664 (`Build`), 771 (`Validate`).
3. `shell: dotnet new --list | grep -i qaas.mocker` → use `QaaS.Mocker.Template` (artifacts confirm the template machinery works).
4. `shell: dotnet new qaas.mocker -n MyMock` → generates `mocker.qaas.yaml` + bootstrap class.
5. `yaml-schema-validator-mcp.validate(mocker.qaas.yaml, schema=mocker)` → OK.
6. Reference the mocker from `test.qaas.yaml` via the existing `MockerCommandConfig` shape (verified at `QaaS.Runner.Sessions/ConfigurationObjects/MockerCommandConfig.cs`).
7. `qaas-cli-mcp.run(test.qaas.yaml)` with mocker spun up → exit 0.

---

## 5. Self-evaluation rubric: "is the docs site automation-ready?"

Mechanical, checkable dimensions. Each is a boolean per page or per surface.

| # | Dimension | Check | Current state |
|---|---|---|---|
| R1 | Every public extension point has a copy-pastable, *compilable* skeleton in a fenced block | Per page: grep for ```` ```csharp ```` block + run through `compile-csharp-snippets.sh` | Failing — custom-authoring guides lack realistic examples (cookbook fold P1) |
| R2 | Every YAML key cited resolves in `generated-schemas/*.schema.json` | `tools/ci/validate-yaml-snippets.sh` already in place per contract v2 §4 | Partial — runs CI gate, but yamlView pages list keys without schema anchor links |
| R3 | Every documented error message has a stable substring + cause + fix entry | Per hook category: `## Error reference` table with regex column | **Missing entirely** |
| R4 | Every CLI verb documents exit codes (machine-parseable) | Per `commands/*.md`: `## Exit codes` table | **Missing entirely** |
| R5 | Every page carries `Verified-against: <repo>@<sha>` HTML comment | Grep `<!-- Verified-against:` count vs file count | Failing — P0-1 in `v2-verification-mocker-catalogs.md` |
| R6 | Every page has `> TL;DR` blockquote, `## When to use`, `## See also` | Static linter | Failing — 0/160 Runner pages, 0/33 Mocker pages conform (contract §7) |
| R7 | Every frontmatter has `summary: <≤200 chars>` (feeds `llms.txt`) | `check-frontmatter.sh` already enforces post-rename from `ai_summary` | Partial — fold of `summary:` field complete on most areas |
| R8 | JSON schemas reachable at `/schemas/{runner,mocker,assertions,generators,probes,processors}.schema.json` | HTTP HEAD on built site | **Missing** — schemas live in `QaaS.JsonSchemaExtensions` only |
| R9 | `llms.txt` and `llms-full.txt` exist at site root | `curl /llms.txt` 200 | **Missing** |
| R10 | At least one realistic, complete sample on every how-to page | Per page: ≥1 fenced YAML or C# block ≥10 lines, plus `Verified-against:` | Failing on catalog pages |

Site is automation-ready when **all 10 dimensions** are green. Today: R2 partial, R7 partial, R1/R3/R4/R5/R6/R8/R9/R10 failing. Cookbook fold + §3 additions close R1/R3/R4/R5/R6/R8/R9/R10.

---

## 6. Open questions for the user

1. **Custom QaaS-CLI MCP vs generic shell-execute?** — Recommend custom. Verbs, exit codes, and Allure-folder return value are too valuable to leave to stdout-scraping. Cost: low-med (1-2 days).
2. **`llms.txt` / `llms-full.txt`: auto-generate or hand-author?** — Recommend auto. The slimmed frontmatter (`summary:` field, contract v2 §6) is already a clean source; an MkDocs hook can emit both files at build time. Hand-authoring will rot.
3. **Ship a "QaaS automation-client skill pack" alongside the docs?** — i.e. a separate `qaas-skills` repo with skill files an automation client loads (one skill per task in §1). Would let the docs stay strictly task-oriented (contract §10) while still offering a curated workflow library. Tradeoff: another repo to maintain. **Recommend: defer until cookbook fold + R1/R3/R4 land.** Once those exist, the docs ARE the skill pack.
4. **YAML-schema-validator MCP**: build new vs. wrap existing `tools/ci/validate-yaml-snippets.sh`? Wrapping is faster; building gets JSONPath-precise errors that humans + clients both benefit from. Recommend wrapping for v2.0, fresh build for v2.1.
5. **Hook scaffolder format**: `dotnet new` templates vs MCP-side codegen? `dotnet new` is the .NET-native answer and discoverable by any consumer; MCP would duplicate. **Recommend `dotnet new` templates** (`qaas-assertion`, `qaas-probe`, `qaas-generator`, `qaas-processor`, `qaas-mocker` — the last already exists as `QaaS.Mocker.Template`).
6. **`Verified-against:` SHA scope** (P0-1 fix): per-page anchor against the *file* in source, or against the whole repo `HEAD`? Per-file gives precision; repo-HEAD gives simplicity. Recommend per-file SHA via a `tools/ci/stamp-verified-against.sh` task.

---

## Appendix — verified facts (greps)

- `BaseAssertion<TConfiguration>` exists at `QaaS.Framework.SDK/Hooks/Assertion/BaseAssertion.cs` with `[JsonSchema]` attribute and `abstract bool Assert(...)`.
- Hook category dirs: `Assertion / Generator / Probe / Processor / BaseHooks` under `QaaS.Framework.SDK/Hooks/`.
- Generated schemas (6): `runner / assertions / generators / probes / processors / manifest .schema.json` under `QaaS.JsonSchemaExtensions/generated-schemas/`.
- `mkdocs.yml` present at `D:/QaaS/qaas-docs/mkdocs.yml`.
- `docs/examples/` does **not** exist (find returned nothing).
- `llms*.txt` does **not** exist anywhere under `qaas-docs`.
- Sample `.qaas.yaml` files: `DummyAppTests/test.qaas.yaml`, `QaaS.Mocker/QaaS.Mocker.Example/mocker*.qaas.yaml`, `QaaS.Mocker.Template/artifacts/**`.
- Cookbook plan: `planning/v2-cookbook-fold-plan.md` already routes the 10 v1 cookbooks into existing sections.
- Verification reports cited: `planning/v2-verification-{framework,runner,mocker-catalogs}.md`.
- Forbidden-word audit (contract §10): Runner tree clean (zero AI/LLM/Claude/GPT/agent hits per `v2-verification-runner.md` line 20). Mocker+catalogs also clean.
