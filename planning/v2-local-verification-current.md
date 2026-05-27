# v2 local verification snapshot

Date: 2026-05-23

## Scope

This file records current local evidence for the QaaS docs v2 implementation plan. It is not a substitute for PR checks, merge approval, or the requested atomic commit/push steps.

## Verified locally

### Required implementation research artifacts

- Confirmed the implementation-session research artifact paths required by `C:\Users\eldar\.claude\plans\c-users-eldar-onedrive-qaas-prompt-txt-polymorphic-oasis.md` exist under `C:\Users\eldar\.claude\plans`.
- `Test-Path` returned true for `qaas-docs-structure-recipe.md`, `qaas-docs-tools-research.md`, and `qaas-docs-sync-pr-workflow.md`.
- Directory evidence on 2026-05-23:
  - `qaas-docs-structure-recipe.md`: 11,236 bytes, last written 2026-05-22 14:48:58.
  - `qaas-docs-tools-research.md`: 10,054 bytes, last written 2026-05-22 14:49:16.
  - `qaas-docs-sync-pr-workflow.md`: 7,035 bytes, last written 2026-05-22 14:47:10.
- After recording this evidence, `rg -n "[ \t]+$" planning\v2-local-verification-current.md planning\v2-completion-audit.md` returned no matches, `git diff --check -- planning\v2-local-verification-current.md planning\v2-completion-audit.md` passed, and `npx --yes markdownlint-cli2 planning/v2-local-verification-current.md planning/v2-completion-audit.md` passed with 0 errors.

### Docs generator and site

- `dotnet build .\tools\QaaS.Docs.Generator\QaaS.Docs.Generator.csproj --nologo -clp:ErrorsOnly -m:1 -nr:false` passed.
- `dotnet test .\tools\QaaS.Docs.Generator\QaaS.Docs.Generator.Tests\QaaS.Docs.Generator.Tests.csproj --nologo` passed: 7/7 tests.
- `dotnet run --project .\tools\QaaS.Docs.Generator\QaaS.Docs.Tools\QaaS.Docs.Tools.csproj -- generate-reference-docs --skip-cli-snapshot-refresh --check --build-site` passed.
- `mkdocs build --strict --site-dir site` passed after heading anchors were converted to the macro-safe `{: #anchor}` form.

### Content gates

- `bash tools/ci/check-frontmatter.sh` passed.
- `python tools/ci/check-catalog-coverage.py` passed: 72 generated hook catalog entries had schema entries, overview/table/YAML pages, family index links, MkDocs nav entries, and verification markers.
- `python tools/ci/check-reference-skeleton.py` passed: 435 reference pages had a `> TL;DR` blockquote before the first H2, canonical v2 skeleton headings in order when present, and `## See also` as the final H2.
- `python tools/ci/check-page-headings.py` passed: 482 authored Markdown pages had exactly one real page H1 outside fenced examples, and 72 hook overview H1s matched their hook names.
- `python tools/ci/check-example-density.py` passed: 148 high-value hook pages had the required example sections, hook overviews had minimal YAML examples, YAML scaffold pages had YAML blocks, and custom hook guides had both YAML and C# blocks.
- `python tools/ci/check-nav-structure.py` passed: top-level MkDocs nav matched the approved v2 section list, 486 nav page targets existed, and every non-generated Markdown page was listed in navigation.
- `python tools/ci/check-offline-readiness.py` passed: 482 authored Markdown pages had no remote Markdown images, remote HTML images, runtime embed tags, absolute docs self-links, file URLs, or root-relative Markdown links outside fenced examples.
- `python tools/ci/check-heading-anchors.py` passed: 3242 H2/H3 headings had explicit anchors.
- `D:\QaaS\_tmp\qaas-docs-vale\vale-3.14.2\vale.exe docs` passed: 0 errors, 0 warnings, 0 suggestions across 486 files.
- Repository forbidden-term scan over `docs`, `tools`, `mkdocs.yml`, `requirements.txt`, and `.github` passed with no matches, excluding generated docs and build outputs.
- `npx --yes markdownlint-cli2 "docs/**/*.md" "#docs/_generated/**"` passed: 482 files, 0 errors.
- `bash tools/ci/validate-yaml-snippets.sh` passed: 273 YAML blocks.
- `bash tools/ci/compile-csharp-snippets.sh` passed: 79 C# snippets.
- `rg -n '\b(internal|private|protected)\s+(class|sealed|record|interface|struct|enum)\b' docs ...` returned no matches outside excluded generated/build outputs.

### Regenerated overview source spot-check

- Ran a reproducible 15-page spot-check over regenerated hook `overview.md` pages by SHA256-sorting repo-relative paths under `availableAssertions`, `availableGenerators`, `availableProbes`, and `availableProcessors`.
- For each sampled page, verified the `Verified-against` source path exists, the page H1 appears in the cited source type declaration or hook symbol, the minimal YAML uses the same hook name under the expected family key, and sibling `configuration/tableView.md` plus `configuration/yamlView.md` pages exist.
- Sampled pages passed:
  - `docs\probes\availableProbes\DeleteRabbitMqQueues\overview.md` -> `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DeleteRabbitMqQueues.cs`.
  - `docs\probes\availableProbes\CreateRabbitMqVirtualHosts\overview.md` -> `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqVirtualHosts.cs`.
  - `docs\processors\availableProcessors\RequestEchoProcessor\overview.md` -> `QaaS.Common.Processors\QaaS.Common.Processors\RequestEchoProcessor.cs`.
  - `docs\probes\availableProbes\OsUpdateDeploymentImage\overview.md` -> `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsUpdateDeploymentImage.cs`.
  - `docs\probes\availableProbes\CreateRabbitMqUsers\overview.md` -> `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqUsers.cs`.
  - `docs\probes\availableProbes\OsUpdateStatefulSetImage\overview.md` -> `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsUpdateStatefulSetImage.cs`.
  - `docs\assertions\availableAssertions\OutputDeserializableTo\overview.md` -> `QaaS.Common.Assertions\QaaS.Common.Assertions\DeserializationLogic\OutputDeserializableTo.cs`.
  - `docs\assertions\availableAssertions\HermeticByExpectedOutputCount\overview.md` -> `QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\HermeticByExpectedOutputCount.cs`.
  - `docs\probes\availableProbes\CreateRabbitMqQueues\overview.md` -> `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\CreateRabbitMqQueues.cs`.
  - `docs\probes\availableProbes\OsExecuteCommandsInContainers\overview.md` -> `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsExecuteCommandsInContainers.cs`.
  - `docs\probes\availableProbes\EmptyMongoDbCollection\overview.md` -> `QaaS.Common.Probes\QaaS.Common.Probes\MongoDbProbes\EmptyMongoDbCollection.cs`.
  - `docs\generators\availableGenerators\FromLettuceDataSources\overview.md` -> `QaaS.Common.Generators\QaaS.Common.Generators\FromDataSourcesGenerators\FromLettuceDataSources.cs`.
  - `docs\probes\availableProbes\CreateS3Bucket\overview.md` -> `QaaS.Common.Probes\QaaS.Common.Probes\S3Probes\CreateS3Bucket.cs`.
  - `docs\probes\availableProbes\DownloadRabbitMqDefinitions\overview.md` -> `QaaS.Common.Probes\QaaS.Common.Probes\RabbitMqProbes\DownloadRabbitMqDefinitions.cs`.
  - `docs\probes\availableProbes\OsRestartPods\overview.md` -> `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsRestartPods.cs`.

### Phase A current rerun

- Re-read `planning/authoring-contract-v2.md`; it explicitly replaces the earlier frontmatter contract, removes `ai_summary` in favor of `summary`, and moves reviewer-only coverage artifacts out of `docs/_meta/` into `planning/`.
- Re-ran the plan's current forbidden-content sweeps:
  - `rg -n -i "\b(agent|ai|llm|claude|gpt|copilot)\b" docs` returned no matches.
  - `rg -n "\b(internal|private|protected)\s+(class|sealed|record|interface|struct|enum)\b" docs` returned no matches.
  - `rg -n "ai_summary|docs/_meta|docs\\_meta" docs tools .github mkdocs.yml requirements.txt .markdownlint.json .vale.ini` returned no matches.
- Re-ran the deterministic 15-page SHA256-sorted source spot-check over hook overview pages. The sampled pages all had a `Verified-against` marker, an existing source file, a matching source type for the H1, and sibling `configuration/tableView.md` plus `configuration/yamlView.md` pages.
- Sampled pages in the rerun:
  - `docs\probes\availableProbes\DeleteRabbitMqQueues\overview.md`.
  - `docs\probes\availableProbes\CreateRabbitMqVirtualHosts\overview.md`.
  - `docs\processors\availableProcessors\RequestEchoProcessor\overview.md`.
  - `docs\probes\availableProbes\OsUpdateDeploymentImage\overview.md`.
  - `docs\probes\availableProbes\CreateRabbitMqUsers\overview.md`.
  - `docs\probes\availableProbes\OsUpdateStatefulSetImage\overview.md`.
  - `docs\assertions\availableAssertions\OutputDeserializableTo\overview.md`.
  - `docs\assertions\availableAssertions\HermeticByExpectedOutputCount\overview.md`.
  - `docs\probes\availableProbes\CreateRabbitMqQueues\overview.md`.
  - `docs\probes\availableProbes\OsExecuteCommandsInContainers\overview.md`.
  - `docs\probes\availableProbes\EmptyMongoDbCollection\overview.md`.
  - `docs\generators\availableGenerators\FromLettuceDataSources\overview.md`.
  - `docs\probes\availableProbes\CreateS3Bucket\overview.md`.
  - `docs\probes\availableProbes\DownloadRabbitMqDefinitions\overview.md`.
  - `docs\probes\availableProbes\OsRestartPods\overview.md`.
- Re-ran the read-only parent-repo staging classification against `planning/v2-commit-split-map.md`; all 548 current `qaas-docs` status entries were classified without staging files. `README.md` is explicitly assigned to `ci(docs): add v2 validation gates` because its diff documents the tracked pre-commit hook.
- Re-ran the read-only nested docs-generator staging classification; all 15 current `tools/QaaS.Docs.Generator` status entries were classified into the three proposed generator commits. The nested repo is on detached `HEAD` at `1dab191`, so an authorized commit pass must choose the branch/commit handling before staging the parent gitlink update.

### CI workflow gate alignment

