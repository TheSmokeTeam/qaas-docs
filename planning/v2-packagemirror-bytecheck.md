# v2 PackageMirror Bytecheck

Date: 2026-05-23

Purpose: verify how close the current qaas-docs v2 tree is to the docs that `QaaS.PackageMirror` would regenerate from the package mirror's recorded source refs. This file is evidence only; no git mutation was performed.

## Inputs

PackageMirror state refs used:

| Repo | State tag | Commit resolved locally |
|---|---|---|
| `QaaS.Runner` | `4.4.0` | `39d25aa1f7547e9747c26f627c29fc709aa7fc02` |
| `QaaS.Mocker` | `2.3.0` | `a42c4852f684179750390045e8be238220244a2a` |
| `QaaS.Framework` | `1.4.4` | `468b6a2f90c5b659a0341177789e5bf8ad9119a2` |
| `QaaS.Common.Assertions` | `3.4.0` | `de7b1d16087833ab4d7c4ea3503e7af28f26fdc3` |
| `QaaS.Common.Generators` | `3.4.0` | `2c3ca1ecd7284c188f528e7afbd81e18d117fda5` |
| `QaaS.Common.Probes` | `1.4.0` | `89f20b38784c59e98723396010cdd77248a77d7a` |
| `QaaS.Common.Processors` | `1.4.0` | `06c7c844edaa1b5703f0aeb75a759cf402e76619` |

Temporary workspace:

- `D:\QaaS\_tmp\packagemirror-docs-check-20260523-111404`.

Setup:

- Copied the current `D:\QaaS\qaas-docs` working tree into the temporary workspace, excluding `.git`, `site`, `site-check`, `graphify-out`, build outputs, and `NUL`.
- Exported the PackageMirror state tags into sibling source directories with `git archive`.
- Used the current local docs generator from the copied qaas-docs tree.

## Check Mode Result

Command shape matched the PackageMirror workflow and added `--check --build-site`:

```powershell
dotnet run --project <temp>\qaas-docs\tools\QaaS.Docs.Generator\QaaS.Docs.Tools\QaaS.Docs.Tools.csproj -- generate-reference-docs `
  --docs-root <temp>\qaas-docs `
  --mirror-root D:\QaaS\QaaS.PackageMirror `
  --runner-root <temp>\QaaS.Runner `
  --mocker-root <temp>\QaaS.Mocker `
  --framework-root <temp>\QaaS.Framework `
  --assertions-root <temp>\QaaS.Common.Assertions `
  --generators-root <temp>\QaaS.Common.Generators `
  --probes-root <temp>\QaaS.Common.Probes `
  --processors-root <temp>\QaaS.Common.Processors `
  --skip-cli-snapshot-refresh `
  --check `
  --build-site
```

Result: failed in check mode. The first reported drift was generated function reference pages, including:

- `docs\qaas\functions\builders\assertions.md`
- `docs\qaas\functions\builders\collectors.md`
- `docs\qaas\functions\builders\consumers.md`
- `docs\qaas\functions\builders\executions.md`
- `docs\qaas\functions\builders\links.md`
- `docs\qaas\functions\builders\mocker-commands.md`
- `docs\qaas\functions\builders\probes.md`
- `docs\qaas\functions\builders\publishers.md`
- `docs\qaas\functions\builders\sessions.md`
- `docs\qaas\functions\builders\storages.md`
- `docs\qaas\functions\builders\transactions.md`
- `docs\mocker\functions\builders\executions.md`
- `docs\mocker\functions\builders\transaction-stubs.md`
- `docs\framework\functions\builders\data-sources.md`
- `docs\framework\functions\builders\policies.md`

## Write Mode Diff Count

After running the same generator command in the temporary workspace without `--check`, comparing `temp\qaas-docs\docs` back to the real current `D:\QaaS\qaas-docs\docs` found:

- `107` different files.
- No added files.
- No missing files.

The changed set is concentrated in:

- `docs\assets\schemas\runner-family-schema.json`
- generated Framework builder reference pages
- generated Mocker builder reference pages
- generated Runner builder reference pages

Sample drift from `docs\qaas\functions\builders\assertions.md`: generation from PackageMirror state refs adds generic method guidance lines such as "Use this method when working with the documented Runner assertion builder API surface in code..." that are not present in the current qaas-docs tree.

## V2 Guard Result

The PackageMirror v2 guard behavior is proven locally against the temporary regenerated docs:

- Positive guard: passed with no `docs/_meta` directory and no `ai_summary:` frontmatter.
- Negative guard with seeded `docs/_meta/.keep`: failed as expected.
- Negative guard with seeded `ai_summary:` frontmatter: failed as expected.
- Final guard after removing fixtures: passed again.

## Workflow Check-Only Path

The local PackageMirror workflow now has a dispatch-only byte-drift proof path:

- `workflow_dispatch` input `docs_drift_check_only` enables docs sync even when a docs PR is not requested.
- The docs regeneration step appends `--check` to `generate-reference-docs` when `docs_drift_check_only` is true.
- `Commit docs updates`, `Push docs feature branch`, and `Create docs pull request` do not run in check-only mode.
- `Commit updated mirror contents`, `Push updated mirror contents`, and `Publish mirror release` do not run in check-only mode, so leaving `publish_release` at its default `true` cannot publish a mirror release during a docs drift proof.
- The existing write-and-PR path remains available when `create_docs_pr` is true and `docs_drift_check_only` is false.

Local verification after adding the workflow path:

- `yamllint -c D:\QaaS\qaas-docs\tools\ci\yamllint.yml .github\workflows\sync-packages.yml`: passed.
- `python -c "import pathlib, yaml; yaml.safe_load(...)"`: parsed the workflow.
- PowerShell parser validation accepted the regenerated-docs script block.
- `git diff --check -- .github\workflows\sync-packages.yml`: passed with CRLF normalization warnings only.
- `dotnet build .\QaaS.PackageMirror.sln -c Release --nologo -clp:ErrorsOnly`: passed with 0 errors and 144 warnings.
- `dotnet test .\QaaS.PackageMirror.sln -c Release --nologo --no-build -clp:ErrorsOnly`: passed 15 tests.
- `graphify update D:\QaaS\QaaS.PackageMirror`: passed with 182/182 files extracted and no code-graph topology changes detected.
- Temporary `actionlint` 1.7.12 was downloaded from the official `rhysd/actionlint` GitHub release into `D:\QaaS\_tmp\actionlint-20260523`.
- `D:\QaaS\_tmp\actionlint-20260523\actionlint.exe -color=false .github/workflows/sync-packages.yml`: passed with no findings.
- After tightening check-only mode to skip mirror commits and mirror releases, `actionlint`, `yamllint`, PyYAML parsing, PowerShell parser validation, `git diff --check`, trailing-whitespace scan, Release build, and Release tests passed again.

## Conclusion

PackageMirror's v2 artifact guard and local check-only workflow path are locally proven, but byte-identical regeneration from the current PackageMirror state refs is not proven. The drift is expected until the source-doc polish and docs v2 generator changes are committed, pushed, merged, and the PackageMirror state/docs sync path is rerun against the final refs.
