# Installation

> TL;DR — Add the QaaS package source, create a Runner project, and restore the required NuGet packages.

## Prerequisites

| Requirement                                                            | Details                                                             |
| ---------------------------------------------------------------------- | ------------------------------------------------------------------- |
| [.NET SDK](https://dotnet.microsoft.com/download)                      | Version **10.0**                                                    |
| NuGet feed                                                             | A global `NuGet.Config` file configured with the correct nuget feed |
| [Allure CLI](https://docs.qameta.io/allure/#_installing_a_commandline) | Optional, for viewing reports locally                               |

## Global NuGet.Config

Add the relevant package source to your global `NuGet.Config` file, usually `~/.nuget/NuGet/NuGet.Config`.

```xml
<configuration>
  <packageSources>
    <clear />
    <add key="nuget_feed" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />
  </packageSources>
</configuration>
```

## Packages

Add the packages your project needs. At minimum, you need `QaaS.Runner`; the Common libraries are optional [Plugins](https://TheSmokeTeam.github.io/qaas-docs/qaas/addOns/plugins/index.md).

```xml
<ItemGroup>
  <PackageReference Include="QaaS.Runner" Version="x.x.x" />
  <PackageReference Include="QaaS.Common.Assertions" Version="x.x.x" />
  <PackageReference Include="QaaS.Common.Generators" Version="x.x.x" />
  <PackageReference Include="QaaS.Common.Probes" Version="x.x.x" />
</ItemGroup>
```

```bash
dotnet add package QaaS.Runner
dotnet add package QaaS.Common.Assertions
dotnet add package QaaS.Common.Generators
dotnet add package QaaS.Common.Probes
```

Version compatibility

All Common packages must share the same [QaaS.Framework.SDK](https://TheSmokeTeam.github.io/qaas-docs/framework/projects/sdk/index.md) version, or a compatible newer minor version, as the `QaaS.Runner` package you reference.

[QaaS.Common.Assertions](https://TheSmokeTeam.github.io/qaas-docs/assertions/index.md), [QaaS.Common.Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md), and [QaaS.Common.Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md) are the packaged hook libraries used most often in Runner projects.

## Project Template

Use [QaaS.Runner.Template](https://github.com/TheSmokeTeam/QaaS.Runner.Template) when you want a ready-to-run runner repo instead of wiring packages by hand.

```bash
dotnet new install QaaS.Runner.Template
dotnet new qaas-runner -n MyServiceTests
```

The generated repo includes:

- `NuGet.config` pointing at: `https://api.nuget.org/v3/index.json`
- `QaaS.Runner` with `Version="x.x.x"` (set a concrete package version for your project)
- a minimal valid `test.qaas.yaml`
- a Rider launch profile for `run test.qaas.yaml`

If you use Artifactory or another private feed, keep the feed URL configurable rather than baking one environment into the project. Update the generated `NuGet.config` for local restores, and pass the same feed into Docker builds or CI restore steps through a build variable before `dotnet restore`.

## Allure CLI

The Allure CLI installation instructions are available [Here](https://docs.qameta.io/allure/#_installing_a_commandline).

## See also

- [Runner IDE setup](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/ide/index.md)
- [Write a test in YAML](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/writeTestYaml/index.md)
- [Run test](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/runTest/index.md)
- [Mocker installation](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/installation/index.md)
