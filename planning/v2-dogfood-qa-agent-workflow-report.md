# QaaS QA-Agent Workflow Improvement Report

Date: 2026-05-22

## Scope

This report was produced while hardening `qaas-test-writer` for docs-only QaaS users and weaker models with smaller context windows. It uses the local `D:\QaaS\qaas-docs` `feature/document-actions` branch and open PR #43 context as requirements input, but does not edit the docs repository.

## Tooling Status

- Superpowers: used for verification discipline and subagent research.
- GSD: used as planning context; `.planning` docs were treated as requirements evidence.
- Ruflo: available and useful for command-risk preflight. `ruflo guidance gates -c "python ...validate_skill.py ..."` allowed the validation command. `ruflo init` was intentionally not run because it writes project state.
- ClaudeMem: CLI exists, but `status` and `search` timed out in this environment. Memory was treated as unavailable and non-blocking.
- Graphify MCP: QaaS graph MCP transports closed during `query_graph` attempts. Local graph/source/docs were used instead.
- GitHub/gh: used to confirm open docs PR context and current popular repository references.

## Docs Branch State

Local `qaas-docs` is on `feature/document-actions`, open PR #43 against `master`. The local branch is ahead of the remote branch and has modified/untracked docs files, so local docs are not identical to what GitHub PR reviewers see.

That matters for QA-agent readiness: a docs-only model reading the PR can miss local pages already referenced by navigation, while a local model can see pages not yet available to users.

## Main Findings

1. Docs-only QA-agent readiness is not closed.
   Planning says a QA agent must be able to plan tests, author YAML, write custom hooks, author Mocker stubs, run QaaS, parse Allure, and iterate from failures. Current docs still leave gaps around stable schema URLs, Allure JSON/error references, CLI exit patterns, and end-to-end recipes.

2. Custom hook guides need registration and discovery sections.
   Assertion, generator, probe, and processor guides show inheritance shapes, but they do not consistently explain project/package references, output DLL discovery, simple name versus full type name, and simple-name collision handling. The debug docs mention unknown hook failures, but hook authoring pages should link this directly.

3. Custom hook schema generation is underexplained.
   Schema extension docs discuss schema attributes and regeneration, but custom guide readers are not told when `[Required]` and `[Description]` become schema output, how to include their assembly, or when to regenerate/clean schema output.

4. The probe guide has copy-paste risk.
   It contains synchronous HTTP waiting patterns and warns against `Task.Run`, but it should also explain cancellation, bounded retry/backoff, logger usage, DI limits, exception semantics, and why blocking async must be avoided or isolated.

5. Configuration-as-code is rich but not task-shaped enough.
   The page explains concepts and public builder APIs, but needs a compact copy path: YAML template command, CAC template command, expected diff shape, and CI drift failure behavior.

6. Stages need canonical recipes.
   Docs explain that action stages are not hard barriers, but dogfood still struggled with a "two stages, one session" request. Add two recipes: single-session action launch ordering and hard two-phase flow using two sessions with `Stage` / `RunUntilStage`.

7. Mocker controller docs need an end-to-end Runner/Mocker example.
   The controller overview, Runner MockerCommands page, and multi-server routing page describe pieces. Add a single Redis-backed controller example with readiness, channel naming, ack failure modes, and Runner `MockerCommands` YAML.

8. Docs CI validation is not hard enough for QA-agent use.
   C# snippet compilation and YAML schema checks should fail hard with file/line/JSONPath diagnostics when schemas and compilers are available. Warning-only CI lets invalid examples survive.

9. Missing examples are the largest docs-only gap.
   Add hello-world HTTP Runner test, `act`/`assert` replay recipe, storage YAML placement, `SaveData` behavior, `JsonStorageFormat` placement, and `HttpStatus.OutputNames` examples.

10. PackageMirror CI examples need executable integrity verification.
    The docs say to verify checksums, but the main workflow should include the manifest/hash commands rather than leaving integrity as an edge-case note.

## Skill Changes Made From These Findings

- Added `references/docs-only-contract.md` so weaker models know docs/schema are the user contract and source is caveat evidence only.
- Added `references/config-as-code-flow-control.md` to force real `IExecutionBuilderConfigurator` usage instead of only `Bootstrap.New(args).Run()`.
- Added `references/architecture-e2e-authoring.md` and generated 50 architecture fixtures with docs evidence, plans, Runner YAML, Mocker YAML, custom hooks, variables, and validation manifests.
- Added `references/scenario-taxonomy.md` and expanded `evals/scenarios.json` to 1500 hard/extreme/near-impossible scenarios.
- Added `scripts/validate_architecture_e2e.py` to build hosts and template every generated Runner and Mocker config.
- Tightened `scripts/validate_skill.py` to require 1500 scenarios, 50 architecture IDs, docs-only contract sources, custom hook families, config-as-code flow-control tokens, architecture fixture validation, and saved build/template evidence.

## Verified Evidence

- `python scripts/validate_architecture_e2e.py . --template`
  - Runner host build: 0
  - Mocker host build: 0
  - Runner templates: 50/50
  - Mocker templates: 50/50
- `python scripts/validate_skill.py .`
  - Score: 10/10
  - Scenarios: 1500/1500

## Recommended Docs Backlog

1. Add "Registration & discovery" to all custom hook guides.
2. Cross-link schema generation from all custom hook guides.
3. Add CAC "copy this" path with template/build/diff commands.
4. Add canonical stage YAML recipes.
5. Add full Runner + Mocker controller recipe with Redis.
6. Make docs snippet validation fail hard where toolchains are available.
7. Add hello-world HTTP Runner and replay recipes.
8. Add PackageMirror checksum verification to the main CI example.
