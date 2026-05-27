# v2 Commit Split Map

Date: 2026-05-23

Purpose: prepare the eventual authorized commit/stage pass. This is not a commit request and no files are staged.

## Rules

- Keep repo histories separate: `qaas-docs`, nested `tools/QaaS.Docs.Generator`, source repos, and `QaaS.PackageMirror` each commit in their own repo.
- Do not stage generated build output: `site/`, `site-check/`, `bin/`, `obj/`, `_tmp/`, `graphify-out/`.
- Keep `planning/` evidence in docs commits only if reviewer context is wanted; it is not published by MkDocs.
- Re-run the relevant validation after staging and before any push.

## qaas-docs

Target branch: `feature/document-actions`.

Latest read-only classification audit after adding the PackageMirror bytecheck evidence: all current parent `qaas-docs` status paths returned `ALL_QAAS_DOCS_STATUS_PATHS_CLASSIFIED (548 status entries)`. This audit did not stage files.

Suggested order:

1. `ci(docs): add v2 validation gates`
   - `.github/workflows/docs.yml`
   - `.github/workflows/ci.yml`
   - `.githooks/pre-commit`
   - `.github/styles/`
   - `.markdownlint.json`
   - `.vale.ini`
   - `README.md`
   - `requirements.txt`
   - `tools/ci/check-*.py`
   - `tools/ci/check-*.sh`
   - `tools/ci/compile-csharp-snippets.sh`
   - `tools/ci/probe-csharp-snippet-semantics.sh`
   - `tools/ci/validate-yaml-snippets.sh`
   - `tools/ci/htmltest.yml`
   - `tools/ci/lychee.toml`
   - `tools/ci/pre-commit.sh`
   - `tools/ci/yamllint.yml`
   - `tools/ci/prepare-site-check-root.sh`

2. `feat(docs): add offline bundle and zim packaging`
   - `tools/build_llmstxt.py`
   - `tools/zim/build-zim.sh`
   - `.gitignore` changes for generated local artifacts
   - `docs/integrations/kiwix-mcp.md`

3. `docs(integrations): document ops and orchestration surfaces`
   - `docs/integrations/ci-pipeline.md`
   - `docs/integrations/configuration-defaults.md`
   - `docs/integrations/orchestrator-site.md`
   - `docs/integrations/package-mirror.md`
   - `mkdocs.yml` integration nav entries

4. `docs(catalogs): regenerate hook references with v2 contract`
   - `docs/assertions/availableAssertions/**`
   - `docs/generators/availableGenerators/**`
   - `docs/probes/availableProbes/**`
   - `docs/processors/availableProcessors/**`
   - `docs/assets/schemas/{assertions,generators,probes,processors}.schema.json`
   - `tools/docs-generator/gen-plugin-pages.mjs`
   - Related catalog nav entries in `mkdocs.yml`

5. `docs(reference): regenerate function and configuration references`
   - `docs/framework/functions/**`
   - `docs/mocker/functions/**`
   - `docs/qaas/functions/**`
   - `docs/qaas/userInterfaces/runner/configurationSections/**`
   - `docs/mocker/userInterfaces/mocker/configurationSections/**`
   - `docs/assets/schemas/runner-family-schema.json`
   - Related nav entries in `mkdocs.yml`

6. `docs(runner): update command guides and quick starts`
   - `docs/qaas/userInterfaces/runner/commands/**`
   - `docs/qaas/userInterfaces/runner/configurationResolutionPriority.md`
   - `docs/qaas/userInterfaces/runner/schema-extensions.md`
   - `docs/qaas/userInterfaces/runner/allureReport.md`
   - `docs/qaas/userInterfaces/logger.md`
   - `docs/qaas/quickStart/**`
   - `docs/qaas/advancedConcepts/**`
   - `docs/qaas/addOns/**`
   - `docs/qaas/bestPractices.md`
   - `docs/qaas/architecture.md`
   - `docs/qaas/index.md`

7. `docs(mocker): update authoring and quick-start guides`
   - `docs/mocker/authoring-guide/**`
   - `docs/mocker/quickStart/**`
   - `docs/mocker/userInterfaces/mocker/commands/**`
   - `docs/mocker/architecture.md`
   - `docs/mocker/index.md`

