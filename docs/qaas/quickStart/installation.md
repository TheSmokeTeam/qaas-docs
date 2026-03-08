# Installation

## Prerequisites

| Requirement | Version |
|---|---|
| [.NET SDK](https://dotnet.microsoft.com/download) | **10.0** or later |
| NuGet feeds | See feed configuration below |
| Allure CLI *(optional — for viewing reports)* | [Install guide](https://docs.qameta.io/allure/#_installing_a_commandline) |

### NuGet Feed Configuration

Add the QaaS private feeds to your global `NuGet.Config` (usually `~/.nuget/NuGet/NuGet.Config`):

```xml
<add key="Feed_A" value="REDA" />
<add key="Feed_B" value="REDA" />
<add key="Feed_C" value="REDA" />
```

## Packages

Add the packages your project needs. At minimum you need `QaaS.Runner`; the Common libraries are optional plugins.

```xml
<ItemGroup>
  <!-- Required -->
  <PackageReference Include="QaaS.Runner" Version="*" />

  <!-- Optional plugins — add only what you use -->
  <PackageReference Include="QaaS.Common.Assertions" Version="*" />
  <PackageReference Include="QaaS.Common.Generators" Version="*" />
  <PackageReference Include="QaaS.Common.Probes" Version="*" />
</ItemGroup>
```

!!! tip "Version compatibility"
    All Common packages must share the same `QaaS.Framework.SDK` version (or a compatible newer minor) as the `QaaS.Runner` you reference.

## Project Templates

QaaS provides `dotnet new` templates for scaffolding new test projects.

[QaaS Project Templates Repository](REDA)

```bash
# Install
dotnet new install QaaS.ProjectTemplates

# Create a new test project
dotnet new qaas.test -n MyServiceTests

# Uninstall
dotnet new uninstall QaaS.ProjectTemplates
```

The template creates:

```
MyServiceTests/
├── NuGet.Config
├── MyServiceTests.sln
├── MyServiceTests/
│   ├── MyServiceTests.csproj
│   ├── Program.cs
│   ├── test.qaas.yaml
│   └── Variables/
│       ├── local.yaml
│       └── k8s.yaml
```

## Allure CLI

Install the [Allure CLI](REDA/allure-cli.git) to view test reports locally:

```bash
allure serve          # opens the report in a browser
allure generate       # generates a static HTML report
```

## Next Step

[Configure your IDE →](ide.md)
