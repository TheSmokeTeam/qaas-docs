# Installation

> TL;DR — Add the QaaS package source, create a Mocker project, and restore the required NuGet packages.

## Prerequisites

| Requirement                                       | Details                                                             |
| ------------------------------------------------- | ------------------------------------------------------------------- |
| [.NET SDK](https://dotnet.microsoft.com/download) | Version **10.0**                                                    |
| NuGet feed                                        | A global `NuGet.Config` file configured with the correct nuget feed |
| IDE setup                                         | Recommended for YAML schema validation and completion               |

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

Add the package to your project:

```xml
<ItemGroup>
  <PackageReference Include="QaaS.Mocker" Version="x.x.x" />
  <PackageReference Include="QaaS.Common.Generators" Version="x.x.x" />
  <PackageReference Include="QaaS.Common.Processors" Version="x.x.x" />
</ItemGroup>
```

```bash
dotnet add package QaaS.Mocker
dotnet add package QaaS.Common.Generators
dotnet add package QaaS.Common.Processors
```

[QaaS.Common.Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md) is optional in general, but it is used by the quick-start examples on this site. [QaaS.Common.Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md) is also optional, but install it when you want packaged reusable processors instead of only project-local processor classes.

## Project Template

Use [QaaS.Mocker.Template](https://github.com/TheSmokeTeam/QaaS.Mocker.Template) when you want a ready-to-run mocker repo instead of wiring packages by hand.

```bash
dotnet new install QaaS.Mocker.Template
dotnet new qaas-mocker -n MyServiceMock
```

The generated repo includes:

- `NuGet.config` pointing at: `https://api.nuget.org/v3/index.json`
- `QaaS.Mocker` with `Version="x.x.x"` (set a concrete package version for your project)
- a minimal `/health` mock under `Servers`
- `Dockerfile` and generated GitHub Actions CI

If you use Artifactory or another private feed, keep the feed URL configurable rather than baking one environment into the project. Update the generated `NuGet.config` for local restores, and pass the same feed into Docker builds with the template's NuGet source build argument before `dotnet restore`.

## IDE Setup

Use the dedicated [IDE Setup](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/ide/index.md) page for the Mocker-specific JSON schema and editor mappings.

## See also

- [Mocker IDE setup](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/ide/index.md)
- [Create a mock in YAML](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/createMock/index.md)
- [Create a mock in code](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/createMockCode/index.md)
- [Runner installation](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/installation/index.md)
