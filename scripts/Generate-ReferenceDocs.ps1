param(
    [string]$DocsRoot,
    [string]$MirrorRoot,
    [string]$RunnerRoot,
    [string]$MockerRoot,
    [string]$FrameworkRoot,
    [string]$AssertionsRoot,
    [string]$GeneratorsRoot,
    [string]$ProbesRoot,
    [string]$ProcessorsRoot,
    [switch]$SkipCliSnapshotRefresh,
    [switch]$Check,
    [switch]$BuildSite
)

$ErrorActionPreference = 'Stop'

function Resolve-NormalizedPath {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    $resolvedPath = Resolve-Path -LiteralPath $Path -ErrorAction SilentlyContinue
    if ($null -ne $resolvedPath) {
        return $resolvedPath.ProviderPath
    }

    return [System.IO.Path]::GetFullPath($Path)
}

$workspaceRoot = Resolve-NormalizedPath (Join-Path (Split-Path -Parent $PSScriptRoot) '..')

if ([string]::IsNullOrWhiteSpace($DocsRoot)) {
    $DocsRoot = Split-Path -Parent $PSScriptRoot
}

if ([string]::IsNullOrWhiteSpace($MirrorRoot)) {
    $MirrorRoot = Join-Path $workspaceRoot 'QaaS.PackageMirror'
}

if ([string]::IsNullOrWhiteSpace($RunnerRoot)) {
    $RunnerRoot = Join-Path $workspaceRoot 'QaaS.Runner'
}

if ([string]::IsNullOrWhiteSpace($MockerRoot)) {
    $MockerRoot = Join-Path $workspaceRoot 'QaaS.Mocker'
}

if ([string]::IsNullOrWhiteSpace($FrameworkRoot)) {
    $FrameworkRoot = Join-Path $workspaceRoot 'QaaS.Framework'
}

if ([string]::IsNullOrWhiteSpace($AssertionsRoot)) {
    $AssertionsRoot = Join-Path $workspaceRoot 'QaaS.Common.Assertions'
}

if ([string]::IsNullOrWhiteSpace($GeneratorsRoot)) {
    $GeneratorsRoot = Join-Path $workspaceRoot 'QaaS.Common.Generators'
}

if ([string]::IsNullOrWhiteSpace($ProbesRoot)) {
    $ProbesRoot = Join-Path $workspaceRoot 'QaaS.Common.Probes'
}

if ([string]::IsNullOrWhiteSpace($ProcessorsRoot)) {
    $ProcessorsRoot = Join-Path $workspaceRoot 'QaaS.Common.Processors'
}

$DocsRoot = Resolve-NormalizedPath $DocsRoot
$MirrorRoot = Resolve-NormalizedPath $MirrorRoot
$RunnerRoot = Resolve-NormalizedPath $RunnerRoot
$MockerRoot = Resolve-NormalizedPath $MockerRoot
$FrameworkRoot = Resolve-NormalizedPath $FrameworkRoot
$AssertionsRoot = Resolve-NormalizedPath $AssertionsRoot
$GeneratorsRoot = Resolve-NormalizedPath $GeneratorsRoot
$ProbesRoot = Resolve-NormalizedPath $ProbesRoot
$ProcessorsRoot = Resolve-NormalizedPath $ProcessorsRoot
$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

function Remove-OrCheckObsoleteGeneratedPath {
    param(
        [Parameter(Mandatory)]
        [string]$RelativePath
    )

    $fullPath = Join-Path $DocsRoot $RelativePath
    if (-not (Test-Path $fullPath)) {
        return
    }

    if ($Check) {
        throw "Obsolete generated docs path still exists: $RelativePath"
    }

    Remove-Item -LiteralPath $fullPath -Recurse -Force
}

# Regenerates the deterministic Runner, Mocker, Framework, and hook changelog reference pages from:
# - committed mirror schema contracts
# - freshly captured CLI snapshots
# - the current source trees used for the annotated function reference pages
# Run this after updating the committed CLI snapshots or mirror schema artifacts.

# This script captures committed CLI snapshots from the current Runner, Mocker, and Framework
# source trees before rendering docs, so flag descriptions and help output stay in sync with the
# workspace without maintaining docs-only exporters in the product repositories.
# Function grouping and inclusion now come from source-level XML documentation in the sibling
# product repositories, and the changelog pages are embedded from the sibling package repositories,
# so update those annotations or changelogs when the public API surface changes, then rerun this
# script to regenerate the markdown pages.

function Get-GeneratedMarkdown {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        return $null
    }

    return (([System.IO.File]::ReadAllText($Path, $Utf8NoBom)) -replace "`r`n", "`n")
}

function Set-OrCheckGeneratedMarkdown {
    param(
        [Parameter(Mandatory)]
        [string]$RelativePath,

        [Parameter(Mandatory)]
        [string]$Content
    )

    $fullPath = Join-Path $DocsRoot $RelativePath
    $normalizedExpected = ($Content.TrimEnd() + "`n") -replace "`r`n", "`n"
    $normalizedCurrent = Get-GeneratedMarkdown -Path $fullPath

    if ($Check) {
        if ($normalizedCurrent -ne $normalizedExpected) {
            throw "Generated docs file is out of date: $RelativePath"
        }

        return
    }

    $directory = Split-Path -Parent $fullPath
    if (-not [string]::IsNullOrWhiteSpace($directory)) {
        New-Item -ItemType Directory -Force -Path $directory | Out-Null
    }

    [System.IO.File]::WriteAllText($fullPath, $normalizedExpected.Replace("`n", [System.Environment]::NewLine), $Utf8NoBom)
}