- `.github/workflows/docs.yml` now installs the MkDocs stack from `requirements.txt`, so CI uses the same dependency contract as local builds, including `mkdocs-macros-plugin`.
- `.github/workflows/docs.yml` now runs on `feature/document-actions` and `master` pushes and on pull requests targeting `master`, matching the current remote HEAD branch and PR #43 base branch.
- `.github/workflows/docs.yml` now installs Python dependencies in the `build-zim` job before invoking `tools/zim/build-zim.sh`, so the standalone ZIM packager can regenerate and validate the custom sharded llms bundle after the site artifact is downloaded.
- `.github/workflows/ci.yml` now uses `mkdocs build --strict --site-dir site` for its legacy build-site job, so both docs workflows use strict MkDocs builds.
- `mkdocs.yml` now sets `strict: true`, so a plain `mkdocs build --site-dir site` runs with strict mode enabled.
- MkDocs 1.6.1 accepts only `warn`, `info`, or `ignore` for the built-in `validation.nav.*` and `validation.links.*` options, so the config keeps supported `warn` values while the explicit CI gates provide hard failures for nav coverage, heading anchors, offline/self-link readiness, htmltest, and lychee.
- The workflow includes the current plan gates: frontmatter, catalog coverage, reference skeleton, page headings, example density, navigation structure, offline readiness, heading anchors, Vale, markdownlint, yamllint, `mkdocs build --strict`, llms bundle generation and validation, htmltest, lychee, YAML snippet validation, C# snippet compilation, ZIM build/smoke, artifact upload, and PR preview deployment.
- Added an explicit `lychee --offline` workflow gate after the rendered-site htmltest step so CI covers the plan-required offline relative-link mode in addition to the existing external-plus-relative lychee pass.
- `D:\QaaS\_tmp\qaas-docs-link-tools\lychee-v0.24.2\lychee-x86_64-pc-windows-msvc\lychee.exe --offline --config tools\ci\lychee.toml --root-dir "$PWD\site-check" "site-check/**/*.html"` passed locally after the workflow update: 266041 total links, 5726 unique links, 0 errors, 2481 excluded.
- `yamllint -c tools\ci\yamllint.yml .github\workflows\docs.yml` passed after the offline lychee workflow step was added.
- `git diff --check -- .github\workflows\docs.yml` passed after the offline lychee workflow step was added, with a CRLF normalization warning for `.github/workflows/docs.yml`.
- Added a tracked pre-commit entry point at `.githooks/pre-commit` that delegates to `tools/ci/pre-commit.sh`; the script runs markdownlint, strict MkDocs build, llms bundle validation, `site-check` preparation, and `lychee --offline`.
- `bash -n .githooks/pre-commit` and `bash -n tools/ci/pre-commit.sh` passed.
- `bash tools/ci/pre-commit.sh` passed: markdownlint checked 485 docs with 0 errors; strict MkDocs build passed; `python tools/build_llmstxt.py --site-dir site` produced 485 pages and 5 shards; `bash tools/ci/check-llmstxt.sh site` passed; `bash tools/ci/prepare-site-check-root.sh site site-check qaas-docs` passed; offline lychee passed with 266041 total links, 5726 unique links, 0 errors, and 2481 excluded.
- Local Git hook activation is set for this repository: `git config --local --get core.hooksPath` returns `.githooks`.
- The reference skeleton gate now enforces v2 body-section order for every `type: reference` page, not only the presence of TL;DR and See-also sections.
- `yamllint -c tools/ci/yamllint.yml .github/workflows/ci.yml .github/workflows/docs.yml` passed.
- `yamllint -c tools/ci/yamllint.yml .github/workflows/docs.yml` passed after the catalog coverage workflow step was added.
- `mkdocs build --strict --site-dir site` passed after the workflow dependency patch.
- `mkdocs build --strict --site-dir site` passed after the catalog coverage gate was added.
- `git diff --check -- .github/workflows/ci.yml .github/workflows/docs.yml planning/v2-local-verification-current.md` passed with CRLF normalization warnings only.
- `git diff --check -- .github\workflows\docs.yml tools\ci\check-catalog-coverage.py planning\v2-local-verification-current.md` passed after the catalog coverage gate was added, with a CRLF normalization warning for `.github/workflows/docs.yml`.
- `graphify update D:\QaaS\qaas-docs` passed after the catalog coverage gate: 8408 nodes, 11999 edges, 535 communities.
- `python -m py_compile tools\ci\check-reference-skeleton.py` passed after the v2 body-order enhancement.
- `rg -n "[ \t]+$" tools\ci\check-reference-skeleton.py planning\v2-local-verification-current.md` returned no matches.
- `graphify update D:\QaaS\qaas-docs` passed after the reference skeleton gate enhancement: 8411 nodes, 12004 edges, 532 communities.
- `python -m py_compile tools\ci\check-example-density.py tools\ci\check-reference-skeleton.py` passed after the example-density gate was added.
- `yamllint -c tools\ci\yamllint.yml .github\workflows\docs.yml` passed after the example-density workflow step was added.
- `rg -n "[ \t]+$" tools\ci\check-example-density.py tools\ci\check-reference-skeleton.py planning\v2-local-verification-current.md .github\workflows\docs.yml` returned no matches.
- `mkdocs build --strict --site-dir site` passed after the example-density gate was added.
- `git diff --check -- .github\workflows\docs.yml` passed after the example-density workflow step was added, with a CRLF normalization warning.
- `graphify update D:\QaaS\qaas-docs` passed after the example-density gate: 8420 nodes, 12026 edges, 532 communities.
- `python -m py_compile tools\ci\check-nav-structure.py` passed.
- `yamllint -c tools\ci\yamllint.yml .github\workflows\docs.yml` passed after the navigation structure workflow step was added.
- `rg -n "[ \t]+$" tools\ci\check-nav-structure.py .github\workflows\docs.yml` returned no matches.
- `mkdocs build --strict --site-dir site` passed after the navigation structure gate was added.
- `git diff --check -- .github\workflows\docs.yml` passed after the navigation structure workflow step was added, with a CRLF normalization warning.
- `graphify update D:\QaaS\qaas-docs` passed after the navigation structure gate: 8429 nodes, 12040 edges, 535 communities.
- `bash -n tools/ci/check-llmstxt.sh` passed after shard-index validation was added.
- `python -m py_compile tools\build_llmstxt.py` passed.
- `rg -n "[ \t]+$" tools\ci\check-llmstxt.sh tools\build_llmstxt.py planning\v2-local-verification-current.md` returned no matches.
- Repository forbidden-term scan over `docs`, `tools`, `mkdocs.yml`, `requirements.txt`, and `.github` passed with no matches after the llms validator enhancement.
- `graphify update D:\QaaS\qaas-docs` passed after the llms validator enhancement: 8429 nodes, 12040 edges, 532 communities.
- `yamllint -c tools\ci\yamllint.yml .github\workflows\docs.yml` passed after the ZIM job Python dependency setup was added.
- `bash -n tools/zim/build-zim.sh tools/ci/check-llmstxt.sh` passed after the ZIM packager was updated to build and validate llms shards.
- `git diff --check -- .github\workflows\docs.yml tools\zim\build-zim.sh` passed after the ZIM packager update, with CRLF normalization warnings.
- `graphify update D:\QaaS\qaas-docs` passed after the ZIM packager update: 8429 nodes, 12040 edges, 534 communities.
- `python -m py_compile tools\ci\check-offline-readiness.py` passed.
- `yamllint -c tools\ci\yamllint.yml .github\workflows\docs.yml` passed after the offline-readiness workflow step was added.
- `rg -n "[ \t]+$" tools\ci\check-offline-readiness.py .github\workflows\docs.yml planning\v2-local-verification-current.md` returned no matches.
- `git diff --check -- .github\workflows\docs.yml tools\ci\check-offline-readiness.py` passed after the offline-readiness workflow step was added, with a CRLF normalization warning for `.github/workflows/docs.yml`.
- `mkdocs build --strict --site-dir site` passed after the offline-readiness gate was added.
- `graphify update D:\QaaS\qaas-docs` passed after the offline-readiness gate: 8433 nodes, 12045 edges, 537 communities.
- `mkdocs build --site-dir site` passed after `strict: true` was added to `mkdocs.yml`.
- `mkdocs build --strict --site-dir site` passed after `strict: true` was added to `mkdocs.yml`.
- `yamllint -c tools\ci\yamllint.yml mkdocs.yml .github\workflows\docs.yml` passed after the MkDocs strict-config update.
- `rg -n "^strict:\s*true|not_found: warn|anchors: warn|absolute_links: warn|unrecognized_links: warn" mkdocs.yml` confirmed the strict flag is present and validation options remain in the MkDocs-supported value set.
- `python tools\build_llmstxt.py --site-dir site; bash tools/ci/check-llmstxt.sh site` passed after the MkDocs strict-config update.
- `git diff --check -- mkdocs.yml planning\v2-local-verification-current.md` passed after the MkDocs strict-config update, with a CRLF normalization warning for `mkdocs.yml`.
- `rg -n "[ \t]+$" mkdocs.yml planning\v2-local-verification-current.md` returned no matches.
- `graphify update D:\QaaS\qaas-docs` passed after the MkDocs strict-config update: 8433 nodes, 12045 edges, 537 communities.
- `python -m py_compile tools\ci\check-page-headings.py` passed.
- `yamllint -c tools\ci\yamllint.yml .github\workflows\docs.yml` passed after the page-heading workflow step was added.
- `rg -n "[ \t]+$" tools\ci\check-page-headings.py docs\integrations\kiwix-mcp.md .github\workflows\docs.yml planning\v2-local-verification-current.md` returned no matches.
- `git diff --check -- .github\workflows\docs.yml docs\integrations\kiwix-mcp.md tools\ci\check-page-headings.py` passed after the page-heading gate was added, with CRLF normalization warnings for the modified tracked files.
- `mkdocs build --strict --site-dir site` passed after adding the missing `# Kiwix MCP` H1 and the page-heading gate.
- `python tools\build_llmstxt.py --site-dir site; bash tools/ci/check-llmstxt.sh site` passed after adding the missing Kiwix page H1.
- `graphify update D:\QaaS\qaas-docs` passed after the page-heading gate: 8441 nodes, 12066 edges, 535 communities.

### PackageMirror alignment

- Rechecked `D:\QaaS\QaaS.PackageMirror\.github\workflows\sync-packages.yml` against the current qaas-docs tree.
- The workflow checks out `TheSmokeTeam/qaas-docs@master`, installs `qaas-docs\requirements.txt`, invokes `qaas-docs\tools\QaaS.Docs.Generator\QaaS.Docs.Tools\QaaS.Docs.Tools.csproj`, and opens generated docs PRs against `master`, matching the current repository branch layout.
- The PackageMirror v2 guard still rejects `qaas-docs/docs/_meta/` and `ai_summary:` frontmatter after regeneration.
- `yamllint -c D:\QaaS\qaas-docs\tools\ci\yamllint.yml .github\workflows\sync-packages.yml` passed in `D:\QaaS\QaaS.PackageMirror`.
- Local guard simulation against `D:\QaaS\qaas-docs\docs` passed: no `docs/_meta` directory and no `ai_summary:` frontmatter.
- `git diff --check -- .github\workflows\sync-packages.yml` passed with CRLF normalization warnings only.
- Current local PackageMirror validation was rerun after the final docs audit:
  - `dotnet build .\QaaS.PackageMirror.sln --nologo -clp:ErrorsOnly -m:1 -nr:false` passed: 0 errors, 144 warnings.
  - `dotnet test .\QaaS.PackageMirror.sln --nologo --no-build -m:1 -nr:false` passed: 15 tests.
  - `yamllint -c D:\QaaS\qaas-docs\tools\ci\yamllint.yml .github\workflows\sync-packages.yml` passed.
  - `git diff --check -- .github\workflows\sync-packages.yml QaaS.PackageMirror\QaaS.PackageMirror.csproj QaaS.PackageMirror.FamilySchemas\QaaS.PackageMirror.FamilySchemas.csproj QaaS.PackageMirror.Tests\QaaS.PackageMirror.Tests.csproj` passed with CRLF normalization warnings only.
  - Guard simulation against `D:\QaaS\qaas-docs\docs` passed: no `docs/_meta` directory and no `ai_summary:` frontmatter.
  - `graphify update D:\QaaS\QaaS.PackageMirror` passed: 2967 nodes, 4111 edges, 364 communities.
- Refreshed local PackageMirror validation after the docs-generator regeneration:
  - `dotnet restore QaaS.PackageMirror.sln --nologo` passed with NU1801 warnings for enabled but missing local NuGet sources: `D:\QaaS\LocalValidation\Framework125`, `D:\QaaS\LocalFeed\QaaS.Framework.1.2.3-alpha.1`, and `D:\QaaS\local-feed\framework-1.2.0-alpha.14`.
  - `dotnet build QaaS.PackageMirror.sln --nologo -clp:ErrorsOnly -m:1 -nr:false` passed: 0 errors, 144 warnings.
  - `dotnet test QaaS.PackageMirror.sln --nologo --no-build -m:1 -nr:false` passed: 15 tests.
  - `dotnet list QaaS.PackageMirror.sln package --outdated` reported no package updates for the PackageMirror projects given the current sources.
  - `dotnet nuget list source` showed `nuget.org` plus the three enabled missing local sources above.
  - `yamllint -c D:\QaaS\qaas-docs\tools\ci\yamllint.yml .github\workflows\sync-packages.yml` passed.
  - Guard simulation against `D:\QaaS\qaas-docs\docs` passed: no `docs/_meta` directory and no `ai_summary:` frontmatter.
  - `git diff --check -- .github\workflows\sync-packages.yml QaaS.PackageMirror\QaaS.PackageMirror.csproj QaaS.PackageMirror.FamilySchemas\QaaS.PackageMirror.FamilySchemas.csproj QaaS.PackageMirror.Tests\QaaS.PackageMirror.Tests.csproj` passed with CRLF normalization warnings only.
  - Trailing-whitespace scan over the changed PackageMirror workflow and project files returned no matches.
  - `graphify update D:\QaaS\QaaS.PackageMirror` passed: 3787 nodes, 5079 edges, 430 communities.
- Added a PackageMirror `workflow_dispatch` check-only path for byte-identical docs drift proof:
  - `.github/workflows/sync-packages.yml` now has `docs_drift_check_only`, enables the docs-sync path when it is true, appends `--check` to `generate-reference-docs`, skips docs commit/PR creation, skips mirror-content commits, and skips mirror release publishing in check-only mode.
  - `yamllint -c D:\QaaS\qaas-docs\tools\ci\yamllint.yml .github\workflows\sync-packages.yml` passed.
  - `python -c "import pathlib, yaml; yaml.safe_load(...)"` parsed the workflow.
  - PowerShell parser validation accepted the regenerated docs script block.
  - `git diff --check -- .github\workflows\sync-packages.yml` passed with CRLF normalization warnings only.
  - `dotnet build .\QaaS.PackageMirror.sln -c Release --nologo -clp:ErrorsOnly` passed: 0 errors, 144 warnings.
  - `dotnet test .\QaaS.PackageMirror.sln -c Release --nologo --no-build -clp:ErrorsOnly` passed: 15 tests in Release.
  - `graphify update D:\QaaS\QaaS.PackageMirror` passed: 182/182 files extracted, no code-graph topology changes detected, outputs left untouched.
  - Downloaded temporary `actionlint` 1.7.12 from the official `rhysd/actionlint` GitHub release into `D:\QaaS\_tmp\actionlint-20260523`.
  - `D:\QaaS\_tmp\actionlint-20260523\actionlint.exe -color=false .github/workflows/sync-packages.yml` passed with no findings.
