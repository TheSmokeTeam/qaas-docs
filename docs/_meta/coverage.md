# QaaS Documentation Coverage Map

> Source of truth for the docs revamp landing in PR #43. Each linked file is a per-cluster enumeration produced by parallel Explore agents on 2026-05-22. Use this map to drive the per-area authoring fan-out in Phase 2.

## Status legend
- ✅ documented (page exists + verified vs. source)
- 🟡 stub (page exists but lacks examples / depth)
- ❌ missing (no page; gap)
- ⚠️ outdated (page exists but drifts from source)

## Cluster index

| Cluster | Coverage file | Items enumerated | Top gaps |
|---|---|---|---|
| Framework + Runner | [coverage-framework-runner.md](coverage-framework-runner.md) | 65 surface items (20 attrs, 6 ext points, 8 config sections, 8 helpers, 5 CLI verbs, reporters, options) | CLI verb reference, validation-attribute decision matrix, configuration-resolution pipeline diagram |
| Mocker family | [coverage-mocker.md](coverage-mocker.md) | 5 interfaces, 4 base classes, 14 built-in processors, 10 communication-object types, 5 YAML roots, 5 sample configs | Processor base-class lifecycle, custom data-generator hook, multi-server routing model |
| Built-in catalogs (A/G/P/Pr) | [coverage-catalogs.md](coverage-catalogs.md) | **98 plugin classes** (23 assertions, 25 generators, 41 probes, 9 processors); 19 missing XMLDoc summaries (P1 source flags) | Per-plugin overview pages, YAML-key reference tables, custom-authoring guides for all 4 families |
| Schema + Ops + Docs.Generator | [coverage-schema-ops.md](coverage-schema-ops.md) | JsonSchemaExt (6 schemas), Orchestrator surface, ElasticBootstrap, PackageMirror, Docs.Generator (rated 7/10 extensibility) | Extend Docs.Generator with per-plugin overview + config-table renderers (10–14h); 0% of 72 schema items currently auto-generated |

## Cross-cluster numbers
- **Total enumerated surface items**: 65 + 33 + 98 + ~30 = **~226 distinct documentable units**.
- **Currently documented**: per-folder structure exists for all 72 plugin entries; depth varies.
- **Top P0 risk**: 19 source classes lack XMLDoc — must be fixed in respective repos (separate PRs) before auto-gen can produce honest catalog tables.

## Per-area work-unit assignment for Phase 2 fan-out

| Area | Subagent | Worktree | Primary inputs | Output dirs |
|---|---|---|---|---|
| 1. Framework | `framework` | `qaas-docs.worktrees/framework` | coverage-framework-runner.md §1–4 | `docs/framework/`, `docs/qaas/quickStart/writeHooks.md` (deepen) |
| 2. Runner | `runner` | `qaas-docs.worktrees/runner` | coverage-framework-runner.md §5–8 | `docs/qaas/userInterfaces/runner/`, `docs/qaas/quickStart/runTest.md` |
| 3. Mocker | `mocker` | `qaas-docs.worktrees/mocker` | coverage-mocker.md (all) | `docs/mocker/`, new `docs/mocker/authoring-guide/`, `docs/mocker/concepts/` |
| 4. Catalogs | `catalogs` | `qaas-docs.worktrees/catalogs` | coverage-catalogs.md + extend QaaS.Docs.Generator | `docs/assertions/`, `docs/generators/`, `docs/probes/`, `docs/processors/`, `docs/_generated/catalogs/` |
| 5. JsonSchemaExtensions | merged into Catalogs agent (schemas drive generation) | (shared worktree) | coverage-schema-ops.md §JsonSchemaExt | `docs/_generated/schemas/` |
| 6. Orchestrator | (out of scope for PR #43; documented as stub) | n/a | coverage-schema-ops.md §Orchestrator | `docs/_meta/deferred-orchestrator.md` |
| 7. Ops (Elastic / PackageMirror) | inline page each, no fan-out agent | n/a | coverage-schema-ops.md | `docs/qaas/ops/` (new) |
| 8. Cookbooks (cross-cutting) | `cookbooks` | `qaas-docs.worktrees/cookbooks` | all coverage files | `docs/cookbooks/` (new) |
| 9. Integration (llms.txt / ZIM / Kiwix-MCP) | `integration` | `qaas-docs.worktrees/integration` | output of all other agents | `docs/integrations/kiwix-mcp.md`, `mkdocs.yml` plugin block, `tools/zim/build-zim.sh`, `.github/workflows/docs.yml` |

## Hard rules for every authoring agent (repeated for emphasis)
1. Site IA / top-level nav stays **unchanged** at the section level. Only leaf pages added/deepened.
2. Per-page contract from `~/.claude/plans/qaas-docs-structure-recipe.md` is mandatory.
3. No source guessing — verify every API name against `D:\QaaS\<repo>` (graphify MCP query if available, else `ctx_execute_file`).
4. Every code/YAML example must compile or parse against the schema.
5. ZIM-readiness: relative links only, no JS-required content, embedded assets, deterministic anchors.
6. Append to `mkdocs.yml.fragments/<area>.yml`. NEVER edit root `mkdocs.yml` directly — serialized merge happens at end of Phase 2.

## XMLDoc P1 backlog (lands in respective repo PRs, not qaas-docs PR #43)
19 source classes need XMLDoc `<summary>` blocks added before auto-gen can produce honest tables. See `coverage-catalogs.md` for the full list. Out of scope for this session; tracked here so it isn't lost.