function Get-ChangelogBody {
    param(
        [Parameter(Mandatory)]
        [string]$RepositoryRoot,

        [Parameter(Mandatory)]
        [string]$RepositoryName
    )

    $changelogPath = Join-Path $RepositoryRoot 'CHANGELOG.md'
    if (-not (Test-Path -LiteralPath $changelogPath)) {
        throw "CHANGELOG.md is missing for $RepositoryName at $RepositoryRoot"
    }

    $content = [System.IO.File]::ReadAllText($changelogPath, $Utf8NoBom)
    $content = $content -replace [char]0xFEFF, ''
    $content = $content -replace '(?is)^\s*#\s+changelog\s*\r?\n+', ''
    return $content.Trim()
}

function Sync-ChangelogPage {
    param(
        [Parameter(Mandatory)]
        [string]$RelativePath,

        [Parameter(Mandatory)]
        [string]$Title,

        [Parameter(Mandatory)]
        [string]$RepositoryRoot,

        [Parameter(Mandatory)]
        [string]$RepositoryName,

        [Parameter(Mandatory)]
        [string]$SourceReference
    )

    $body = Get-ChangelogBody -RepositoryRoot $RepositoryRoot -RepositoryName $RepositoryName
    $content = @(
        "# $Title",
        '',
        "_Generated from $SourceReference `CHANGELOG.md`._",
        '',
        $body
    ) -join "`n"

    Set-OrCheckGeneratedMarkdown -RelativePath $RelativePath -Content $content
}

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

@(
    'docs\qaas\functions\configuration-as-code',
    'docs\qaas\functions\getting-started',
    'docs\qaas\functions\runtime',
    'docs\mocker\functions\configuration-as-code',
    'docs\mocker\functions\getting-started',
    'docs\mocker\functions\runtime',
    'docs\framework\functions\configuration',
    'docs\framework\functions\framework-apis',
    'docs\framework\functions\utilities',
    'docs\hooks\changeLog.md'
) | ForEach-Object {
    Remove-OrCheckObsoleteGeneratedPath -RelativePath $_
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

& (Join-Path $PSScriptRoot 'Sync-SchemaAssets.ps1') `
    -DocsRoot $DocsRoot `
    -MirrorRoot $MirrorRoot `
    -Check:$Check
if ($LASTEXITCODE -ne 0) { throw 'Schema asset sync failed.' }

Sync-ChangelogPage `
    -RelativePath 'docs\qaas\changeLog.md' `
    -Title 'Runner Change Log' `
    -RepositoryRoot $RunnerRoot `
    -RepositoryName 'QaaS.Runner' `
    -SourceReference '[QaaS.Runner]({{ links.repository_runner }})'

Sync-ChangelogPage `
    -RelativePath 'docs\mocker\changeLog.md' `
    -Title 'Mocker Change Log' `
    -RepositoryRoot $MockerRoot `
    -RepositoryName 'QaaS.Mocker' `
    -SourceReference '[QaaS.Mocker]({{ links.repository_mocker }})'

Sync-ChangelogPage `
    -RelativePath 'docs\framework\changeLog.md' `
    -Title 'Framework Change Log' `
    -RepositoryRoot $FrameworkRoot `
    -RepositoryName 'QaaS.Framework' `
    -SourceReference '[QaaS.Framework]({{ links.repository_framework }})'

Sync-ChangelogPage `
    -RelativePath 'docs\assertions\changeLog.md' `
    -Title 'Assertions Change Log' `
    -RepositoryRoot $AssertionsRoot `
    -RepositoryName 'QaaS.Common.Assertions' `
    -SourceReference '[QaaS.Common.Assertions]({{ links.repository_assertions }})'

Sync-ChangelogPage `
    -RelativePath 'docs\generators\changeLog.md' `
    -Title 'Generators Change Log' `
    -RepositoryRoot $GeneratorsRoot `
    -RepositoryName 'QaaS.Common.Generators' `
    -SourceReference '[QaaS.Common.Generators]({{ links.repository_generators }})'

Sync-ChangelogPage `
    -RelativePath 'docs\probes\changeLog.md' `
    -Title 'Probes Change Log' `
    -RepositoryRoot $ProbesRoot `
    -RepositoryName 'QaaS.Common.Probes' `
    -SourceReference '[QaaS.Common.Probes]({{ links.repository_probes }})'

Sync-ChangelogPage `
    -RelativePath 'docs\processors\changeLog.md' `
    -Title 'Processors Change Log' `
    -RepositoryRoot $ProcessorsRoot `
    -RepositoryName 'QaaS.Common.Processors' `
    -SourceReference '[QaaS.Common.Processors]({{ links.repository_processors }})'

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