- Tightened `docs_drift_check_only` again after reviewing the full workflow side effects:
  - `Commit updated mirror contents` now skips when `docs_drift_check_only` is true.
  - `Publish mirror release` now skips when `docs_drift_check_only` is true, even if the `publish_release` dispatch input is left at its default `true`.
  - Re-ran `actionlint`, `yamllint`, PyYAML parsing, PowerShell parser validation for the docs regeneration block, `git diff --check`, and the trailing-whitespace scan after this change; all passed.
  - Re-ran `dotnet build .\QaaS.PackageMirror.sln -c Release --nologo -clp:ErrorsOnly`: passed with 0 errors and 144 warnings.
  - Re-ran `dotnet test .\QaaS.PackageMirror.sln -c Release --nologo --no-build -clp:ErrorsOnly`: passed 15 tests in Release.
  - Re-ran `graphify update D:\QaaS\QaaS.PackageMirror`: passed with no code-graph topology changes.

### Ultrareview follow-up

- Rechecked the named P1 findings from `planning/v2-ultrareview-plan.md` against the current tree.
- The stale Runner `execute` example was still real: `QaaS.Runner\QaaS.Runner\ConfigurationObjects\CommandConfig.cs` only exposes `Command` and `Id`, while `docs/qaas/userInterfaces/runner/commands/execute.md` still showed `Parallel: false`.
- Removed the stale `Parallel` YAML key from the generated execute command guide and from `tools/QaaS.Docs.Generator/Cli/CliCommandGuides.cs`. The page now states that each entry accepts `Command` and `Id`, and that list order is the execution order.
- `csharpier check .\Cli\CliCommandGuides.cs` passed in the nested generator repo.
- `git diff --check` passed in both `qaas-docs` and `tools/QaaS.Docs.Generator`; both runs only emitted CRLF normalization warnings.
- `rg -n 'Parallel: false' docs tools/QaaS.Docs.Generator ...` returned no matches outside excluded build/generated outputs.
- The older `ProblemDetailsProcessor` conflict was not reproducible in the current tree: the processor overview and generated table point to `QaaS.Common.Processors\QaaS.Common.Processors\ProblemDetailsProcessor.cs` / `processors.schema.json`, and the table fields match `ProblemDetailsConfiguration`.
- The older catalog structural findings are covered by the current generated pages plus gates: `Verified-against` comments are present, reference pages have TL;DR and See-also sections, and the forbidden-term scan has no matches outside planning notes.
- `graphify update D:\QaaS\qaas-docs` passed after the execute-command follow-up: 8390 nodes, 11968 edges, 529 communities.

### Cookbook fold follow-up

- Rechecked `planning/v2-cookbook-fold-plan.md` against the current docs tree.
- `docs/cookbooks/` is absent, as required by the v2 contract.
- The KEEP-as-leaf cookbook destinations exist and are wired in `mkdocs.yml`: `docs/mocker/authoring-guide/multi-server-routing.md`, `docs/qaas/userInterfaces/runner/schema-extensions.md`, and `docs/integrations/ci-pipeline.md`.
- `docs/integrations/kiwix-mcp.md` now has a real page H1 (`# Kiwix MCP`) before the TL;DR block, matching the page-heading contract used by the rest of the authored docs.
- The custom-authoring guide folds are present as realistic examples in `docs/assertions/custom-authoring-guide.md`, `docs/generators/custom-authoring-guide.md`, `docs/probes/custom-authoring-guide.md`, and `docs/processors/custom-authoring-guide.md`.
- Added the missing parallelism fold to `docs/qaas/userInterfaces/runner/commands/run.md` through the generator template. It documents that `run` has no parallelism CLI flag and that publisher parallel sends are configured with `Sessions[].Publishers[].Parallel.Parallelism`, backed by `QaaS.Runner.Sessions\ConfigurationObjects\Parallel.cs` and `PublisherBuilder.WithParallelism(int)`.
- `graphify update D:\QaaS\qaas-docs` passed after the cookbook-fold follow-up: 8394 nodes, 11976 edges, 536 communities.

### Source-fidelity marker gate

- Added `tools/ci/check-verification-markers.py` and wired it into `.github/workflows/docs.yml` after catalog coverage.
- The gate covers source-derived reference pages only: hook catalog triplets, generated function pages except function index landings, and generated configuration-section table/YAML views.
- The gate also checks local marker paths when the sibling QaaS repositories are present in the workspace; CI skips path existence when the source repo directory is not checked out.
- Updated `GeneratedDocumentWriter` so generated documents can supply verification sources that are inserted after frontmatter and replace stale preserved marker comments without duplicating them on later regenerations.
- Updated function reference rendering to emit `Verified-against` markers from each page's source files, including focused section pages generated from function categories.
- Updated schema reference rendering to emit `Verified-against` markers for the PackageMirror family schema and docs manifest used by generated table/YAML views.
- Added explicit source markers to `docs\qaas\userInterfaces\runner\schema-extensions.md` for `JsonSchemaAttribute`, `AnyOfSchemaOption`, the schema generator entrypoint, and the schema generator tools entrypoint.
- Validated the schema extensions marker update:
  - `npx --yes markdownlint-cli2 docs/qaas/userInterfaces/runner/schema-extensions.md` passed with 0 errors.
  - `bash tools/ci/check-frontmatter.sh` passed.
  - `python tools/ci/check-page-headings.py` passed: 485 pages.
  - `python tools/ci/check-offline-readiness.py` passed: 485 pages.
  - `python tools/ci/check-verification-markers.py` passed: 399 source-derived reference pages.
  - Focused forbidden-term and public-surface scans over `docs\qaas\userInterfaces\runner\schema-extensions.md` returned no matches.
  - `python tools/ci/check-heading-anchors.py` passed: 3324 headings.
  - `mkdocs build --strict --site-dir site` passed with only the existing Material for MkDocs 2.0 notice.
  - `python tools/build_llmstxt.py --site-dir site` passed: 485 pages, 5 shards.
  - `bash tools/ci/check-llmstxt.sh site` passed.
- Regenerated reference docs after the marker changes; authored-page marker coverage is now 399 pages with `Verified-against` comments out of 482 authored pages.
- `dotnet build .\tools\QaaS.Docs.Generator\QaaS.Docs.Generator.csproj --nologo -clp:ErrorsOnly -m:1 -nr:false` passed: 0 warnings, 0 errors.
- `dotnet test .\tools\QaaS.Docs.Generator\QaaS.Docs.Generator.Tests\QaaS.Docs.Generator.Tests.csproj --nologo -m:1 -nr:false` passed: 9 tests.
- `dotnet run --project .\tools\QaaS.Docs.Generator\QaaS.Docs.Tools\QaaS.Docs.Tools.csproj -- generate-reference-docs --skip-cli-snapshot-refresh --check --build-site` passed.
- `python tools\ci\check-verification-markers.py` passed: 399 source-derived reference pages.
- `python -m py_compile tools\ci\check-verification-markers.py` passed.
- `csharpier check` passed for the changed generator C# files and generator tests.
- `yamllint -c tools\ci\yamllint.yml mkdocs.yml mkdocs.yml.fragments/ .github\workflows\docs.yml` passed.
- `bash tools/ci/check-frontmatter.sh` passed.
- `python tools\ci\check-catalog-coverage.py` passed: 72 hooks.
- `python tools\ci\check-reference-skeleton.py` passed: 435 reference pages.
- `python tools\ci\check-page-headings.py` passed: 482 pages.
- `python tools\ci\check-example-density.py` passed: 148 pages.
- `python tools\ci\check-nav-structure.py` passed: 486 nav pages.
- `python tools\ci\check-offline-readiness.py` passed: 482 pages.
- `python tools\ci\check-heading-anchors.py` passed: 3242 headings.
- `mkdocs build --strict --site-dir site` passed.
- `npx --yes markdownlint-cli2 "docs/**/*.md" "#docs/_generated/**"` passed: 482 files, 0 errors.
- `python tools\build_llmstxt.py --site-dir site; bash tools/ci/check-llmstxt.sh site` passed: 482 pages, 5 shards.
- `bash tools/ci/validate-yaml-snippets.sh` passed with a longer local timeout: 273 YAML blocks.
- `bash tools/ci/compile-csharp-snippets.sh` passed: 79 C# snippets.
- `D:\QaaS\_tmp\qaas-docs-vale\vale-3.14.2\vale.exe docs` passed: 0 errors, 0 warnings, 0 suggestions in 486 files.
- Corrected forbidden-term scan over `docs`, `tools`, `mkdocs.yml`, `requirements.txt`, and `.github` passed with no matches after constructing split legacy literals in PowerShell variables.
- Internal/private/protected API leak scan over authored docs passed with no matches.
- `rg -n "[ \t]+$" ...` over the changed CI/generator/evidence files returned no matches.
- `git diff --check -- .github\workflows\docs.yml tools\ci\check-verification-markers.py tools\QaaS.Docs.Generator\Generation\GeneratedDocuments.cs tools\QaaS.Docs.Generator\Functions\FunctionCatalogBuilder.cs tools\QaaS.Docs.Generator\Schema\ConfigurationReferenceRenderer.cs tools\QaaS.Docs.Generator\Navigation\MkDocsNavigationRenderer.cs tools\QaaS.Docs.Generator\QaaS.Docs.Generator.Tests\Generation\GeneratedDocumentHeadingAnchorsTests.cs docs\qaas\functions docs\mocker\functions docs\framework\functions docs\qaas\userInterfaces\runner\configurationSections docs\mocker\userInterfaces\mocker\configurationSections` passed with only the existing CRLF normalization warning for `.github/workflows/docs.yml`.
- `graphify update D:\QaaS\qaas-docs` passed after the verification-marker gate: 8466 nodes, 12112 edges, 535 communities.

### Ops integration coverage

- Audited current docs for plan-required ops surfaces. The generated hook/catalog/function coverage was present, but no authored PackageMirror or QaaS.Configuration integration page existed under `docs/integrations/`.
- Added `docs/integrations/package-mirror.md` with `Verified-against` markers for `QaaS.PackageMirror\README.md`, `QaaS.PackageMirror\QaaS.PackageMirror.Tools\README.md`, and `QaaS.PackageMirror\QaaS.PackageMirror.Tools\Program.cs`.
- The PackageMirror page documents `generate-family-schemas`, `publish-mirror-release --skip-publish`, and `sync-restored-packages --github-token`, plus the produced package and schema artifact paths.
- Added `docs/integrations/configuration-defaults.md` with `Verified-against` markers for the current `QaaS.Configuration` README, defaults classes, bootstrap class, and tool entrypoint.
- The configuration page documents the current rename from `QaaS.ElasticBootstrap` to `QaaS.Configuration`, fallback value priority, the `ConfigurationBootstrap.Register()` path, and the package rebuild/push flow.
- Wired both pages into the existing Integrations nav without adding a new top-level section.
- `bash tools/ci/check-frontmatter.sh` passed after adding the pages.
- `python tools\ci\check-page-headings.py` passed: 484 pages.
- `python tools\ci\check-nav-structure.py` passed: 488 nav pages.
- `python tools\ci\check-heading-anchors.py` passed: 3255 headings.
- `python tools\ci\check-offline-readiness.py` passed: 484 pages.
- `yamllint -c tools\ci\yamllint.yml mkdocs.yml` passed.
- `mkdocs build --strict --site-dir site` passed after the integration pages were added.
- `npx --yes markdownlint-cli2 "docs/**/*.md" "#docs/_generated/**"` passed: 484 files, 0 errors.
- `bash tools/ci/validate-yaml-snippets.sh` passed: 275 YAML blocks.
- `bash tools/ci/compile-csharp-snippets.sh` passed: 80 C# snippets.
- Corrected forbidden-term scan over `docs`, `tools`, `mkdocs.yml`, `requirements.txt`, and `.github` passed with no matches after the integration pages were added.
- `python tools\build_llmstxt.py --site-dir site; bash tools/ci/check-llmstxt.sh site` passed after the page-count change: 484 pages, 5 shards.
- `D:\QaaS\_tmp\qaas-docs-vale\vale-3.14.2\vale.exe docs` passed: 0 errors, 0 warnings, 0 suggestions in 488 files.
- `rg -n "[ \t]+$" docs\integrations\package-mirror.md docs\integrations\configuration-defaults.md mkdocs.yml planning\v2-local-verification-current.md` returned no matches.
- `git diff --check -- docs\integrations\package-mirror.md docs\integrations\configuration-defaults.md mkdocs.yml` passed with only the existing CRLF normalization warning for `mkdocs.yml`.
- `graphify update D:\QaaS\qaas-docs` passed after adding the ops integration pages: 8492 nodes, 12136 edges, 540 communities.

### Orchestrator site coverage

