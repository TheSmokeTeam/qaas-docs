param(
    [string]$DocsRoot,
    [string]$MirrorRoot,
    [switch]$Check
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

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

function Normalize-LineEndings {
    param([string]$Text)

    return $Text.Replace("`r`n", "`n").Replace("`r", "`n")
}

function Get-RelativeFilePath {
    param(
        [Parameter(Mandatory)]
        [string]$RootPath,
        [Parameter(Mandatory)]
        [string]$ChildPath
    )

    $normalizedRootPath = [System.IO.Path]::GetFullPath($RootPath)
    if (-not $normalizedRootPath.EndsWith([System.IO.Path]::DirectorySeparatorChar)) {
        $normalizedRootPath = $normalizedRootPath + [System.IO.Path]::DirectorySeparatorChar
    }

    $rootUri = [System.Uri]::new($normalizedRootPath)
    $childUri = [System.Uri]::new([System.IO.Path]::GetFullPath($ChildPath))
    $relativeUri = $rootUri.MakeRelativeUri($childUri)

    return [System.Uri]::UnescapeDataString($relativeUri.ToString()).Replace('/', [System.IO.Path]::DirectorySeparatorChar)
}

function Copy-OrCheckFile {
    param(
        [Parameter(Mandatory)]
        [string]$SourcePath,
        [Parameter(Mandatory)]
        [string]$DestinationPath
    )

    if (-not (Test-Path $SourcePath)) {
        throw "Missing schema asset source file: $SourcePath"
    }

    if ($Check) {
        if (-not (Test-Path $DestinationPath)) {
            throw "Missing copied schema asset: $DestinationPath"
        }

        $sourceContent = Normalize-LineEndings ([System.IO.File]::ReadAllText($SourcePath))
        $destinationContent = Normalize-LineEndings ([System.IO.File]::ReadAllText($DestinationPath))
        if ($sourceContent -ne $destinationContent) {
            throw "Schema asset drift detected: $DestinationPath"
        }

        return
    }

    New-Item -ItemType Directory -Path (Split-Path -Parent $DestinationPath) -Force | Out-Null
    Copy-Item -LiteralPath $SourcePath -Destination $DestinationPath -Force
}

function Remove-OrCheckObsoletePath {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if (-not (Test-Path $Path)) {
        return
    }

    if ($Check) {
        throw "Obsolete mirrored docs asset still exists: $Path"
    }

    Remove-Item -LiteralPath $Path -Recurse -Force
}

if ([string]::IsNullOrWhiteSpace($DocsRoot)) {
    $DocsRoot = Split-Path -Parent $PSScriptRoot
}

$workspaceRoot = Resolve-NormalizedPath (Join-Path (Split-Path -Parent $PSScriptRoot) '..')
if ([string]::IsNullOrWhiteSpace($MirrorRoot)) {
    $MirrorRoot = Join-Path $workspaceRoot 'QaaS.PackageMirror'
}

$DocsRoot = Resolve-NormalizedPath $DocsRoot
$MirrorRoot = Resolve-NormalizedPath $MirrorRoot

$sourceRoot = Join-Path $MirrorRoot 'schemas'
$destinationRoot = Join-Path $DocsRoot 'docs\assets\schemas'

@(
    (Join-Path $destinationRoot 'index.json'),
    (Join-Path $destinationRoot 'runner-family'),
    (Join-Path $destinationRoot 'mocker-family'),
    (Join-Path $DocsRoot 'docs\assets\mirror-state')
) | ForEach-Object {
    Remove-OrCheckObsoletePath -Path $_
}

$pairs = @(
    @{
        Source = Join-Path $sourceRoot 'runner-family\latest\schema.json'
        Destination = Join-Path $destinationRoot 'runner-family-schema.json'
    }
    @{
        Source = Join-Path $sourceRoot 'mocker-family\latest\schema.json'
        Destination = Join-Path $destinationRoot 'mocker-family-schema.json'
    }
)

foreach ($pair in $pairs) {
    Copy-OrCheckFile -SourcePath $pair.Source -DestinationPath $pair.Destination
}

Write-Host ("{0} schema assets." -f ($(if ($Check) { 'Validated mirrored docs assets' } else { 'Synced mirrored docs assets' })))
