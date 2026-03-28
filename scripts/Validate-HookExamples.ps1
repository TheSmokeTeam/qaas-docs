param(
    [string]$DocsRoot,
    [string]$RunnerRoot,
    [string]$MockerRoot,
    [string]$AssertionsRoot,
    [string]$GeneratorsRoot,
    [string]$ProbesRoot,
    [string]$ProcessorsRoot,
    [switch]$SkipBuild
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

function Invoke-DotnetBuild {
    param(
        [Parameter(Mandatory)]
        [string]$TargetPath
    )

    dotnet build $TargetPath -c Release
    if ($LASTEXITCODE -ne 0) {
        throw "dotnet build failed for $TargetPath"
    }
}

function Get-ProjectOutputDirectory {
    param(
        [Parameter(Mandatory)]
        [string]$ProjectPath
    )

    $projectDirectory = Split-Path -Parent $ProjectPath
    $projectName = [System.IO.Path]::GetFileNameWithoutExtension($ProjectPath)
    $runtimeConfig = Get-ChildItem -Path (Join-Path $projectDirectory 'bin\Release') -Recurse -Filter "$projectName.runtimeconfig.json" -File |
        Sort-Object FullName |
        Select-Object -First 1

    if ($null -eq $runtimeConfig) {
        throw "Could not find Release output for $ProjectPath"
    }

    return Split-Path -Parent $runtimeConfig.FullName
}

function Get-ProjectBuildOutputDirectory {
    param(
        [Parameter(Mandatory)]
        [string]$ProjectPath
    )

    $projectDirectory = Split-Path -Parent $ProjectPath
    $assemblyName = [System.IO.Path]::GetFileNameWithoutExtension($ProjectPath)
    $assembly = Get-ChildItem -Path (Join-Path $projectDirectory 'bin\Release') -Recurse -Filter "$assemblyName.dll" -File |
        Where-Object { $_.FullName -like '*\bin\Release\*' } |
        Sort-Object FullName |
        Select-Object -First 1

    if ($null -eq $assembly) {
        throw "Could not find Release build output for $ProjectPath"
    }

    return Split-Path -Parent $assembly.FullName
}

function Initialize-HostRuntime {
    param(
        [Parameter(Mandatory)]
        [string]$SourceDirectory,

        [Parameter(Mandatory)]
        [string]$DestinationDirectory,

        [Parameter(Mandatory)]
        [string[]]$PluginPaths
    )

    if (Test-Path -LiteralPath $DestinationDirectory) {
        Remove-Item -LiteralPath $DestinationDirectory -Recurse -Force
    }

    New-Item -ItemType Directory -Force -Path $DestinationDirectory | Out-Null
    Copy-Item -Path (Join-Path $SourceDirectory '*') -Destination $DestinationDirectory -Recurse -Force

    foreach ($pluginPath in $PluginPaths) {
        if (Test-Path -LiteralPath $pluginPath -PathType Container) {
            Copy-Item -Path (Join-Path $pluginPath '*') -Destination $DestinationDirectory -Recurse -Force
            continue
        }

        Copy-Item -LiteralPath $pluginPath -Destination (Join-Path $DestinationDirectory ([System.IO.Path]::GetFileName($pluginPath))) -Force
    }
}

function Get-ExecutableInvocation {
    param(
        [Parameter(Mandatory)]
        [string]$OutputDirectory,

        [Parameter(Mandatory)]
        [string]$ProjectName
    )

    $exePath = Join-Path $OutputDirectory "$ProjectName.exe"
    if (Test-Path -LiteralPath $exePath) {
        return [pscustomobject]@{
            FilePath      = $exePath
            PrefixArgs    = @()
        }
    }

    $dllPath = Join-Path $OutputDirectory "$ProjectName.dll"
    if (-not (Test-Path -LiteralPath $dllPath)) {
        throw "Could not find executable output for $ProjectName in $OutputDirectory"
    }

    return [pscustomobject]@{
        FilePath      = 'dotnet'
        PrefixArgs    = @($dllPath)
    }
}

function Get-HookExampleContent {
    param(
        [Parameter(Mandatory)]
        [pscustomobject]$Entry
    )

    if ($Entry.Runtime -eq 'runner') {
@"
MetaData:
  Team: Docs
  System: HookValidation

$($Entry.YamlSnippet.Trim())
"@
    }
    else {
        $Entry.YamlSnippet.Trim()
    }
}

function Invoke-HookValidation {
    param(
        [Parameter(Mandatory)]
        [pscustomobject]$Entry,

        [Parameter(Mandatory)]
        [string]$RuntimeDirectory,

        [Parameter(Mandatory)]
        [pscustomobject]$Invocation
    )

    $examplesDirectory = Join-Path $RuntimeDirectory (Join-Path 'examples' $Entry.Kind)
    New-Item -ItemType Directory -Force -Path $examplesDirectory | Out-Null

    $configFileName = "$($Entry.Name).qaas.yaml"
    $configPath = Join-Path $examplesDirectory $configFileName
    $relativeConfigPath = ".\examples\$($Entry.Kind)\$configFileName"
    $content = Get-HookExampleContent -Entry $Entry
    [System.IO.File]::WriteAllText($configPath, ($content.TrimEnd() + "`n").Replace("`n", [System.Environment]::NewLine), $Utf8NoBom)

    $commandArgs = @()
    $commandArgs += $Invocation.PrefixArgs
    $commandArgs += 'template'
    $commandArgs += $relativeConfigPath
    $commandArgs += '--no-env'
    if ($Entry.Runtime -eq 'runner') {
        $commandArgs += '--no-process-exit'
    }

    Push-Location $RuntimeDirectory
    try {
        $output = & $Invocation.FilePath @commandArgs 2>&1 | Out-String
        if ($LASTEXITCODE -ne 0) {
            throw ($output.Trim())
        }
    }
    finally {
        Pop-Location
    }
}

$workspaceRoot = Resolve-NormalizedPath (Join-Path (Split-Path -Parent $PSScriptRoot) '..')

if ([string]::IsNullOrWhiteSpace($DocsRoot)) {
    $DocsRoot = Split-Path -Parent $PSScriptRoot
}

if ([string]::IsNullOrWhiteSpace($RunnerRoot)) {
    $RunnerRoot = Join-Path $workspaceRoot 'QaaS.Runner'
}

if ([string]::IsNullOrWhiteSpace($MockerRoot)) {
    $MockerRoot = Join-Path $workspaceRoot 'QaaS.Mocker'
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
$RunnerRoot = Resolve-NormalizedPath $RunnerRoot
$MockerRoot = Resolve-NormalizedPath $MockerRoot
$AssertionsRoot = Resolve-NormalizedPath $AssertionsRoot
$GeneratorsRoot = Resolve-NormalizedPath $GeneratorsRoot
$ProbesRoot = Resolve-NormalizedPath $ProbesRoot
$ProcessorsRoot = Resolve-NormalizedPath $ProcessorsRoot

. (Join-Path $PSScriptRoot 'HookOverviewData.ps1')

$runnerSolution = Join-Path $RunnerRoot 'QaaS.Runner.sln'
$mockerSolution = Join-Path $MockerRoot 'QaaS.Mocker.sln'
$assertionsProject = Join-Path $AssertionsRoot 'QaaS.Common.Assertions\QaaS.Common.Assertions.csproj'
$generatorsProject = Join-Path $GeneratorsRoot 'QaaS.Common.Generators\QaaS.Common.Generators.csproj'
$probesProject = Join-Path $ProbesRoot 'QaaS.Common.Probes\QaaS.Common.Probes.csproj'
$probesTestsProject = Join-Path $ProbesRoot 'QaaS.Common.Probes.Tests\QaaS.Common.Probes.Tests.csproj'
$processorsProject = Join-Path $ProcessorsRoot 'QaaS.Common.Processors\QaaS.Common.Processors.csproj'
$runnerHostProject = Join-Path $RunnerRoot 'QaaS.Runner.E2ETests\QaaS.Runner.E2ETests.csproj'
$mockerHostProject = Join-Path $MockerRoot 'QaaS.Mocker.Example\QaaS.Mocker.Example.csproj'

if (-not $SkipBuild) {
    Invoke-DotnetBuild -TargetPath $runnerSolution
    Invoke-DotnetBuild -TargetPath $mockerSolution
    Invoke-DotnetBuild -TargetPath $assertionsProject
    Invoke-DotnetBuild -TargetPath $generatorsProject
    Invoke-DotnetBuild -TargetPath $probesProject
    Invoke-DotnetBuild -TargetPath $probesTestsProject
    Invoke-DotnetBuild -TargetPath $processorsProject
}

$validationRoot = Join-Path $workspaceRoot '_tmp\qaas-docs-hook-validation'
$runnerRuntimeDirectory = Join-Path $validationRoot 'runner'
$mockerRuntimeDirectory = Join-Path $validationRoot 'mocker'

Initialize-HostRuntime `
    -SourceDirectory (Get-ProjectOutputDirectory -ProjectPath $runnerHostProject) `
    -DestinationDirectory $runnerRuntimeDirectory `
    -PluginPaths @(
        (Get-ProjectBuildOutputDirectory -ProjectPath $assertionsProject),
        (Get-ProjectBuildOutputDirectory -ProjectPath $generatorsProject),
        (Get-ProjectBuildOutputDirectory -ProjectPath $probesProject),
        (Get-ProjectOutputDirectory -ProjectPath $probesTestsProject)
    )

Initialize-HostRuntime `
    -SourceDirectory (Get-ProjectOutputDirectory -ProjectPath $mockerHostProject) `
    -DestinationDirectory $mockerRuntimeDirectory `
    -PluginPaths @(
        (Get-ProjectBuildOutputDirectory -ProjectPath $generatorsProject),
        (Get-ProjectBuildOutputDirectory -ProjectPath $processorsProject)
    )

$runnerInvocation = Get-ExecutableInvocation -OutputDirectory $runnerRuntimeDirectory -ProjectName 'QaaS.Runner.E2ETests'
$mockerInvocation = Get-ExecutableInvocation -OutputDirectory $mockerRuntimeDirectory -ProjectName 'QaaS.Mocker.Example'

$failures = [System.Collections.Generic.List[string]]::new()
foreach ($entry in Get-HookOverviewEntries) {
    try {
        if ($entry.Runtime -eq 'runner') {
            Invoke-HookValidation -Entry $entry -RuntimeDirectory $runnerRuntimeDirectory -Invocation $runnerInvocation
        }
        else {
            Invoke-HookValidation -Entry $entry -RuntimeDirectory $mockerRuntimeDirectory -Invocation $mockerInvocation
        }
        Write-Host "Validated $($entry.Kind)/$($entry.Name)"
    }
    catch {
        $failures.Add("$($entry.Kind)/$($entry.Name): $($_.Exception.Message)")
        Write-Host "Validation failed for $($entry.Kind)/$($entry.Name)"
    }
}

if ($failures.Count -gt 0) {
    throw ("Hook example validation failed:`n" + ($failures -join "`n"))
}

Write-Host "Validated $((Get-HookOverviewEntries).Count) hook examples."