- Audited `D:\QaaS\qaas-orchestrator` with its graph server and direct source reads. The graph was present, but the broad graph query returned only a UI node, so source files were used as the authority.
- The repository is currently a Vite/React single-page web entry point with `package.json` scripts for `dev`, `build`, `build:dev`, `lint`, `preview`, `test`, and `test:watch`.
- `src\App.tsx` defines only the `/` landing route and a catch-all not-found route; no Runner YAML schema, Mocker YAML schema, service API, or PackageMirror artifact flow was found in current source.
- Added `docs/integrations/orchestrator-site.md` with `Verified-against` markers for `qaas-orchestrator\package.json`, `vite.config.ts`, `src\App.tsx`, `src\pages\Index.tsx`, `src\pages\NotFound.tsx`, and the landing components that back the documented site surface.
- Wired the page into the existing Integrations nav as a leaf: `Orchestrator Site: integrations/orchestrator-site.md`.
- `bash tools/ci/check-frontmatter.sh` passed after adding the page.
- `python tools\ci\check-page-headings.py` passed: 485 pages.
- `python tools\ci\check-nav-structure.py` passed: 489 nav pages.
- `python tools\ci\check-heading-anchors.py` passed: 3262 headings.
- `python tools\ci\check-offline-readiness.py` passed: 485 pages after replacing an absolute docs self-link with a relative docs link.
- `npx --yes markdownlint-cli2 "docs/**/*.md" "#docs/_generated/**"` passed: 485 files, 0 errors.
- `yamllint -c tools\ci\yamllint.yml mkdocs.yml` passed.
- `python tools\ci\check-catalog-coverage.py` passed: 72 hooks.
- `python tools\ci\check-reference-skeleton.py` passed: 435 reference pages.
- `python tools\ci\check-example-density.py` passed: 148 pages.
- `bash tools/ci/validate-yaml-snippets.sh` passed: 275 YAML blocks.
- `bash tools/ci/compile-csharp-snippets.sh` passed: 80 C# snippets.
- `mkdocs build --strict --site-dir site` passed after correcting the Runner and Mocker configuration-section links to their actual `configurationSections.md` targets.
- `python tools\build_llmstxt.py --site-dir site` passed: 485 pages, 5 shards.
- `bash tools/ci/check-llmstxt.sh site` passed.
- `D:\QaaS\_tmp\qaas-docs-vale\vale-3.14.2\vale.exe docs` passed: 0 errors, 0 warnings, 0 suggestions in 489 files.
- Corrected forbidden-term scan over `docs`, `tools`, `mkdocs.yml`, `requirements.txt`, and `.github` passed with no matches after the orchestrator page was added.
- `rg -n "[ \t]+$" docs\integrations\orchestrator-site.md mkdocs.yml planning\v2-local-verification-current.md` returned no matches.
- `git diff --check -- docs\integrations\orchestrator-site.md mkdocs.yml` passed with only the existing CRLF normalization warning for `mkdocs.yml`.
- `graphify update D:\QaaS\qaas-docs` passed after adding the orchestrator site page: 8504 nodes, 12147 edges, 544 communities.

### Runner command exit-code coverage

- Audited current Runner command docs for the verification-report gap around process outcomes. `--serve-results` semantics were already corrected, but no generated Runner command page explained exit codes.
- Verified exit-code behavior against `QaaS.Runner\QaaS.Runner\Bootstrap.cs`, `Runner.cs`, `Execution.cs`, `Options\BaseOptions.cs`, `Options\AssertableOptions.cs`, and `Options\ExecuteOptions.cs`.
- Updated `tools\QaaS.Docs.Generator\Cli\CliReferenceRenderer.cs` so generated Runner command pages emit:
  - `Verified-against` markers for the Runner lifecycle and option sources.
  - `## Exit Codes` before `## Raw CLI Help` on `commands.md`, `run.md`, `act.md`, `assert.md`, `execute.md`, and `template.md`.
  - The source-backed meanings for `0`, `1`, and `>1`, plus `RunAndGetExitCode()`, `Run()`, and `--no-process-exit` handling.
- Updated `CliReferenceRendererTests` to assert the exit-code section and Runner source marker are emitted.
- Regenerated reference docs with `dotnet run --project .\tools\QaaS.Docs.Generator\QaaS.Docs.Tools\QaaS.Docs.Tools.csproj -- generate-reference-docs --skip-cli-snapshot-refresh`.
- Updated the six Runner command pages' `last_verified` dates to 2026-05-23; generator check mode preserved those frontmatter values.
- `csharpier format tools\QaaS.Docs.Generator\Cli\CliReferenceRenderer.cs tools\QaaS.Docs.Generator\QaaS.Docs.Generator.Tests\Cli\CliReferenceRendererTests.cs` passed.
- `dotnet build .\tools\QaaS.Docs.Generator\QaaS.Docs.Generator.csproj --nologo -clp:ErrorsOnly -m:1 -nr:false` passed: 0 warnings, 0 errors.
- `dotnet test .\tools\QaaS.Docs.Generator\QaaS.Docs.Generator.Tests\QaaS.Docs.Generator.Tests.csproj --nologo -m:1 -nr:false` passed: 9 tests.
- `dotnet run --project .\tools\QaaS.Docs.Generator\QaaS.Docs.Tools\QaaS.Docs.Tools.csproj -- generate-reference-docs --skip-cli-snapshot-refresh --check --build-site` passed.
- `bash tools/ci/check-frontmatter.sh` passed.
- `python tools\ci\check-reference-skeleton.py` passed: 435 reference pages.
- `python tools\ci\check-page-headings.py` passed: 485 pages.
- `python tools\ci\check-heading-anchors.py` passed: 3268 headings.
- `python tools\ci\check-nav-structure.py` passed: 489 nav pages.
- `python tools\ci\check-offline-readiness.py` passed: 485 pages.
- `npx --yes markdownlint-cli2 "docs/**/*.md" "#docs/_generated/**"` passed: 485 files, 0 errors.
- `bash tools/ci/validate-yaml-snippets.sh` passed: 275 YAML blocks.
- `bash tools/ci/compile-csharp-snippets.sh` passed: 80 C# snippets.
- `python tools\build_llmstxt.py --site-dir site` passed: 485 pages, 5 shards.
- `bash tools/ci/check-llmstxt.sh site` passed.
- `D:\QaaS\_tmp\qaas-docs-vale\vale-3.14.2\vale.exe docs` passed: 0 errors, 0 warnings, 0 suggestions in 489 files.
- `python tools\ci\check-verification-markers.py` passed: 399 source-derived reference pages.
- `csharpier check tools\QaaS.Docs.Generator\Cli\CliReferenceRenderer.cs tools\QaaS.Docs.Generator\QaaS.Docs.Generator.Tests\Cli\CliReferenceRendererTests.cs` passed.
- Corrected forbidden-term scan over `docs`, `tools`, `mkdocs.yml`, `requirements.txt`, and `.github` passed with no matches after adding the Runner exit-code sections.
- `rg -n "[ \t]+$" docs\qaas\userInterfaces\runner\commands tools\QaaS.Docs.Generator\Cli\CliReferenceRenderer.cs tools\QaaS.Docs.Generator\QaaS.Docs.Generator.Tests\Cli\CliReferenceRendererTests.cs planning\v2-local-verification-current.md` returned no matches.
- `git diff --check -- docs\qaas\userInterfaces\runner\commands tools\QaaS.Docs.Generator\Cli\CliReferenceRenderer.cs tools\QaaS.Docs.Generator\QaaS.Docs.Generator.Tests\Cli\CliReferenceRendererTests.cs planning\v2-local-verification-current.md` passed with only existing CRLF normalization warnings for generated Runner command pages.
- `graphify update D:\QaaS\qaas-docs` passed after the Runner exit-code generator/page updates: 8512 nodes, 12158 edges, 543 communities.

### DataSources overview v2 cleanup

- Audited the two remaining hand-authored DataSources overview pages that still used `## Usage` rather than the v2 section shape.
- Verified Runner DataSources behavior against `QaaS.Framework\QaaS.Framework.Executions\BaseExecutionBuilder.cs`, `QaaS.Framework\QaaS.Framework.SDK\DataSourceObjects\DataSourceBuilder.cs`, `QaaS.Framework\QaaS.Framework.SDK\Hooks\Generator\IGenerator.cs`, `QaaS.Runner\QaaS.Runner\ExecutionBuilder.cs`, `QaaS.Runner\QaaS.Runner\Logics\DataSourceLogic.cs`, `QaaS.Runner\QaaS.Runner.Sessions\Actions\Publishers\Builders\PublisherBuilderProperties.cs`, and `QaaS.Runner\QaaS.Runner.Assertions\AssertionObjects\Assertion.cs`.
- Verified Mocker DataSources behavior against `QaaS.Framework\QaaS.Framework.Executions\BaseExecutionBuilder.cs`, `QaaS.Framework\QaaS.Framework.SDK\DataSourceObjects\DataSourceBuilder.cs`, `QaaS.Framework\QaaS.Framework.SDK\Hooks\Generator\IGenerator.cs`, `QaaS.Mocker\QaaS.Mocker\ExecutionBuilder.cs`, `QaaS.Mocker\QaaS.Mocker\Logics\StubsLogic.cs`, `QaaS.Mocker\QaaS.Mocker.Stubs\ConfigurationObjects\TransactionStubBuilder.cs`, and `QaaS.Mocker\QaaS.Mocker.Servers\ServerFactory.cs`.
- Updated `docs\qaas\userInterfaces\runner\configurationSections\dataSources\overview.md` with `Verified-against` markers, a TL;DR, `## When to use`, `## YAML configuration`, `## C# (CAC) usage`, minimal YAML, realistic usage notes, edge cases, and final `## See also` links.
- Updated `docs\mocker\userInterfaces\mocker\configurationSections\dataSources\overview.md` with the same v2 structure and source markers, scoped to Mocker stubs and server construction.
- The YAML examples use the source-backed `FromFileSystem` generator and passed snippet validation.
- `bash tools/ci/check-frontmatter.sh` passed.
- `python tools\ci\check-page-headings.py` passed: 485 pages.
- `python tools\ci\check-heading-anchors.py` passed: 3280 headings.
- `python tools\ci\check-offline-readiness.py` passed: 485 pages.
- `npx --yes markdownlint-cli2 "docs/**/*.md" "#docs/_generated/**"` passed: 485 files, 0 errors.
- `bash tools/ci/validate-yaml-snippets.sh` passed with a longer local timeout: 277 YAML blocks.
- `python tools\ci\check-nav-structure.py` passed: 489 nav pages.
- `python tools\ci\check-reference-skeleton.py` passed: 435 reference pages.
- `mkdocs build --strict --site-dir site` passed with the existing Material MkDocs 2.0 warning.
- Corrected forbidden-term scan over `docs`, `tools`, `mkdocs.yml`, `requirements.txt`, and `.github` passed with no matches after the overview cleanup.
- `rg -n "[ \t]+$" docs\qaas\userInterfaces\runner\configurationSections\dataSources\overview.md docs\mocker\userInterfaces\mocker\configurationSections\dataSources\overview.md` returned no matches.
- `git diff --check -- docs\qaas\userInterfaces\runner\configurationSections\dataSources\overview.md docs\mocker\userInterfaces\mocker\configurationSections\dataSources\overview.md` passed with only existing CRLF normalization warnings for the two edited overview pages.
- `python tools\build_llmstxt.py --site-dir site` passed: 485 pages, 5 shards.
- `bash tools/ci/check-llmstxt.sh site` passed.
- `D:\QaaS\_tmp\qaas-docs-vale\vale-3.14.2\vale.exe docs` passed: 0 errors, 0 warnings, 0 suggestions in 489 files.
- `graphify update D:\QaaS\qaas-docs` passed after the DataSources overview cleanup: 8520 nodes, 12166 edges, 540 communities.

### Section skeleton and quick-start cleanup

- Scanned authored docs for v2 skeleton drift:
  - Initial TL;DR scan found 35 authored pages missing `> TL;DR`.
  - Initial leaf `## See also` scan found 34 pages without final cross-links.
  - Old non-contract heading scan found only generated command-page `## Examples` headings, which are intentional for CLI command pages.
- Normalized the remaining Runner and Mocker configuration-section overview pages:
  - `docs\qaas\userInterfaces\runner\configurationSections\assertions\overview.md`
  - `docs\qaas\userInterfaces\runner\configurationSections\links\overview.md`
  - `docs\qaas\userInterfaces\runner\configurationSections\sessions\overview.md`
  - `docs\qaas\userInterfaces\runner\configurationSections\storages\overview.md`
  - `docs\mocker\userInterfaces\mocker\configurationSections\controller\overview.md`
  - `docs\mocker\userInterfaces\mocker\configurationSections\server\overview.md`
  - `docs\mocker\userInterfaces\mocker\configurationSections\stubs\overview.md`
- Added schema `Verified-against` markers, TL;DR blocks, `## When to use`, `## YAML configuration`, `## Edge cases`, and `## See also` sections to those overview pages.
- Replaced the generated-hash-only `summary` on `docs\mocker\userInterfaces\mocker\configurationSections\stubs\overview.md` with a user-facing summary.
- Added TL;DR blocks to the remaining landing, architecture, and quick-start pages that lacked them.
- Added `## See also` sections to the remaining non-index quick-start and architecture leaf pages.
- Corrected stale case-run guidance in `docs\qaas\quickStart\makeTestMoreMaintainable.md`: removed `-s` from the cases command because `-s` is `--serve-results`, not case ordering.
- Post-cleanup scans:
  - Authored pages missing `> TL;DR`: 0.
  - Non-index authored leaf pages missing `## See also`: 0.
  - Old non-contract H2 headings (`What It Does`, `YAML Example`, `Use When`, `Usage`, etc.): 0.
  - Stale quick-start `-s` / ASCII-order guidance: 0 matches.
