param(
    [string]$DocsRoot = (Split-Path -Parent $PSScriptRoot),
    [string]$MirrorRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.PackageMirror'),
    [string]$RunnerRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.Runner'),
    [string]$MockerRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.Mocker'),
    [string]$FrameworkRoot = (Join-Path (Split-Path -Parent $PSScriptRoot) '..\QaaS.Framework'),
    [switch]$Check,
    [switch]$BuildSite
)

$ErrorActionPreference = 'Stop'

# Regenerates the deterministic Runner, Mocker, and Framework reference pages from:
# - committed mirror schema contracts
# - committed CLI snapshots
# - the current source trees used for the function catalog
# Run this after refreshing CLI snapshots or mirror schema artifacts.

# This script intentionally consumes committed CLI snapshots from QaaS.Docs.Generator instead of
# building documentation exporters inside QaaS.Runner or QaaS.Mocker.
# Refresh those snapshots with scripts/Refresh-CliSnapshots.ps1 only when the CLI help output or
# option surface changes, then rerun this script to regenerate the markdown pages.

$generatorArgs = @(
    'run',
    '--project', (Join-Path $DocsRoot 'tools\QaaS.Docs.Generator\QaaS.Docs.Generator.csproj'),
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
