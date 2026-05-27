---
id: mocker.quickstart.installation
type: tutorial
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [mocker]
keywords: [mocker, quickstart, installation]
summary: "Add the relevant package source to your global NuGet.Config file, usually ~/.nuget/NuGet/NuGet.Config."
render_macros: true
---
# Installation

> TL;DR — Add the QaaS package source, create a Mocker project, and restore the required NuGet packages.

## Prerequisites {: #prerequisites}

| Requirement                        | Details                                                             |
|------------------------------------|---------------------------------------------------------------------|
| [.NET SDK]({{ links.dotnet_sdk }}) | Version **10.0**                                                    |
| NuGet feed                         | A global `NuGet.Config` file configured with the correct nuget feed |
| IDE setup                          | Recommended for YAML schema validation and completion               |

## Global NuGet.Config {: #global-nugetconfig}

Add the relevant package source to your global `NuGet.Config` file, usually `~/.nuget/NuGet/NuGet.Config`.

```xml
<configuration>
    <packageSources>
        <clear />
        <add key="nuget_feed" value="{{ links.nuget_feed }}" protocolVersion="3" />
    </packageSources>
</configuration>
```

## Packages {: #packages}

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

## Project Template {: #project-template}

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

If you use Artifactory or another private feed, keep the feed URL configurable rather than baking one environment into the project. Update the generated `NuGet.config` for local restores, and pass the same feed into Docker builds with the template's NuGet source build argument before `dotnet restore`.

## IDE Setup {: #ide-setup}

Use the dedicated [IDE Setup](ide.md) page for the Mocker-specific JSON schema and editor mappings.

## See also {: #see-also}

- [Mocker IDE setup](ide.md)
- [Create a mock in YAML](createMock.md)
- [Create a mock in code](createMockCode.md)
- [Runner installation](../../qaas/quickStart/installation.md)