- `bash tools/ci/check-frontmatter.sh` passed.
- `python tools\ci\check-page-headings.py` passed: 485 pages.
- `python tools\ci\check-heading-anchors.py` passed: 3324 headings.
- `python tools\ci\check-nav-structure.py` passed: 489 nav pages.
- `python tools\ci\check-offline-readiness.py` passed: 485 pages.
- `npx --yes markdownlint-cli2 "docs/**/*.md" "#docs/_generated/**"` passed: 485 files, 0 errors.
- `bash tools/ci/validate-yaml-snippets.sh` passed with a longer local timeout: 277 YAML blocks.
- `mkdocs build --strict --site-dir site` passed with the existing Material MkDocs 2.0 warning.
- Corrected forbidden-term scan over `docs`, `tools`, `mkdocs.yml`, `requirements.txt`, and `.github` passed with no matches.
- `rg -n "[ \t]+$" docs` returned no matches.
- `git diff --check -- docs` passed with only existing CRLF normalization warnings for touched Markdown files.
- `python tools\build_llmstxt.py --site-dir site` passed: 485 pages, 5 shards.
- `bash tools/ci/check-llmstxt.sh site` passed.
- `D:\QaaS\_tmp\qaas-docs-vale\vale-3.14.2\vale.exe docs` passed: 0 errors, 0 warnings, 0 suggestions in 489 files.
- `bash tools/ci/compile-csharp-snippets.sh` passed: 80 snippets.
- `graphify update D:\QaaS\qaas-docs` passed after the section skeleton pass: 8563 nodes, 12210 edges, 538 communities.

### Frontmatter summary quality cleanup

- Found four catalog landing pages with duplicated frontmatter blocks inside the document body:
  - `docs\assertions\index.md`
  - `docs\generators\index.md`
  - `docs\probes\index.md`
  - `docs\processors\index.md`
- Removed the duplicate body frontmatter blocks while preserving the real top frontmatter.
- Replaced truncated `summary: "... ..."` frontmatter values with complete, concise one-line summaries.
- Replaced matching truncated TL;DR lines on advanced concept, Runner session type, Runner command, and Framework project pages.
- Post-cleanup scans:
  - Truncated frontmatter summaries: 0.
  - Truncated TL;DR lines: 0.
  - Summaries over 200 characters: 0.
  - Duplicate frontmatter blocks immediately after frontmatter: 0.
- `bash tools/ci/check-frontmatter.sh` passed.
- `python tools\ci\check-page-headings.py` passed: 485 pages.
- `python tools\ci\check-heading-anchors.py` passed: 3324 headings.
- `python tools\ci\check-offline-readiness.py` passed: 485 pages.
- `npx --yes markdownlint-cli2 "docs/**/*.md" "#docs/_generated/**"` passed: 485 files, 0 errors.
- `mkdocs build --strict --site-dir site` passed with the existing Material MkDocs 2.0 warning.
- Corrected forbidden-term scan over `docs`, `tools`, `mkdocs.yml`, `requirements.txt`, and `.github` passed with no matches.
- `rg -n "[ \t]+$" docs planning\v2-local-verification-current.md` returned no matches.
- `git diff --check -- docs planning\v2-local-verification-current.md` passed with only existing CRLF normalization warnings for touched Markdown files.
- `python tools\build_llmstxt.py --site-dir site` passed: 485 pages, 5 shards.
- `bash tools/ci/check-llmstxt.sh site` passed.
- `D:\QaaS\_tmp\qaas-docs-vale\vale-3.14.2\vale.exe docs` passed: 0 errors, 0 warnings, 0 suggestions in 489 files.
- `graphify update D:\QaaS\qaas-docs` passed after the frontmatter summary cleanup: 8564 nodes, 12211 edges, 539 communities.
- Rebuilt the current local ZIM after the latest docs edits through WSL with pinned `openzim/zim-tools 3.7.0`:
  - First command attempt failed before packaging because the Windows PATH expanded into the WSL shell string with unescaped spaces; no ZIM was written by that attempt.
  - Reran with a clean WSL PATH: `PATH=/mnt/d/QaaS/_tmp/openzim/zim-tools-3.7.0:/usr/local/bin:/usr/bin:/bin`.
  - `ZIM_ROOT=/mnt/d/QaaS/_tmp/qaas-docs-site-zim-20260523070919 bash tools/zim/build-zim.sh /mnt/d/QaaS/_tmp/qaas-docs-current-20260523070919.zim` passed.
  - The packager rebuilt and validated llms shards first: `[build-llmstxt] pages=485 shards=5` and `[check-llmstxt] OK`.
  - The packager wrote a 5.3 MB ZIM.
  - `zimcheck /mnt/d/QaaS/_tmp/qaas-docs-current-20260523070919.zim` passed overall status.
  - `zimsearch /mnt/d/QaaS/_tmp/qaas-docs-current-20260523070919.zim DataSources` returned relevant docs hits.

### Final local v2 rubric audit

- Re-ran the current local v2 gates after the latest docs cleanup:
  - `bash tools/ci/check-frontmatter.sh` passed.
  - `python tools\ci\check-catalog-coverage.py` passed: 72 hooks.
  - `python tools\ci\check-reference-skeleton.py` passed: 435 reference pages.
  - `python tools\ci\check-page-headings.py` passed: 485 pages.
  - `python tools\ci\check-example-density.py` passed: 148 pages.
  - `python tools\ci\check-nav-structure.py` passed: 489 nav pages.
  - `python tools\ci\check-offline-readiness.py` passed: 485 pages.
  - `python tools\ci\check-heading-anchors.py` passed: 3324 headings.
  - `python tools\ci\check-verification-markers.py` passed: 399 source-derived reference pages.
  - `npx --yes markdownlint-cli2 "docs/**/*.md" "#docs/_generated/**"` passed: 485 files, 0 errors.
  - `bash tools/ci/validate-yaml-snippets.sh` passed: 277 YAML blocks.
  - `bash tools/ci/compile-csharp-snippets.sh` passed: 80 C# snippets.
  - `D:\QaaS\_tmp\qaas-docs-vale\vale-3.14.2\vale.exe docs` passed: 0 errors, 0 warnings, 0 suggestions in 489 files.
  - The corrected forbidden-term scan over `docs`, `tools`, `mkdocs.yml`, `requirements.txt`, and `.github` passed with no matches.
  - The public-surface leak scan over authored docs passed with no matches for `internal`, `private`, or `protected` type declarations.
  - The truncated-summary/TL;DR scan passed with no matches.
  - The trailing-whitespace scan over docs, tools, workflows, config, and this evidence file passed before this section was appended.
- Rechecked the named old findings:
  - `docs\qaas\userInterfaces\runner\commands\execute.md` has no `Parallel` or `Parallel: false` match.
  - `docs\qaas\quickStart\makeTestMoreMaintainable.md` has no `-s`/`--serve-results` case-order guidance and no ASCII case-order guidance.
  - `ProblemDetailsProcessor` references point to `QaaS.Common.Processors\QaaS.Common.Processors\ProblemDetailsProcessor.cs` and the table/YAML pages expose the current processor configuration fields.
  - `docs\cookbooks\` is absent, and the folded cookbook destinations are wired in `mkdocs.yml`: Runner schema extensions, Mocker multi-server routing, CI pipeline, Kiwix MCP, and the four custom-authoring guides.
- `mkdocs build --strict --site-dir site` passed with the existing Material for MkDocs 2.0 notice.
- `python tools\build_llmstxt.py --site-dir site` passed: 485 pages, 5 shards.
- `bash tools/ci/check-llmstxt.sh site` passed.
- `bash tools/ci/prepare-site-check-root.sh site site-check qaas-docs` passed.
- `D:\QaaS\_tmp\qaas-docs-link-tools\htmltest-v0.17.0\htmltest.exe -c tools\ci\htmltest.yml` passed: 490 documents.
- `D:\QaaS\_tmp\qaas-docs-link-tools\lychee-v0.24.2\lychee-x86_64-pc-windows-msvc\lychee.exe --config tools\ci\lychee.toml --root-dir "$PWD\site-check" "site-check/**/*.html"` passed: 266040 total links, 5725 unique links, 0 errors, 489 excluded.
- Re-ran the current local validation gates after the pre-push classification update:
  - `bash tools/ci/check-frontmatter.sh` passed.
  - Independent forbidden-term scan over `docs`, `tools`, `.github`, `mkdocs.yml`, `requirements.txt`, `.markdownlint.json`, and `.vale.ini` passed with no matches, excluding generated/build output and `planning/`.
  - Public-surface leak scan over authored docs passed with no matches for `internal`, `private`, or `protected` type declarations.
  - `rg -n "ai_summary|docs/_meta" docs tools .github mkdocs.yml requirements.txt .markdownlint.json .vale.ini ...` returned no matches outside excluded generated/build output and `planning/`.
  - `python tools/ci/check-catalog-coverage.py` passed: 72 hooks.
  - `python tools/ci/check-reference-skeleton.py` passed: 435 reference pages.
  - `python tools/ci/check-page-headings.py` passed: 485 pages.
  - `python tools/ci/check-example-density.py` passed: 148 pages.
  - `python tools/ci/check-nav-structure.py` passed: 489 nav pages.
  - `python tools/ci/check-offline-readiness.py` passed: 485 pages.
  - `python tools/ci/check-heading-anchors.py` passed: 3324 headings.
  - `python tools/ci/check-verification-markers.py` passed: 399 source-derived reference pages.
  - `yamllint -c tools\ci\yamllint.yml .github\workflows\docs.yml .github\workflows\ci.yml` passed.
  - `npx --yes markdownlint-cli2 "docs/**/*.md" "#docs/_generated/**"` passed: 485 files, 0 errors.
  - `D:\QaaS\_tmp\qaas-docs-vale\vale-3.14.2\vale.exe docs` passed: 0 errors, 0 warnings, 0 suggestions in 489 files.
  - `bash tools/ci/validate-yaml-snippets.sh` passed with the longer timeout: 277 YAML blocks.
  - `bash tools/ci/compile-csharp-snippets.sh` passed: 80 C# snippets.
  - `python -m py_compile ...` passed for the llms builder and Python CI gate scripts.
  - `bash -n ...` passed for frontmatter, llms, snippet, site-prep, and ZIM shell scripts.
  - `mkdocs build --strict --site-dir site` passed with the existing Material for MkDocs 2.0 notice.
  - `python tools/build_llmstxt.py --site-dir site; bash tools/ci/check-llmstxt.sh site` passed: 485 pages, 5 shards, `[check-llmstxt] OK`.
  - `git diff --check -- ...` passed with only CRLF normalization warnings.
  - Trailing-whitespace scan over docs, tools, workflows, config, and current planning evidence returned no matches.
  - `bash tools/ci/prepare-site-check-root.sh site site-check qaas-docs` passed.
  - `htmltest` passed on 490 documents.
  - `lychee` passed on 266040 total links, 5725 unique links, 0 errors, 489 excluded.
- Re-verified the nested docs generator after formatting the changed C# files:
  - `csharpier format` ran on the 12 changed generator C# files.
  - `dotnet restore QaaS.Docs.Generator.Tests\QaaS.Docs.Generator.Tests.csproj --nologo` passed.
  - `dotnet build QaaS.Docs.Generator.Tests\QaaS.Docs.Generator.Tests.csproj --nologo -clp:ErrorsOnly -m:1 -nr:false` passed: 0 warnings, 0 errors.
  - `dotnet build QaaS.Docs.Tools\QaaS.Docs.Tools.csproj --nologo -clp:ErrorsOnly -m:1 -nr:false` passed: 0 warnings, 0 errors.
  - `dotnet test QaaS.Docs.Generator.Tests\QaaS.Docs.Generator.Tests.csproj --nologo --no-build -m:1 -nr:false` passed: 9 tests.
  - `git diff --check` in the nested generator passed with only CRLF normalization warnings.
  - Trailing-whitespace scan over the nested generator source/test/resource paths returned no matches.
- `dotnet run --project .\tools\QaaS.Docs.Generator\QaaS.Docs.Tools\QaaS.Docs.Tools.csproj -- generate-reference-docs --skip-cli-snapshot-refresh --check --build-site` initially reported four stale generated docs after the generator formatting pass:
  - `docs\qaas\userInterfaces\runner\commands\execute.md`
  - `docs\qaas\functions\index.md`
  - `docs\mocker\functions\index.md`
  - `docs\framework\functions\index.md`
- Regenerated with `dotnet run --project .\tools\QaaS.Docs.Generator\QaaS.Docs.Tools\QaaS.Docs.Tools.csproj -- generate-reference-docs --skip-cli-snapshot-refresh --build-site`; the follow-up `--check --build-site` run passed and reported `Validated mirrored docs assets schema assets.`
- Re-ran the affected gates after regeneration:
  - `bash tools/ci/check-frontmatter.sh` passed.
  - `python tools/ci/check-page-headings.py` passed: 485 pages.
  - `python tools/ci/check-heading-anchors.py` passed: 3324 headings.
  - `python tools/ci/check-reference-skeleton.py` passed: 435 reference pages.
  - `python tools/ci/check-nav-structure.py` passed: 489 nav pages.
  - `npx --yes markdownlint-cli2 docs/qaas/userInterfaces/runner/commands/execute.md docs/qaas/functions/index.md docs/mocker/functions/index.md docs/framework/functions/index.md` passed: 4 files, 0 errors.
  - `bash tools/ci/validate-yaml-snippets.sh` passed: 277 YAML blocks.
  - The independent forbidden-term scan passed with no matches.
  - `git diff --check` and trailing-whitespace scans passed for the regenerated docs.
- Re-ran `graphify update D:\QaaS\qaas-docs` after the generator formatting and regenerated docs:
  - AST extraction completed for 578/578 files.
  - Rebuilt graph: 9847 nodes, 13582 edges, 688 communities.
  - `graph.html` visualization was skipped because the graph exceeds the default 5000-node visualization limit; `graph.json` and `GRAPH_REPORT.md` were still updated.
- Refreshed commit-bucket classification after the generator regeneration:
  - Parent `qaas-docs` status paths returned `ALL_QAAS_DOCS_STATUS_PATHS_CLASSIFIED`.
  - Nested `tools\QaaS.Docs.Generator` status paths, with untracked files expanded, returned `ALL_NESTED_GENERATOR_STATUS_PATHS_CLASSIFIED`.
- Rechecked PR #43 read-only after the generator regeneration:
  - `gh pr view 43 --repo TheSmokeTeam/qaas-docs --json state,isDraft,mergeStateStatus,baseRefName,headRefName,headRefOid,url,updatedAt` still reports state `OPEN`, not draft, merge state `BLOCKED`, base `master`, remote head `feature/document-actions` at `5ad8c8b7b068fb253a238b142a8ffc180a8be496`, updated `2026-05-19T18:38:55Z`.
  - `git rev-list --left-right --count origin/feature/document-actions...HEAD` still reports `0 23`.
  - `gh pr checks 43 --repo TheSmokeTeam/qaas-docs` still shows only the stale remote rollup: two `build-site` passes and skipped `deploy-pages`, `publish-docker-image`, and `update-repository-overview` jobs.
- Rechecked PR #43 read-only:
  - URL: `https://github.com/TheSmokeTeam/qaas-docs/pull/43`
  - State: open, not draft, merge state reported as `BLOCKED`.
  - Remote head branch: `feature/document-actions`.
  - Remote head SHA: `5ad8c8b7b068fb253a238b142a8ffc180a8be496`.
  - Local branch SHA: `b3b1fd91faec983ff987ecca9e18235514e99f97`.
  - Current remote checks are still from 2026-05-19, so they do not prove the current local v2 work.
