# Installation

## Prerequisites

| Requirement                        | Details                                                             |
|------------------------------------|---------------------------------------------------------------------|
| [.NET SDK]({{ links.dotnet_sdk }}) | Version **10.0**                                                    |
| NuGet feed                         | A global `NuGet.Config` file configured with the correct nuget feed |
| IDE setup                          | Recommended for YAML schema validation and completion               |

## Global NuGet.Config

Add the relevant package source to your global `NuGet.Config` file, usually `~/.nuget/NuGet/NuGet.Config`.

```xml
<configuration>
    <packageSources>
        <clear />
        <add key="nuget_feed" value="{{ links.nuget_feed }}" protocolVersion="3" />
    </packageSources>
</configuration>
```

## Packages

Add the package to your project:

=== "`.csproj`"

    ```xml
    <ItemGroup>
      <PackageReference Include="QaaS.Mocker" Version="x.x.x" />
      <PackageReference Include="QaaS.Common.Generators" Version="x.x.x" />
      <PackageReference Include="QaaS.Common.Processors" Version="x.x.x" />
    </ItemGroup>
    ```

=== "CLI"

    ```bash
    dotnet add package QaaS.Mocker
    dotnet add package QaaS.Common.Generators
    dotnet add package QaaS.Common.Processors
    ```

[QaaS.Common.Generators](../../generators/index.md) is optional in general, but it is used by the quick-start examples on this site. [QaaS.Common.Processors](../../processors/index.md) is also optional, but install it when you want packaged reusable processors instead of only project-local processor classes.

## Project Template

Use [QaaS.Mocker.Template]({{ links.repository_mocker_template }}) when you want a ready-to-run mocker repo instead of wiring packages by hand.

```bash
dotnet new install QaaS.Mocker.Template
dotnet new qaas-mocker -n MyServiceMock
```

The generated repo includes:

- `NuGet.config` pointing at: `{{ links.nuget_feed }}`
- `QaaS.Mocker` with `Version="x.x.x"` (set a concrete package version for your project)
- a minimal `/health` mock under `Servers`
- `Dockerfile` and generated GitHub Actions CI

If you use Artifactory or another private feed, update the generated `NuGet.config` before the first restore.

## IDE Setup

Use the dedicated [IDE Setup](ide.md) page for the Mocker-specific JSON schema and editor mappings.
