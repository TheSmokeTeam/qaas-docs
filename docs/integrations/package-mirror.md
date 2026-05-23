---
id: integrations.package-mirror
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner, framework, mocker, assertions, generators, probes, processors, jsonschema]
keywords: [packagemirror, nuget, schemas, release, restore artifacts]
summary: "Operate QaaS.PackageMirror to rebuild mirrored NuGet packages, family schemas, release assets, and synced docs references."
---
<!-- Verified-against: QaaS.PackageMirror\README.md -->
<!-- Verified-against: QaaS.PackageMirror\QaaS.PackageMirror.Tools\README.md -->
<!-- Verified-against: QaaS.PackageMirror\QaaS.PackageMirror.Tools\Program.cs -->

# PackageMirror

> TL;DR — Use `QaaS.PackageMirror.Tools` when you need to rebuild mirrored NuGet packages, regenerate Runner and Mocker family schemas, or preview release assets without publishing them.

## When to use {: #when-to-use}

- You need an air-gapped NuGet source that contains the QaaS packages and their restored external dependencies.
- You need the latest `runner-family` or `mocker-family` JSON schema artifacts for editor mapping or docs generation.
- You want to preview the next mirror release bundle before a GitHub release is published.

`QaaS.PackageMirror` owns three outputs that downstream docs and test projects consume:

| Output | Path | Use |
|---|---|---|
| Mirrored QaaS packages | `packages/qaas/<package-id>/<version>/...` | Local NuGet feed entries for QaaS packages. |
| Mirrored dependency packages | `packages/not-qaas/<package-id>/<version>/...` | External package versions used by the tracked QaaS repositories. |
| Family schema artifacts | `schemas/<family>/latest/{schema.json,docs-manifest.json,hook-catalog.json}` | Runner and Mocker schema downloads plus docs-generator contracts. |

## YAML configuration {: #yaml-configuration}

No QaaS YAML is required to run PackageMirror. CI invokes the C# tool directly from PowerShell or a shell step.

```yaml
name: PackageMirror schema refresh

on:
  workflow_dispatch:

jobs:
  schemas:
    runs-on: windows-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-dotnet@v4
        with:
          dotnet-version: 10.0.x

      - name: Regenerate family schemas
        run: >
          dotnet run
          --project .\QaaS.PackageMirror.Tools\QaaS.PackageMirror.Tools.csproj
          --
          generate-family-schemas
          --mirror-root $PWD
```

## Minimal example {: #minimal-example}

Regenerate the local schema families without touching packages or releases:

```powershell
dotnet run `
  --project .\QaaS.PackageMirror.Tools\QaaS.PackageMirror.Tools.csproj `
  -- `
  generate-family-schemas `
  --mirror-root $PWD
```

This writes the current schema outputs under:

- `schemas/runner-family/latest/schema.json`
- `schemas/runner-family/latest/docs-manifest.json`
- `schemas/runner-family/latest/hook-catalog.json`
- `schemas/mocker-family/latest/schema.json`
- `schemas/mocker-family/latest/docs-manifest.json`
- `schemas/mocker-family/latest/hook-catalog.json`

## Realistic example {: #realistic-example}

Preview the release assets that a full mirror run would attach, but keep publishing disabled:

```powershell
dotnet run `
  --project .\QaaS.PackageMirror.Tools\QaaS.PackageMirror.Tools.csproj `
  -- `
  publish-mirror-release `
  --workspace-root $PWD `
  --github-repository TheSmokeTeam/QaaS.PackageMirror `
  --skip-publish
```

Use `sync-restored-packages` only from an environment that can read the tracked repositories' `restored-packages` artifacts:

```powershell
dotnet run `
  --project .\QaaS.PackageMirror.Tools\QaaS.PackageMirror.Tools.csproj `
  -- `
  sync-restored-packages `
  --github-token $env:PACKAGE_MIRROR_TOKEN
```

The token must be able to read workflow artifacts from the tracked source repositories and push the mirror updates when a full sync changes files.

## Edge cases {: #edge-cases}

- `QaaS.Runner` is the tracked repository that does not prefer stable source tags during mirror selection.
- Full sync removes the existing package mirror folders before rebuilding them, so stale dependency versions do not survive a successful run.
- `QaaS.ElasticBootstrap` is excluded from the published QaaS bootstrap package set.
- Docs regeneration uses the family schema artifacts and hook catalog contracts under `schemas/<family>/latest`.

## See also {: #see-also}

- [CI Pipeline](ci-pipeline.md)
- [Runner schema extensions](../qaas/userInterfaces/runner/schema-extensions.md)
- [Kiwix MCP](kiwix-mcp.md)