- Rechecked PR #43 read-only again after the graph refresh:
  - `gh pr view 43 --repo TheSmokeTeam/qaas-docs` still reports state `OPEN`, not draft, merge state `BLOCKED`, base `master`, remote head `feature/document-actions` at `5ad8c8b7b068fb253a238b142a8ffc180a8be496`.
  - `git rev-parse HEAD` is still `b3b1fd91faec983ff987ecca9e18235514e99f97`; `git rev-parse origin/feature/document-actions` is still `5ad8c8b7b068fb253a238b142a8ffc180a8be496`.
  - `gh pr checks 43 --repo TheSmokeTeam/qaas-docs` still shows only the stale 2026-05-19 CI rollup for the remote head: two `build-site` passes and skipped `deploy-pages`, `publish-docker-image`, and `update-repository-overview` jobs.
- Rechecked PR #43 read-only after the commit-split classification pass:
  - `gh pr view 43 --repo TheSmokeTeam/qaas-docs --json state,isDraft,mergeStateStatus,baseRefName,headRefName,headRefOid,url,updatedAt` still reports state `OPEN`, not draft, merge state `BLOCKED`, base `master`, remote head `feature/document-actions` at `5ad8c8b7b068fb253a238b142a8ffc180a8be496`, updated `2026-05-19T18:38:55Z`.
  - `git rev-list --left-right --count origin/feature/document-actions...HEAD` still reports `0 23`, so the local branch remains 23 commits ahead of the remote head.
  - `gh pr checks 43 --repo TheSmokeTeam/qaas-docs` still shows only the stale remote rollup: two `build-site` passes and skipped `deploy-pages`, `publish-docker-image`, and `update-repository-overview` jobs.
- Classified every current `qaas-docs` dirty path against `planning/v2-commit-split-map.md` without staging files:
  - Initial classification found two runner UI docs without explicit buckets: `docs/qaas/userInterfaces/logger.md` and `docs/qaas/userInterfaces/runner/allureReport.md`.
  - Updated the split map to include those docs and `tools/docs-generator/gen-plugin-pages.mjs`.
  - Re-ran the classification and got `ALL_STATUS_PATHS_CLASSIFIED`.
- Updated the installed `ultrareview` skill at `C:\Users\eldar\.codex\skills\ultrareview\SKILL.md` to the current v2 contract:
  - The skill now points to `planning/authoring-contract-v2.md`, `planning/v2-ultrareview-plan.md`, `planning/v2-local-verification-current.md`, and `planning/v2-completion-audit.md`.
  - It treats `docs/_meta/` as obsolete, rejects `ai_summary`, and writes reports under `planning/`.
  - It uses the v2 rubric, including structural conformance as dimension 7 and PR hygiene as a hard release-gate dimension.
  - Validation scans found no old v1 contract-path or ingestibility requirement strings in the skill.
  - `planning/v2-ultrareview-current.md` records the current v2 review state. It remains a FAIL report, not a pass report, because PR hygiene and remote proof are incomplete.
- Refreshed the qaas-docs graph after the latest material docs/evidence changes:
  - `graphify update D:\QaaS\qaas-docs` passed.
  - AST extraction completed for 577/577 files.
  - Rebuilt graph: 9838 nodes, 13574 edges, 693 communities.
  - `graph.html` visualization was skipped because the graph exceeds the default 5000-node visualization limit; `graph.json` and `GRAPH_REPORT.md` were still updated.
- Resolved the Graphify skill/package freshness warning:
  - `graphify install --platform codex` installed Graphify skill version 0.8.16 under `C:\Users\eldar\.agents\skills\graphify`.
  - `graphify install --platform windows` installed Graphify skill version 0.8.16 under `C:\Users\eldar\.claude\skills\graphify`.
  - `graphify --version` now prints `graphify 0.8.16` with no warning.
  - Re-ran `graphify update D:\QaaS\qaas-docs`; it passed with no version warning.
  - AST extraction completed for 578/578 files.
  - Rebuilt graph: 9846 nodes, 13581 edges, 695 communities.
  - `graph.html` visualization was skipped because the graph exceeds the default 5000-node visualization limit; `graph.json` and `GRAPH_REPORT.md` were still updated.
- Re-ran the qaas-docs graph refresh after the Kiwix Docker entrypoint correction and ZIM/Kiwix research note update:
  - `graphify update D:\QaaS\qaas-docs` passed.
  - AST extraction completed for 578/578 files.
  - Rebuilt graph: 9847 nodes, 13582 edges, 689 communities.
  - `graph.html` visualization was skipped because the graph exceeds the default 5000-node visualization limit; `graph.json` and `GRAPH_REPORT.md` were still updated.
- Re-ran the qaas-docs graph refresh after the Kiwix MCP choice and schema-extension marker docs updates:
  - `graphify update D:\QaaS\qaas-docs` passed.
  - AST extraction completed for 578/578 files.
  - Rebuilt graph: 9849 nodes, 13584 edges, 695 communities.
  - `graph.html` visualization was skipped because the graph exceeds the default 5000-node visualization limit; `graph.json` and `GRAPH_REPORT.md` were still updated.
- Re-ran the qaas-docs graph refresh after adding the Kiwix MCP client configuration snippet:
  - `graphify update D:\QaaS\qaas-docs` passed.
  - AST extraction completed for 578/578 files.
  - Rebuilt graph: 9852 nodes, 13587 edges, 695 communities.
  - `graph.html` visualization was skipped because the graph exceeds the default 5000-node visualization limit; `graph.json` and `GRAPH_REPORT.md` were still updated.
- Re-ran the qaas-docs graph refresh after adding the explicit offline lychee workflow gate:
  - `graphify update D:\QaaS\qaas-docs` passed.
  - AST extraction completed for 578/578 files.
  - Rebuilt graph: 9852 nodes, 13587 edges, 693 communities.
  - `graph.html` visualization was skipped because the graph exceeds the default 5000-node visualization limit; `graph.json` and `GRAPH_REPORT.md` were still updated.
- Re-ran the qaas-docs graph refresh after adding the tracked pre-commit hook and reusable hook script:
  - `graphify update D:\QaaS\qaas-docs` passed.
  - AST extraction completed for 580/580 files.
  - Rebuilt graph: 9861 nodes, 13601 edges, 693 communities.
  - `graph.html` visualization was skipped because the graph exceeds the default 5000-node visualization limit; `graph.json` and `GRAPH_REPORT.md` were still updated.

### Freshness policy and weekly task

- Verified that `C:\Users\eldar\.claude\CLAUDE.md` already contains the plan-required `QaaS docs / docs-revamp policy` block.
- Updated `C:\Users\eldar\.claude\plans\qaas-weekly-sweep.ps1` so the weekly freshness report also checks the local docs tree:
  - `git status --short --branch`
  - `bash tools/ci/check-frontmatter.sh`
  - `mkdocs build --strict --site-dir site`
  - `python tools/build_llmstxt.py --site-dir site; bash tools/ci/check-llmstxt.sh site`
- Parsed `C:\Users\eldar\.claude\plans\qaas-weekly-sweep.ps1` with the PowerShell parser; syntax validation passed.
- Registered the Windows Scheduled Task `QaaS Weekly Sweep`:
  - Next run: 2026-05-25 09:00 local time.
  - Executable: `pwsh.exe`.
  - Arguments: `-NoProfile -ExecutionPolicy Bypass -File "C:\Users\eldar\.claude\plans\qaas-weekly-sweep.ps1"`.
  - Report path used by the script: `C:\Users\eldar\upgrade-report.md`.
- Repaired direct-run issues found in the weekly sweep script:
  - Optional tools now report `SKIPPED` when the command is absent instead of writing `ERROR:` noise to the report.
  - Each section records an `[exit-code]` line so stale-tool findings are visible without hiding docs-check failures.
- Ran `C:\Users\eldar\.claude\plans\qaas-weekly-sweep.ps1` directly on 2026-05-23; it exited 0 and regenerated `C:\Users\eldar\upgrade-report.md` with timestamp 2026-05-23 07:40.
- Scanned the generated report for `ERROR:`, `ParserError`, `fatal`, and `Traceback`; there were no matches.
- The direct report proved the docs-specific weekly checks:
  - `qaas-docs git status` recorded exit code 0.
  - `qaas-docs frontmatter` recorded `[check-frontmatter] OK` and exit code 0.
  - `qaas-docs strict build` recorded exit code 0.
  - `qaas-docs llms bundle` recorded `[build-llmstxt] pages=485 shards=5`, `[check-llmstxt] OK`, and exit code 0.
- The same report still shows environment freshness drift outside the docs checks:
  - `dotnet tool update -g --all` exited 1 after reporting the global tools as already installed.
  - `npm outdated -g` exited 1 and listed newer global packages.
  - `pipx` was not found on `PATH`, so pipx sections were skipped.
  - `winget upgrade` listed 31 available upgrades.
- The scheduled task is registered and ready, but it has not yet run on its Monday trigger:
  - Last run time: 1999-11-30 00:00:00, the Windows "never run" sentinel.
  - Last task result: 267011.
  - Next run time: 2026-05-25 09:00 local time.

### Ingest and link artifacts

- `python tools/build_llmstxt.py --site-dir site` passed: 482 pages, 5 shards.
- `bash tools/ci/check-llmstxt.sh site` passed.
- `mkdocs build --strict --site-dir site; python tools\build_llmstxt.py --site-dir site; bash tools/ci/check-llmstxt.sh site` passed, proving the workflow sequence overwrites the large plugin-produced full bundle with the custom sharded bundle.
- Post-builder llms files were present and under the 1 MB shard limit: `llms.txt` 100123 bytes; `llms-full.txt` 356 bytes; `llms-full-tutorials-1.txt` 83819 bytes; `llms-full-how-to-1.txt` 71427 bytes; `llms-full-explanation-1.txt` 67137 bytes; `llms-full-reference-1.txt` 878018 bytes; `llms-full-reference-2.txt` 712073 bytes.
- `bash tools/ci/prepare-site-check-root.sh site site-check qaas-docs` passed.
- `D:\QaaS\_tmp\qaas-docs-link-tools\htmltest-v0.17.0\htmltest.exe -c tools\ci\htmltest.yml` passed: 487 documents.
- `D:\QaaS\_tmp\qaas-docs-link-tools\lychee-v0.24.2\lychee-x86_64-pc-windows-msvc\lychee.exe --config tools\ci\lychee.toml --root-dir "$PWD\site-check" "site-check/**/*.html"` passed: 262643 total, 5632 unique, 0 errors, 486 excluded.

### ZIM packaging and serving

The first Docker probe found Docker Desktop installed but the Linux engine was not running; the engine was later started with `docker desktop start` for the Docker smoke below.

Pinned local tools were available under `D:\QaaS\_tmp`:

- `openzim/zim-tools 3.7.0`
- `kiwix-tools 3.8.2`

