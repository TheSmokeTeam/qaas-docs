# Environment Setup

## Minimum Prerequisites

- .NET 10 SDK: [official installer]([[ext:dotnet-install]])
- Access to a NuGet feed that contains the QaaS packages
- Optional: Allure CLI for local HTML reports: [installation guide]([[ext:allure-cli]])

## Recommended Environment Variables

Use environment variables from the start so the same instructions work against NuGet.org, Artifactory, or another private feed.

```powershell
$env:QAAS_NUGET_SOURCE = "https://www.nuget.org/api/v2"
$env:QAAS_RUNNER_VERSION = "0.0.0"
```

Replace those values in CI or in your air-gapped environment. The docs site itself also honors environment-driven links; see [Air-Gapped Deployment](../operations/air-gapped.md).

## Create a Test Project

If your feed publishes the QaaS template package:

```powershell
dotnet new install QaaS.ProjectTemplates --nuget-source $env:QAAS_NUGET_SOURCE
dotnet new qaas.test -n DummyAppTests
```

Template source: [QaaS.ProjectTemplates]([[repo:project-templates]])

If you do not have the template package, create the project manually:

```powershell
dotnet new console -n DummyAppTests
dotnet new sln -n DummyAppTests
dotnet sln DummyAppTests.sln add .\DummyAppTests\DummyAppTests.csproj
```

Add the core QaaS packages:

```powershell
dotnet add .\DummyAppTests\DummyAppTests.csproj package QaaS.Runner --version $env:QAAS_RUNNER_VERSION --source $env:QAAS_NUGET_SOURCE
dotnet add .\DummyAppTests\DummyAppTests.csproj package QaaS.Common.Assertions --version $env:QAAS_RUNNER_VERSION --source $env:QAAS_NUGET_SOURCE
dotnet add .\DummyAppTests\DummyAppTests.csproj package QaaS.Common.Generators --version $env:QAAS_RUNNER_VERSION --source $env:QAAS_NUGET_SOURCE
dotnet add .\DummyAppTests\DummyAppTests.csproj package QaaS.Common.Probes --version $env:QAAS_RUNNER_VERSION --source $env:QAAS_NUGET_SOURCE
```

Package pages:

- [QaaS.Runner]([[nuget:QaaS.Runner]])
- [QaaS.Common.Assertions]([[nuget:QaaS.Common.Assertions]])
- [QaaS.Common.Generators]([[nuget:QaaS.Common.Generators]])
- [QaaS.Common.Probes]([[nuget:QaaS.Common.Probes]])

## Minimal File Layout

Keep the test project simple.

```text
DummyAppTests/
|-- DummyAppTests.sln
|-- DummyAppTests/
|   |-- DummyAppTests.csproj
|   |-- Program.cs
|   |-- test.qaas.yaml
|   |-- Variables/
|   |   |-- local.yaml
|   |   `-- k8s.yaml
|   `-- Cases/
```

Add `TestData/` only when the test actually consumes external samples.

## Program.cs Baseline

```csharp
QaaS.Runner.Bootstrap.New(args).Run();
```

That single line is the default entrypoint for YAML-driven tests. Move to [Write a Test in Code](write-test-code.md) only when the YAML model becomes too dynamic.
