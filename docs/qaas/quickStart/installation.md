# Installation

## Prerequisites

| Requirement | Details |
| ----------- | ------- |
| [.NET SDK]({{ links.dotnet_sdk }}) | Version **10.0** |
| NuGet feed | One configurable feed, defaulting to `nuget.org` |
| [Allure CLI]({{ links.allure_install }}) | Optional, for viewing reports locally |

## Global NuGet.Config

Add a single package source to your global `NuGet.Config` file, usually `~/.nuget/NuGet/NuGet.Config`.

The default documentation value is `nuget.org`, and you can override it during docs builds with `QAAS_DOCS_LINK_NUGET_FEED`.

```xml
<configuration>
  <packageSources>
    <clear />
    <add key="nuget.org" value="{{ links.nuget_feed }}" protocolVersion="3" />
  </packageSources>
</configuration>
```

## Packages

Add the packages your project needs. At minimum, you need `QaaS.Runner`; the Common libraries are optional plugins.

=== "`.csproj`"

    ```xml
    <ItemGroup>
      <PackageReference Include="QaaS.Runner" Version="*" />
      <PackageReference Include="QaaS.Common.Assertions" Version="*" />
      <PackageReference Include="QaaS.Common.Generators" Version="*" />
      <PackageReference Include="QaaS.Common.Probes" Version="*" />
    </ItemGroup>
    ```

=== "CLI"

    ```bash
    dotnet add package QaaS.Runner
    dotnet add package QaaS.Common.Assertions
    dotnet add package QaaS.Common.Generators
    dotnet add package QaaS.Common.Probes
    ```

!!! tip "Version compatibility"
    All Common packages must share the same `QaaS.Framework.SDK` version, or a compatible newer minor version, as the `QaaS.Runner` package you reference.

## Project Template

The installable template pack for new runner projects is [QaaS.Runner.Template]({{ links.repository_runner_template }}).

```bash
# Install
dotnet new install QaaS.Runner.Template

# Uninstall
dotnet new uninstall QaaS.Runner.Template
```

??? example "The template creates"

    ```txt
    MyServiceTests/
    |-- NuGet.Config
    |-- MyServiceTests.sln
    `-- MyServiceTests/
        |-- MyServiceTests.csproj
        |-- Program.cs
        `-- test.qaas.yaml
    ```

## Allure CLI

The Allure CLI installation instructions are available in the [official Allure docs]({{ links.allure_install }}).