Commands run through WSL:

- `PATH=/mnt/d/QaaS/_tmp/openzim/zim-tools-3.7.0:$PATH ZIM_ROOT=/mnt/d/QaaS/_tmp/qaas-docs-site-zim-current bash tools/zim/build-zim.sh /mnt/d/QaaS/_tmp/qaas-docs-current.zim` passed and wrote a 5.2 MB ZIM.
- `zimcheck /mnt/d/QaaS/_tmp/qaas-docs-current.zim` passed overall status.
- `zimsearch /mnt/d/QaaS/_tmp/qaas-docs-current.zim IProbe` returned relevant docs hits.
- `kiwix-serve --port 8900 --threads 4 --nodatealiases /mnt/d/QaaS/_tmp/qaas-docs-current.zim` smoke passed:
  - `GET /search?pattern=IProbe`
  - `GET /content/qaas-docs-current/qaas-docs/qaas/index.html`
- After `tools/zim/build-zim.sh` was updated to rebuild and validate the sharded llms bundle before packaging, `PATH=/mnt/d/QaaS/_tmp/openzim/zim-tools-3.7.0:$PATH ZIM_ROOT=/mnt/d/QaaS/_tmp/qaas-docs-site-zim-llms bash tools/zim/build-zim.sh /mnt/d/QaaS/_tmp/qaas-docs-llms-1779503243.zim` passed and wrote a 5.2 MB ZIM.
- The updated ZIM packager logged `[zim] building llms.txt shards`, `[build-llmstxt] pages=482 shards=5`, `[zim] validating llms.txt shards`, and `[check-llmstxt] OK` before invoking `zimwriterfs`.
- `zimcheck /mnt/d/QaaS/_tmp/qaas-docs-llms-1779503243.zim` passed overall status.
- Offline-readiness scans returned no authored-doc matches for remote Markdown images, remote HTML images, `<iframe>`, `<script>`, absolute qaas-docs self-links, `file://` URLs, or root-relative Markdown links outside generated/build output.
- Re-ran `kiwix-serve` against the latest generated ZIM, `/mnt/d/QaaS/_tmp/qaas-docs-current-20260523070919.zim`, through WSL on port 8902; the smoke passed:
  - `GET /search?pattern=DataSources` loaded and contained `DataSources`.
  - `GET /content/qaas-docs-current-20260523070919/qaas-docs/qaas/index.html` loaded and contained `Runner`.
- Started Docker Desktop through `docker desktop start` after `docker version` initially showed the Linux engine was not ready; Docker reported `29.2.1 linux Docker Desktop`.
- Ran the Docker branch of `tools/zim/build-zim.sh` from Git Bash with no `zimwriterfs` on `PATH`:
  - `ZIM_ROOT=site-zim-docker-smoke BASE_PATH=qaas-docs bash tools/zim/build-zim.sh qaas-docs-docker-smoke.zim` passed.
  - The packager logged `[zim] using docker openzim/zim-tools:3.7.0`.
  - The image `ghcr.io/openzim/zim-tools:3.7.0` was pulled by digest `sha256:e78b982612933a47d3a34fb6739eb7b8ac4326d30cc1e8bada4153046407649d`.
  - The packager wrote `qaas-docs-docker-smoke.zim` at 5.3 MB.
- The first Docker Kiwix smoke exposed a workflow/docs bug: `ghcr.io/kiwix/kiwix-serve:3.8.2` uses a wrapper script that injects `--port=8080`, and appending `--port 8888` after the image produced an `Unexpected argument` error.
- Patched the Kiwix Docker invocation in `.github/workflows/docs.yml`, `docs/integrations/kiwix-mcp.md`, and `tools/zim/build-zim.sh` to use `--entrypoint /usr/local/bin/kiwix-serve`, matching the actual binary invocation.
- Re-ran the pinned Docker Kiwix smoke with the patched entrypoint form:
  - `docker run --rm -d --name qaas-docs-kiwix-docker-smoke --entrypoint /usr/local/bin/kiwix-serve -v "$PWD:/data" -p 8904:8888 ghcr.io/kiwix/kiwix-serve:3.8.2 --port 8888 --threads 4 --nodatealiases /data/qaas-docs-docker-smoke.zim` passed.
  - `GET /search?pattern=DataSources` loaded and contained `DataSources`.
  - `GET /content/qaas-docs-docker-smoke/qaas-docs/qaas/index.html` loaded and contained `Runner`.
  - The smoke container was removed after the check.
- Validated the ZIM/Kiwix patch:
  - `yamllint -c tools\ci\yamllint.yml .github\workflows\docs.yml` passed.
  - `bash -n tools/zim/build-zim.sh` passed.
  - `npx --yes markdownlint-cli2 docs/integrations/kiwix-mcp.md` passed with 0 errors.
- Made the deferred Kiwix MCP choice explicit in `docs\integrations\kiwix-mcp.md`: the selected contract is pinned `kiwix-serve` plus a thin MCP wrapper over its HTTP endpoints, rather than depending on a canonical package.
- Validated the Kiwix MCP choice update:
  - `npx --yes markdownlint-cli2 docs/integrations/kiwix-mcp.md` passed with 0 errors.
  - `bash tools/ci/check-frontmatter.sh` passed.
  - `python tools/ci/check-page-headings.py` passed: 485 pages.
  - `python tools/ci/check-offline-readiness.py` passed: 485 pages.
  - Focused forbidden-term and public-surface scans over `docs\integrations\kiwix-mcp.md` returned no matches.
  - `mkdocs build --strict --site-dir site` passed with only the existing Material for MkDocs 2.0 notice.
  - `python tools/build_llmstxt.py --site-dir site` passed: 485 pages, 5 shards.
  - `bash tools/ci/check-llmstxt.sh site` passed.
- Added the plan-required MCP client configuration snippet to `docs\integrations\kiwix-mcp.md`:
  - Verified current `mcp-server-fetch` package metadata from PyPI before using the `uvx mcp-server-fetch` configuration form; PyPI lists current version `2025.4.7`, released 2025-04-07, with `uvx` and `python -m mcp_server_fetch` client configuration examples.
  - The page now shows an `mcpServers` block named `qaas-docs-fetch` and fetch payload examples for the local `kiwix-serve` search and content URLs.
  - Added the PyPI project page to `## See also`.
  - `npx --yes markdownlint-cli2 docs/integrations/kiwix-mcp.md` passed with 0 errors.
  - `python tools/ci/check-offline-readiness.py` passed: 485 pages.
  - `mkdocs build --strict --site-dir site` passed with only the existing Material for MkDocs 2.0 notice.
  - `python tools/build_llmstxt.py --site-dir site` and `bash tools/ci/check-llmstxt.sh site` passed: 485 pages, 5 shards.
  - `bash tools/ci/prepare-site-check-root.sh site site-check qaas-docs` passed.
  - `D:\QaaS\_tmp\qaas-docs-link-tools\htmltest-v0.17.0\htmltest.exe -c tools\ci\htmltest.yml` passed: 490 documents.
  - `D:\QaaS\_tmp\qaas-docs-link-tools\lychee-v0.24.2\lychee-x86_64-pc-windows-msvc\lychee.exe --config tools\ci\lychee.toml --root-dir "$PWD\site-check" "site-check/**/*.html"` passed: 266041 total links, 5726 unique links, 0 errors, 489 excluded.

The served content namespace used each ZIM filename stem (`qaas-docs-current` for the first smoke and `qaas-docs-current-20260523070919` for the latest smoke), matching the CI workflow pattern where `zim_name="qaas-docs-${GITHUB_SHA::8}"`.

### Source repository builds and tests

The source repo edits in this pass are documentation-comment / generated-doc related. Normal solution builds were run, followed by no-build tests against the rebuilt Debug `net10.0` outputs:

- Refreshed source-repo formatting after the dirty-state scan:
  - `csharpier check` initially found formatting drift in the touched Framework, Mocker, and Runner source-doc files.
  - `csharpier format` was applied to 2 Framework files, 2 Mocker files, and 11 Runner files.
  - Follow-up `csharpier check` passed for the same 15 files.
  - `git diff --check` passed for the same changed source-doc files.
- `dotnet build .\QaaS.Runner.sln --nologo -clp:ErrorsOnly -m:1 -nr:false` passed: 0 errors, 44 warnings.
- `dotnet test .\QaaS.Runner.sln --nologo --no-build -m:1 -nr:false -clp:ErrorsOnly` passed: 931 tests across Runner test projects.
- `dotnet build .\QaaS.Mocker.sln --nologo -clp:ErrorsOnly -m:1 -nr:false` passed: 0 errors, 30 warnings.
- `dotnet test .\QaaS.Mocker.sln --nologo --no-build -m:1 -nr:false -clp:ErrorsOnly` passed: 455 tests across Mocker test projects.
- `dotnet build .\QaaS.Framework.sln --nologo -clp:ErrorsOnly -m:1 -nr:false` passed: 0 errors, 16 warnings.
- `dotnet test .\QaaS.Framework.sln --nologo --no-build -m:1 -nr:false -clp:ErrorsOnly` passed: 354 passed, 1 skipped across Framework test projects. The skipped test was `PostgreSqlProtocol_SendChunk_And_ReadChunk_RoundTripsPostGisGeometryColumns`.
- Refreshed the source-repo graphs after formatting and verification:
  - `graphify update D:\QaaS\QaaS.Framework` passed: 333 files extracted, 2216 nodes, 3410 edges, 243 communities.
  - `graphify update D:\QaaS\QaaS.Mocker` passed: 146 files extracted, 1494 nodes, 2915 edges, 95 communities.
  - `graphify update D:\QaaS\QaaS.Runner` passed: 226 files extracted, 2802 nodes, 3939 edges, 263 communities.

### C# snippet semantic probe

- Added `tools/ci/probe-csharp-snippet-semantics.sh` as a standalone local Roslyn probe. It is not wired into CI because it resolves local sibling QaaS assemblies from the workspace.
- `bash tools/ci/probe-csharp-snippet-semantics.sh` now passes: 80 snippets from 18 pages, 366 references (175 trusted-platform assemblies, 193 local QaaS assemblies), 31 curated imports, 0 failed snippets, and 0 failed pages. The final fix also made the probe prefer current sibling source-repo assemblies over stale sample-app copies when duplicate assembly names exist.
- Validation after the full semantic remediation passed:
  - `bash tools/ci/probe-csharp-snippet-semantics.sh`
  - `bash -n tools/ci/probe-csharp-snippet-semantics.sh; bash -n tools/ci/compile-csharp-snippets.sh`
  - `bash tools/ci/compile-csharp-snippets.sh`
  - `npx --yes markdownlint-cli2 docs/assertions/custom-authoring-guide.md docs/generators/custom-authoring-guide.md docs/probes/custom-authoring-guide.md docs/processors/custom-authoring-guide.md docs/qaas/userInterfaces/runner/configurationSections/assertions/overview.md docs/qaas/userInterfaces/runner/schema-extensions.md`
  - `npx --yes markdownlint-cli2 docs/qaas/advancedConcepts/configurationAsCode.md docs/qaas/advancedConcepts/globalDictionary.md docs/qaas/advancedConcepts/liveSessionData.md docs/qaas/advancedConcepts/stages.md docs/qaas/quickStart/writeHooks.md`
- A broader post-semantic local refresh also passed:
  - `bash tools/ci/check-frontmatter.sh`: OK.
  - `python tools/ci/check-page-headings.py`: 485 pages.
  - `python tools/ci/check-reference-skeleton.py`: 435 reference pages.
  - `python tools/ci/check-example-density.py`: 148 pages.
  - `python tools/ci/check-nav-structure.py`: 489 nav pages.
  - `python tools/ci/check-offline-readiness.py`: 485 pages.
  - `python tools/ci/check-heading-anchors.py`: 3324 headings.
  - `python tools/ci/check-verification-markers.py`: 399 source-derived reference pages.
  - `yamllint -c tools/ci/yamllint.yml mkdocs.yml .github/workflows/ci.yml .github/workflows/docs.yml`: passed.
  - `bash tools/ci/validate-yaml-snippets.sh`: 277 YAML blocks after rerunning with the longer local timeout.
  - `bash tools/ci/compile-csharp-snippets.sh`: 80 C# snippets.
  - `bash tools/ci/probe-csharp-snippet-semantics.sh`: 80 snippets from 18 pages, 366 references, 31 imports, 0 failed snippets, 0 failed pages.
  - `bash tools/ci/pre-commit.sh`: markdownlint checked 485 docs with 0 errors; strict MkDocs build passed; llms build produced 485 pages and 5 shards; `check-llmstxt` passed; `prepare-site-check-root` passed; offline lychee checked 266041 total links, 5726 unique links, 0 errors, and 2481 excluded.
- Refreshed the qaas-docs graph after the semantic probe, authored example remediation, and evidence update:
  - `graphify update D:\QaaS\qaas-docs` passed.
  - AST extraction completed for 582/582 files.
  - Rebuilt graph: 9877 nodes, 13615 edges, 698 communities.
  - `graph.html` visualization was skipped because the graph exceeds the default 5000-node visualization limit; `graph.json` and `GRAPH_REPORT.md` were still updated.

### Current ultrareview local gate refresh

