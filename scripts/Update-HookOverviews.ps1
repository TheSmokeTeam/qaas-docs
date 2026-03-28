param(
    [string]$DocsRoot,
    [switch]$Check
)

$ErrorActionPreference = 'Stop'
$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

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

function Get-HookOverviewRelativePath {
    param(
        [Parameter(Mandatory)]
        [pscustomobject]$Entry
    )

    $baseDirectory = switch ($Entry.Kind) {
        'assertions' { 'docs\assertions\availableAssertions' }
        'generators' { 'docs\generators\availableGenerators' }
        'probes' { 'docs\probes\availableProbes' }
        'processors' { 'docs\processors\availableProcessors' }
        default { throw "Unsupported hook kind '$($Entry.Kind)'." }
    }

    return Join-Path (Join-Path $baseDirectory $Entry.Name) 'overview.md'
}

function Get-OverviewSummary {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "Hook overview file is missing: $Path"
    }

    $content = [System.IO.File]::ReadAllText($Path, $Utf8NoBom).Replace("`r`n", "`n").Trim()
    if ([string]::IsNullOrWhiteSpace($content)) {
        throw "Hook overview file is empty: $Path"
    }

    $lines = [System.Collections.Generic.List[string]]::new()
    foreach ($line in ($content -split "`n")) {
        $lines.Add($line)
    }

    if ($lines.Count -gt 0 -and $lines[0].StartsWith('<!-- generated hash:', [System.StringComparison]::Ordinal)) {
        $lines.RemoveAt(0)
    }

    while ($lines.Count -gt 0 -and [string]::IsNullOrWhiteSpace($lines[0])) {
        $lines.RemoveAt(0)
    }

    if ($lines.Count -gt 0 -and $lines[0].StartsWith('# ', [System.StringComparison]::Ordinal)) {
        $lines.RemoveAt(0)
    }

    while ($lines.Count -gt 0 -and [string]::IsNullOrWhiteSpace($lines[0])) {
        $lines.RemoveAt(0)
    }

    $body = ($lines -join "`n").Trim()
    if ([string]::IsNullOrWhiteSpace($body)) {
        throw "Hook overview file does not contain a summary body: $Path"
    }

    $headingMatch = [regex]::Match($body, '(?m)^## ')
    if ($headingMatch.Success) {
        return $body.Substring(0, $headingMatch.Index).Trim()
    }

    return $body
}

function Render-HookOverview {
    param(
        [Parameter(Mandatory)]
        [pscustomobject]$Entry,

        [Parameter(Mandatory)]
        [string]$Summary
    )

    $sections = @(
        "# $($Entry.Name)",
        '',
        $Summary.Trim(),
        '',
        '## What It Does',
        '',
        $Entry.WhatItDoes.Trim(),
        '',
        '## YAML Example',
        '',
        '```yaml',
        $Entry.YamlSnippet.Trim(),
        '```',
        '',
        '## What This Configuration Does',
        '',
        $Entry.ConfigExplanation.Trim()
    )

    return (($sections -join "`n").TrimEnd() + "`n")
}

function Set-OrCheckMarkdown {
    param(
        [Parameter(Mandatory)]
        [string]$Path,

        [Parameter(Mandatory)]
        [string]$Content
    )

    $normalizedExpected = $Content.Replace("`r`n", "`n")
    $normalizedCurrent = if (Test-Path -LiteralPath $Path) {
        [System.IO.File]::ReadAllText($Path, $Utf8NoBom).Replace("`r`n", "`n")
    }
    else {
        $null
    }

    if ($Check) {
        if ($normalizedCurrent -ne $normalizedExpected) {
            throw "Hook overview docs are out of date: $Path"
        }

        return
    }

    $directory = Split-Path -Parent $Path
    if (-not [string]::IsNullOrWhiteSpace($directory)) {
        New-Item -ItemType Directory -Force -Path $directory | Out-Null
    }

    [System.IO.File]::WriteAllText($Path, $normalizedExpected.Replace("`n", [System.Environment]::NewLine), $Utf8NoBom)
}

if ([string]::IsNullOrWhiteSpace($DocsRoot)) {
    $DocsRoot = Split-Path -Parent $PSScriptRoot
}

$DocsRoot = Resolve-NormalizedPath $DocsRoot
. (Join-Path $PSScriptRoot 'HookOverviewData.ps1')

foreach ($entry in Get-HookOverviewEntries) {
    $relativePath = Get-HookOverviewRelativePath -Entry $entry
    $fullPath = Join-Path $DocsRoot $relativePath
    $summary = Get-OverviewSummary -Path $fullPath
    $content = Render-HookOverview -Entry $entry -Summary $summary
    Set-OrCheckMarkdown -Path $fullPath -Content $content
}
