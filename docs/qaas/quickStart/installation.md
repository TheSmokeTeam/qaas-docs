# Installation

## Prerequisites

| Requirement | Details |
| ----------- | ------- |
| [.NET SDK]({{ links.dotnet_sdk }}) | Version **10.0** |
| NuGet feed | A global `NuGet.Config` file configured with feed URLs A, B, and C |
| [Allure CLI]({{ links.allure_installation_guide }}) | Optional, for viewing reports locally |

## Global NuGet.Config

Add package sources to your global `NuGet.Config` file, usually `~/.nuget/NuGet/NuGet.Config`.

- A global `NuGet.Config` file configured with the following feed URLs:
  - `QAAS_DOCS_LINK_NUGET_FEED_A`
  - `QAAS_DOCS_LINK_NUGET_FEED_B`
  - `QAAS_DOCS_LINK_NUGET_FEED_C`

```xml
<configuration>
  <packageSources>
    <clear />
    <add key="feed_a" value="{{ links.nuget_feed_a }}" protocolVersion="3" />
    <add key="feed_b" value="{{ links.nuget_feed_b }}" protocolVersion="3" />
    <add key="feed_c" value="{{ links.nuget_feed_c }}" protocolVersion="3" />
  </packageSources>
</configuration>
```

## Packages

Add the packages your project needs. At minimum, you need `QaaS.Runner`; the Common libraries are optional plugins.

=== "`.csproj`"

    ```xml
    <ItemGroup>
      <PackageReference Include="QaaS.Runner" Version="x.x.x" />
      <PackageReference Include="QaaS.Common.Assertions" Version="x.x.x" />
      <PackageReference Include="QaaS.Common.Generators" Version="x.x.x" />
      <PackageReference Include="QaaS.Common.Probes" Version="x.x.x" />
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

Use [QaaS.Runner.Template]({{ links.repository_runner_template }}) when you want a ready-to-run runner repo instead of wiring packages by hand.

```bash
dotnet new install QaaS.Runner.Template
dotnet new qaas-runner -n MyServiceTests
```

The generated repo includes:

- `NuGet.config` pointing at:
  - `{{ links.nuget_feed_a }}`
  - `{{ links.nuget_feed_b }}`
  - `{{ links.nuget_feed_c }}`
- `QaaS.Runner` with `Version="x.x.x"` (set a concrete package version for your project)
- a minimal valid `test.qaas.yaml`
- a Rider launch profile for `run test.qaas.yaml`

If you use Artifactory or another private feed, update the generated `NuGet.config` before the first restore.

## Allure CLI

The Allure CLI installation instructions are available in the [official Allure docs]({{ links.allure_installation_guide }}).
