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

# Regenerates the deterministic Runner, Mocker, Framework, and hook reference pages from:
# - committed mirror schema contracts
# - freshly captured CLI snapshots
# - the current source trees used for the annotated function reference pages
# Run this after updating the committed CLI snapshots or mirror schema artifacts.

# This script captures committed CLI snapshots from the current Runner, Mocker, and Framework
# source trees before rendering docs, so flag descriptions and help output stay in sync with the
# workspace without maintaining docs-only exporters in the product repositories.
# Function grouping and inclusion now come from source-level XML documentation in the sibling
# product repositories, so update those annotations when the public API surface changes, then rerun
# this script to regenerate the markdown pages.

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

function Get-TrackedDocsContent {
    param(
        [Parameter(Mandatory)]
        [string]$RelativePath
    )

    $gitRelativePath = $RelativePath.Replace('\', '/')
    $content = git -C $DocsRoot show "HEAD:$gitRelativePath" 2>$null
    if ($LASTEXITCODE -ne 0) {
        return $null
    }

    return (($content -join "`n") -replace "`r`n", "`n")
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

function Restore-TrackedDocsPageIfSectionsMissing {
    param(
        [Parameter(Mandatory)]
        [string]$RelativePath,

        [Parameter(Mandatory)]
        [string[]]$RequiredSections
    )

    $currentContent = Get-GeneratedMarkdown -Path (Join-Path $DocsRoot $RelativePath)
    if ([string]::IsNullOrWhiteSpace($currentContent)) {
        return
    }

    $missingSections = @($RequiredSections | Where-Object {
        $section = [regex]::Escape($_)
        $currentContent -notmatch "(?m)^#{2,3} $section$"
    })

    if ($missingSections.Count -eq 0) {
        return
    }

    $trackedContent = Get-TrackedDocsContent -RelativePath $RelativePath
    if ([string]::IsNullOrWhiteSpace($trackedContent)) {
        throw "Generated docs page '$RelativePath' is missing required sections ($($missingSections -join ', ')) and no tracked fallback exists."
    }

    $trackedMissingSections = @($RequiredSections | Where-Object {
        $section = [regex]::Escape($_)
        $trackedContent -notmatch "(?m)^#{2,3} $section$"
    })

    if ($trackedMissingSections.Count -gt 0) {
        throw "Tracked docs page '$RelativePath' is also missing required sections ($($trackedMissingSections -join ', '))."
    }

    Write-Warning "Falling back to the tracked docs page for $RelativePath because the generated output is missing sections: $($missingSections -join ', ')."
    Set-OrCheckGeneratedMarkdown -RelativePath $RelativePath -Content $trackedContent
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
    'docs\hooks\changeLog.md',
    'docs\qaas\changeLog.md',
    'docs\mocker\changeLog.md',
    'docs\framework\changeLog.md',
    'docs\assertions\changeLog.md',
    'docs\generators\changeLog.md',
    'docs\probes\changeLog.md',
    'docs\processors\changeLog.md'
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

Restore-TrackedDocsPageIfSectionsMissing `
    -RelativePath 'docs\qaas\functions\index.md' `
    -RequiredSections @('Builders', 'Commands')

Restore-TrackedDocsPageIfSectionsMissing `
    -RelativePath 'docs\mocker\functions\index.md' `
    -RequiredSections @('Builders', 'Commands')

& (Join-Path $PSScriptRoot 'Update-HookOverviews.ps1') `
    -DocsRoot $DocsRoot `
    -Check:$Check
if ($LASTEXITCODE -ne 0) { throw 'Hook overview enrichment failed.' }

& (Join-Path $PSScriptRoot 'Sync-SchemaAssets.ps1') `
    -DocsRoot $DocsRoot `
    -MirrorRoot $MirrorRoot `
    -Check:$Check
if ($LASTEXITCODE -ne 0) { throw 'Schema asset sync failed.' }

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