- Re-ran the local v2 ultrareview ground-truth checks on 2026-05-23 at 11:00 +03:00:
  - `bash tools/ci/check-frontmatter.sh`: OK.
  - `python tools/ci/check-catalog-coverage.py`: 72 hooks.
  - `python tools/ci/check-reference-skeleton.py`: 435 reference pages.
  - `python tools/ci/check-example-density.py`: 148 pages.
  - `python tools/ci/check-nav-structure.py`: 489 nav pages.
  - `python tools/ci/check-offline-readiness.py`: 485 pages.
  - `python tools/ci/check-heading-anchors.py`: 3324 headings.
  - `python tools/ci/check-verification-markers.py`: 399 source-derived reference pages.
  - `npx --yes markdownlint-cli2 "docs/**/*.md" "#docs/_generated/**"`: 485 files, 0 errors.
  - `yamllint -c tools/ci/yamllint.yml mkdocs.yml .github/workflows/ci.yml .github/workflows/docs.yml`: passed.
  - `D:\QaaS\_tmp\actionlint-20260523\actionlint.exe -color=false .github/workflows/ci.yml .github/workflows/docs.yml`: passed with no findings.
  - `bash tools/ci/compile-csharp-snippets.sh`: 80 C# snippets.
  - `bash tools/ci/probe-csharp-snippet-semantics.sh`: 80 snippets from 18 pages, 0 failed snippets/pages.
  - `bash tools/ci/validate-yaml-snippets.sh`: 277 YAML blocks.
  - `mkdocs build --strict --site-dir site`: passed with only the existing Material for MkDocs 2.0 notice.
  - `python tools/build_llmstxt.py --site-dir site; bash tools/ci/check-llmstxt.sh site`: 485 pages, 5 shards, `[check-llmstxt] OK`.
  - `bash tools/ci/prepare-site-check-root.sh site site-check qaas-docs`: passed.
  - `D:\QaaS\_tmp\qaas-docs-link-tools\htmltest-v0.17.0\htmltest.exe -c tools\ci\htmltest.yml`: passed on 490 documents.
  - `D:\QaaS\_tmp\qaas-docs-link-tools\lychee-v0.24.2\lychee-x86_64-pc-windows-msvc\lychee.exe --offline --config tools\ci\lychee.toml --root-dir "$PWD\site-check" "site-check/**/*.html"`: 266041 total links, 5726 unique links, 0 errors, 2481 excluded.
  - Full v2 forbidden phrase scan over `docs`, `tools`, `.github`, `mkdocs.yml`, `requirements.txt`, `.markdownlint.json`, and `.vale.ini` returned no matches outside excluded generated/build outputs.
  - `rg -n "ai_summary|docs/_meta|docs\\_meta" docs tools .github mkdocs.yml requirements.txt .markdownlint.json .vale.ini ...` returned no matches.
  - Public-surface leak scan over authored docs returned no matches for `internal|private|protected` type declarations.
- PR #43 read-only state is unchanged after the local review run: open, not draft, merge state `BLOCKED`, remote head `5ad8c8b7b068fb253a238b142a8ffc180a8be496`, updated `2026-05-19T18:38:55Z`, and checks are the stale May 19 rollup rather than current local work.
- Rechecked PR #43 read-only again after the PackageMirror check-only workflow hardening:
  - `gh pr view 43 --repo TheSmokeTeam/qaas-docs --json url,state,isDraft,mergeStateStatus,headRefName,headRefOid,baseRefName,updatedAt,statusCheckRollup,reviewDecision,latestReviews` reports state `OPEN`, not draft, merge state `BLOCKED`, review decision `REVIEW_REQUIRED`, base `master`, remote head `feature/document-actions` at `5ad8c8b7b068fb253a238b142a8ffc180a8be496`, updated `2026-05-19T18:38:55Z`.
  - `gh pr checks 43 --repo TheSmokeTeam/qaas-docs` still shows the stale 2026-05-19 rollup for the remote head: two `build-site` passes and skipped `deploy-pages`, `publish-docker-image`, and `update-repository-overview` jobs.
  - `git rev-parse HEAD` is `b3b1fd91faec983ff987ecca9e18235514e99f97`; `git rev-parse origin/feature/document-actions` is `5ad8c8b7b068fb253a238b142a8ffc180a8be496`; `git rev-list --left-right --count origin/feature/document-actions...HEAD` reports `0 23`.
  - Parent `qaas-docs` status count remains 548 entries; nested `tools/QaaS.Docs.Generator` remains at detached `1dab1919adbd8b7e2624a5c483664a23537a188f` with 15 status entries.

### Authorization runbook

- Added `planning/v2-authorization-runbook.md` as the explicit post-authorization branch and commit strategy. It records that no git mutation has been performed.
- The runbook keeps PR #43 on `qaas-docs` branch `feature/document-actions`, requires nested generator commits before staging the parent gitlink, and excludes `NUL`, build outputs, local graph outputs, and temporary JSON files.
- The nested `tools/QaaS.Docs.Generator` strategy is to create a named branch from detached `HEAD` at `1dab1919adbd8b7e2624a5c483664a23537a188f` before committing its three mapped chunks.
- The PackageMirror strategy is to create a feature branch before committing its workflow-guard and dependency-refresh chunks, then handle it as a separate PR after the docs PR path is current unless the user explicitly parallelizes it.
- The source-repo strategy distinguishes current states:
  - `QaaS.Common.Probes` only has untracked `graphify-out/`; do not push it for docs v2 unless graph artifacts are intentionally part of that repo policy.
  - `QaaS.Framework` needs a fresh source-doc branch before committing its two dirty source files.
  - `QaaS.Mocker` needs a source-doc branch decision before committing its two dirty builder files.
  - `QaaS.Runner` needs a fresh source-doc branch before committing builder/configuration documentation surfaces, and `AGENTS.md` needs an explicit staging decision.
- The weekly freshness strategy records that the direct run proves docs-specific checks locally, while the natural scheduled run remains unproven until 2026-05-25 09:00 and global npm/winget drift is separate machine maintenance unless the user authorizes broad global updates.

### Multi-repo dirty-state refresh

- Re-ran a read-only scan across every `D:\QaaS` child repository with `.git` after the PackageMirror workflow hardening. No fetch, checkout, reset, clean, stage, commit, push, or merge was performed.
- Current dirty repository summary:
  - `DummyAppTests`: `DummyAppTests/test.qaas.yaml` plus untracked `DummyAppTests/Variables/`.
  - `qaas-docs`: 548 status entries; local branch remains 0 behind / 23 ahead of `origin/feature/document-actions`.
  - `qaas-orchestrator`, `QaaS.Common.Assertions`, `QaaS.Common.Generators`, `QaaS.Common.Processors`, `QaaS.Docs.Generator`, `QaaS.ElasticBootstrap`, `QaaS.JsonSchemaExtensions`, and `Qaas.Mocker.CommunicationObjects`: dirty only because `graphify-out/` is untracked.
  - `QaaS.Common.Probes`: dirty only because `graphify-out/` is untracked and no upstream is configured.
  - `QaaS.Framework`: two dirty source-doc files plus untracked `graphify-out/`; no upstream is configured.
  - `QaaS.Mocker`: dirty `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`, `QaaS.Mocker/ExecutionBuilder.cs`, plus untracked `graphify-out/`.
  - `QaaS.PackageMirror`: dirty workflow/project/schema files plus untracked `graphify-out/`.
  - `QaaS.Runner`: 11 dirty builder/configuration source files, untracked `AGENTS.md`, and untracked `graphify-out/`; no upstream is configured.

### PackageMirror bytecheck

- Added `planning/v2-packagemirror-bytecheck.md` after running a temp-only PackageMirror-style docs regeneration check.
- Temporary workspace: `D:\QaaS\_tmp\packagemirror-docs-check-20260523-111404`.
- Exported the PackageMirror state tags with `git archive`:
  - `QaaS.Runner@4.4.0` -> `39d25aa1f7547e9747c26f627c29fc709aa7fc02`.
  - `QaaS.Mocker@2.3.0` -> `a42c4852f684179750390045e8be238220244a2a`.
  - `QaaS.Framework@1.4.4` -> `468b6a2f90c5b659a0341177789e5bf8ad9119a2`.
  - `QaaS.Common.Assertions@3.4.0` -> `de7b1d16087833ab4d7c4ea3503e7af28f26fdc3`.
  - `QaaS.Common.Generators@3.4.0` -> `2c3ca1ecd7284c188f528e7afbd81e18d117fda5`.
  - `QaaS.Common.Probes@1.4.0` -> `89f20b38784c59e98723396010cdd77248a77d7a`.
  - `QaaS.Common.Processors@1.4.0` -> `06c7c844edaa1b5703f0aeb75a759cf402e76619`.
- Ran the PackageMirror-shaped docs generator command in the temp workspace with `--check --build-site`; it failed because generated reference docs are not byte-identical against the current qaas-docs tree when using the PackageMirror state tags.
- Ran the generator in temp write mode and compared `temp\qaas-docs\docs` back to `D:\QaaS\qaas-docs\docs`: 107 files differed, with no added or missing files. Drift is concentrated in the mirrored runner schema asset and generated Framework, Mocker, and Runner builder reference pages.
- The PackageMirror v2 artifact guard passed on the temp regenerated docs and failed as expected when `docs/_meta/.keep` or `ai_summary:` frontmatter was seeded, then passed again after removing those temp fixtures.
- Re-ran qaas-docs workflow linting after the PackageMirror workflow hardening:
  - `D:\QaaS\_tmp\actionlint-20260523\actionlint.exe -color=false .github/workflows/ci.yml .github/workflows/docs.yml`: passed with no findings.
  - `yamllint -c tools\ci\yamllint.yml .github\workflows\ci.yml .github\workflows\docs.yml`: passed.
  - `rg -n "TODO|FIXME|HACK|docs_drift_check_only|ai_summary|docs/_meta|docs\\_meta" .github/workflows/ci.yml .github/workflows/docs.yml`: no matches.
- Re-ran the evidence hygiene checks for the current planning files:
  - `npx --yes markdownlint-cli2 planning/v2-local-verification-current.md planning/v2-completion-audit.md planning/v2-ultrareview-current.md planning/v2-commit-split-map.md planning/v2-authorization-runbook.md planning/v2-packagemirror-bytecheck.md`: 6 files, 0 errors.
  - `git diff --check -- planning/v2-local-verification-current.md planning/v2-completion-audit.md planning/v2-ultrareview-current.md planning/v2-commit-split-map.md planning/v2-authorization-runbook.md planning/v2-packagemirror-bytecheck.md`: passed.
  - `rg -n "[ \t]+$" ...`: no trailing-whitespace matches.
- Re-ran the qaas-docs graph refresh after the bytecheck evidence update and recorded the latest rerun result:
  - `graphify update D:\QaaS\qaas-docs` passed.
  - AST extraction completed for 583/583 files.
  - Latest graph rebuild: 9891 nodes, 13631 edges, 702 communities.
  - `graph.html` visualization was skipped because the graph exceeds the default 5000-node visualization limit; `graph.json` and `GRAPH_REPORT.md` were updated.

## Remaining proof gaps

- PR #43 remote state was inspected read-only:
  - URL: `https://github.com/TheSmokeTeam/qaas-docs/pull/43`
  - State: open, not draft, merge state reported as `BLOCKED`; latest read-only refresh also reports review decision `REVIEW_REQUIRED`.
  - Remote head branch: `feature/document-actions`.
  - Remote head seen locally as `origin/feature/document-actions` at `5ad8c8b7b068fb253a238b142a8ffc180a8be496`.
  - Local branch head: `b3b1fd91faec983ff987ecca9e18235514e99f97`.
  - Local branch is ahead of origin by 23 commits and has substantial uncommitted work, so current local evidence is not yet represented in PR #43.
  - Existing remote checks shown by `gh pr checks 43` are from 2026-05-19 and only prove the older remote state. They do not prove the current local v2 work.
- PR preview deployment was not verified for the current local state because the current local work has not been pushed.
- Atomic commits, push, merge, and post-merge checks remain unperformed because this session has no explicit commit/push authorization.
- The formal v2 ultrareview loop has not produced a current 10/10 pass report; the installed `ultrareview` skill has been updated to the v2 contract, but `planning/v2-ultrareview-current.md` still fails the current state on PR hygiene and remote proof.
- The current `tools/ci/compile-csharp-snippets.sh` gate validates C# snippet syntax with Roslyn and still passes for 80 snippets. Semantic compilation is now proven locally by the standalone `tools/ci/probe-csharp-snippet-semantics.sh` probe against current sibling QaaS assemblies, but that semantic probe is not yet a CI gate and the remote PR has not run current local work.
- Docker-based ZIM build and Docker-based `kiwix-serve` smoke now pass locally, but the remote PR workflow has not run the corrected commands because the current local work has not been pushed.
- The weekly sweep script now passes on direct invocation, but the scheduled task has not yet run on its Monday trigger and the generated report still lists stale global packages/tools outside the docs-specific checks.
- Graphify refreshed the current qaas-docs graph after the bytecheck evidence update: 583/583 files extracted, 9891 nodes, 13631 edges, 702 communities. The previous skill/package mismatch warning no longer appears.