8. `docs(hooks): add custom authoring guides and landing polish`
   - `docs/assertions/custom-authoring-guide.md`
   - `docs/generators/custom-authoring-guide.md`
   - `docs/probes/custom-authoring-guide.md`
   - `docs/processors/custom-authoring-guide.md`
   - `docs/{assertions,generators,probes,processors}/index.md`
   - `docs/framework/index.md`
   - `docs/framework/projects/**`
   - `docs/index.md`

9. `docs(planning): record v2 verification evidence`
   - `planning/authoring-contract-v2.md`
   - `planning/v2-*.md`
   - `planning/v2-authorization-runbook.md`
   - `planning/qa-agent-master-plan.md`
   - `planning/RESUME.md`
   - Exclude deleted temporary JSON files unless a reviewer explicitly wants their deletion tracked.

## Nested Docs Generator

Repo root: `D:\QaaS\qaas-docs\tools\QaaS.Docs.Generator`.

Latest nested classification audit with untracked files expanded returned `ALL_NESTED_GENERATOR_STATUS_PATHS_CLASSIFIED (15 status entries)`. The nested repo is currently on detached `HEAD` at `1dab191`, so the authorized commit pass needs an explicit branch or commit strategy before staging the parent gitlink update.

Suggested commits:

1. `fix(generator): preserve heading and stable anchors`
   - `QaaS.Docs.Tools/Commands/UpdateHookOverviewsCommand.cs`
   - `QaaS.Docs.Tools/Infrastructure/MarkdownHeadingAnchors.cs`
   - `QaaS.Docs.Generator.Tests/Generation/GeneratedDocumentHeadingAnchorsTests.cs`

2. `feat(generator): emit v2 verification markers`
   - `Generation/GeneratedDocuments.cs`
   - `Functions/FunctionCatalogBuilder.cs`
   - `Hooks/HookReferenceRenderer.cs`
   - `Schema/ConfigurationReferenceRenderer.cs`
   - `Navigation/MkDocsNavigationRenderer.cs`
   - `QaaS.Docs.Tools/Commands/GenerateReferenceDocsCommand.cs`

3. `docs(generator): update command and hook guide source data`
   - `Cli/CliCommandGuides.cs`
   - `Cli/CliReferenceRenderer.cs`
   - `QaaS.Docs.Generator.Tests/Cli/CliReferenceRendererTests.cs`
   - `QaaS.Docs.Tools/Resources/hook-overviews.json`
   - `Snapshots/mocker-cli.json`
   - `Snapshots/runner-cli.json`

After committing inside this nested repo, stage the submodule/gitlink change from `qaas-docs`.

## Source Repos

These are separate repos and should not be bundled into the docs PR unless the chosen release process allows a coordinated multi-repo change.

Suggested grouping:

- `QaaS.Runner`: XML-doc/source-comment polish for builder/config docs.
- `QaaS.Mocker`: XML-doc/source-comment polish for execution and transaction stub builders.
- `QaaS.Framework`: XML-doc/source-comment polish for policy and data-source builders.

Do not stage `graphify-out/` unless the repo policy explicitly wants graph artifacts committed.

## QaaS.PackageMirror

Target branch should be a feature branch, not direct `master`, before commit/push.

Suggested commits:

1. `ci(packagemirror): guard generated docs and add drift check mode`
   - `.github/workflows/sync-packages.yml`

2. `build(packagemirror): refresh schema generator dependencies`
   - `QaaS.PackageMirror/QaaS.PackageMirror.csproj`
   - `QaaS.PackageMirror.FamilySchemas/QaaS.PackageMirror.FamilySchemas.csproj`
   - `QaaS.PackageMirror.Tests/QaaS.PackageMirror.Tests.csproj`

Do not stage `graphify-out/` unless graph artifacts are intentionally tracked.

## Non-Git Local State

- `C:\Users\eldar\.claude\plans\qaas-weekly-sweep.ps1` was updated to include qaas-docs build checks.
- Windows Scheduled Task `QaaS Weekly Sweep` was registered.
- These are not part of a repo commit unless the user requests exporting them.
