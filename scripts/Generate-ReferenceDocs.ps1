param(
    [string]$DocsRoot = (Split-Path -Parent $PSScriptRoot),
    [string]$MirrorRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.PackageMirror'),
    [string]$RunnerRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.Runner'),
    [string]$MockerRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.Mocker'),
    [string]$FrameworkRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.Framework'),
    [switch]$SkipCliSnapshotRefresh,
    [switch]$Check,
    [switch]$BuildSite
)

$ErrorActionPreference = 'Stop'

# Regenerates the deterministic Runner, Mocker, and Framework reference pages from:
# - committed mirror schema contracts
# - freshly captured CLI snapshots
# - the current source trees used for the annotated function reference pages
# Run this after updating the committed CLI snapshots or mirror schema artifacts.

# This script captures committed CLI snapshots from the current Runner, Mocker, and Framework
# source trees before rendering docs, so flag descriptions and help output stay in sync with the
# workspace without maintaining docs-only exporters in the product repositories.
# Function grouping and inclusion now come from source-level XML documentation in the sibling
# product repositories, so update those annotations when the public API surface changes, then
# rerun this script to regenerate the markdown pages.

$generatorProject = Join-Path $DocsRoot 'tools\QaaS.Docs.Generator\QaaS.Docs.Generator.csproj'
if (-not (Test-Path $generatorProject)) {
    throw "QaaS.Docs.Generator is missing. Initialize the docs repo submodule before running this script."
}

$refreshSnapshotsScript = Join-Path $PSScriptRoot 'Refresh-CliSnapshots.ps1'
if (-not (Test-Path $refreshSnapshotsScript)) {
    throw "Refresh-CliSnapshots.ps1 is missing from $PSScriptRoot"
}

if (-not $SkipCliSnapshotRefresh) {
    & $refreshSnapshotsScript `
        -DocsRoot $DocsRoot `
        -RunnerRoot $RunnerRoot `
        -MockerRoot $MockerRoot `
        -FrameworkRoot $FrameworkRoot
}

$generatorArgs = @(
    'run',
    '--project', $generatorProject,
    '--configuration', 'Release',
    '--',
    '--docs-root', $DocsRoot,
    '--mirror-root', $MirrorRoot,
    '--runner-root', $RunnerRoot,
    '--mocker-root', $MockerRoot,
    '--framework-root', $FrameworkRoot
)

if ($Check) {
    $generatorArgs += '--check'
}

dotnet @generatorArgs
if ($LASTEXITCODE -ne 0) { throw 'Docs generator failed.' }

& (Join-Path $PSScriptRoot 'Sync-HookConfigDocs.ps1') `
    -DocsRoot $DocsRoot `
    -MirrorRoot $MirrorRoot `
    -Check:$Check
if ($LASTEXITCODE -ne 0) { throw 'Hook config docs sync failed.' }

if ($BuildSite) {
    Push-Location $DocsRoot
    try {
        mkdocs build
        if ($LASTEXITCODE -ne 0) { throw 'mkdocs build failed.' }
    }
    finally {
        Pop-Location
    }
}
