# v2 Authorization Runbook

Date: 2026-05-23

Purpose: define the exact branch and commit strategy for the first git-mutating pass after the user explicitly authorizes staging, committing, pushing, or PR updates. This file is evidence only; no git mutation has been performed.

## Guardrails

- Do not stage, commit, push, merge, tag, reset, clean, or rewrite history without explicit authorization.
- Keep each repository's history separate.
- Do not include generated build output: `site/`, `site-check/`, `bin/`, `obj/`, `_tmp/`, `TestResults/`, or local graph visualization output.
- Re-run the local docs gates before the first push and after any conflict resolution.

## qaas-docs

Repository: `D:\QaaS\qaas-docs`.

Current branch: `feature/document-actions`.

Strategy after authorization:

1. Keep using `feature/document-actions`; this is PR #43's head branch.
2. Commit parent repo chunks in the order recorded in `planning/v2-commit-split-map.md`.
3. Commit the nested generator repo before staging the parent `tools/QaaS.Docs.Generator` gitlink update.
4. Exclude `NUL`, `site/`, `site-check/`, `graphify-out/`, and temporary `planning/.tmp-*.json` files.
5. Push only after all mapped chunks are committed and local gates pass.

## Nested Docs Generator

Repository: `D:\QaaS\qaas-docs\tools\QaaS.Docs.Generator`.

Current state: detached `HEAD` at `1dab1919adbd8b7e2624a5c483664a23537a188f`.

Strategy after authorization:

1. Create a named branch before committing, for example `codex/qaas-docs-v2-generator`.
2. Commit the three generator chunks from `planning/v2-commit-split-map.md`.
3. Run generator build/tests and formatting checks after the commits.
4. Return to the parent `qaas-docs` repo and stage the gitlink update as part of the relevant docs commit.

## QaaS.PackageMirror

Repository: `D:\QaaS\QaaS.PackageMirror`.

Current branch: `master` with local v2 PackageMirror changes.

Current bytecheck status:

- `planning/v2-packagemirror-bytecheck.md` proves the v2 guard in positive and negative temp tests.
- The local workflow now includes `docs_drift_check_only`, which enables docs regeneration in `--check` mode and skips docs commit/PR creation, mirror-content commits, and mirror release publishing.
- The same temp check shows PackageMirror-state regeneration is not byte-identical yet: 107 docs files differ when regenerating from the current `state/*.json` tags.

Strategy after authorization:

1. Create a feature branch before committing, for example `codex/qaas-docs-v2-packagemirror`.
2. Commit the workflow guard/check-only path and dependency-refresh chunks separately as mapped in `planning/v2-commit-split-map.md`.
3. Run restore/build/test/yamllint/guard simulation again before any push.
4. Rerun the PackageMirror bytecheck after the docs/source-ref state is final; do not claim byte-identical regeneration until that check passes.
5. Open or update a separate PackageMirror PR only after the docs PR path is current, unless the user explicitly asks to parallelize it.

## QaaS.Common.Probes

Repository: `D:\QaaS\QaaS.Common.Probes`.

Current branch: `codex/fix-probe-schema-descriptions`; configured upstream is gone.

Current dirty state: untracked `graphify-out/` only.

Strategy after authorization:

1. Do not push this branch for the docs v2 work unless graph artifacts are intentionally part of that repo's policy.
2. Keep the untracked graph output out of source/doc PRs.
3. If this repo later needs source changes, create a fresh branch from the intended base and commit only reviewed source changes.

## QaaS.Framework

Repository: `D:\QaaS\QaaS.Framework`.

Current branch: `codex/fix-mongo-config-description`; configured upstream is gone.

Current dirty source files:

- `QaaS.Framework.Policies/PolicyBuilder.cs`.
- `QaaS.Framework.SDK/DataSourceObjects/DataSourceBuilder.cs`.

Strategy after authorization:

1. Create a fresh source-doc branch before committing, for example `codex/qaas-docs-v2-framework-source-docs`.
2. Commit only the source-comment/public-doc polish that is required for generated docs fidelity.
3. Exclude `graphify-out/` unless graph artifacts are explicitly requested.
4. Run `dotnet build` and `dotnet test --no-build` for the Framework solution before any push.

## QaaS.Mocker

Repository: `D:\QaaS\QaaS.Mocker`.

Current branch: `codex/configurable-docker-inputs`.

Current dirty source files:

- `QaaS.Mocker.Stubs/ConfigurationObjects/TransactionStubBuilder.cs`.
- `QaaS.Mocker/ExecutionBuilder.cs`.

Strategy after authorization:

1. Decide whether to commit these source-doc changes on the existing configurable-docker-inputs branch or move them to a fresh source-doc branch, for example `codex/qaas-docs-v2-mocker-source-docs`.
2. Commit only the XML-doc/source-comment polish that is required for generated docs fidelity.
3. Exclude `graphify-out/` unless graph artifacts are explicitly requested.
4. Run `dotnet build` and `dotnet test --no-build` for the Mocker solution before any push.

## QaaS.Runner

Repository: `D:\QaaS\QaaS.Runner`.

Current branch: `codex/fix-publisher-iteration-doc`; configured upstream is gone.

Current dirty source files are builder/configuration documentation surfaces plus local `AGENTS.md` and untracked `graphify-out/`.

Strategy after authorization:

1. Create a fresh source-doc branch before committing, for example `codex/qaas-docs-v2-runner-source-docs`.
2. Commit only the source-comment/public-doc polish that is required for generated docs fidelity.
3. Decide explicitly whether `AGENTS.md` belongs in the repo before staging it.
4. Exclude `graphify-out/` unless graph artifacts are explicitly requested.
5. Run `dotnet build` and `dotnet test --no-build` for the Runner solution before any push.

## Weekly Freshness

Current state:

- `QaaS Weekly Sweep` is registered and ready.
- Its next scheduled run is 2026-05-25 09:00.
- The direct run produced `C:\Users\eldar\upgrade-report.md` on 2026-05-23 and the docs-specific sections passed.
- The report still lists global npm and winget drift outside the qaas-docs build path.

Strategy:

1. Treat docs-specific weekly verification as locally proven by direct run.
2. Treat the natural scheduled run as unproven until 2026-05-25 09:00 completes.
3. Treat global npm/winget drift as a separate machine-maintenance item unless the user explicitly authorizes broad global updates.
