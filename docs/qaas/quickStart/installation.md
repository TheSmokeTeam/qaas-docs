# Installation

## Prerequisites

| Requirement                              | Details                           |
|------------------------------------------|-----------------------------------|
| [.NET SDK]({{ links.dotnet_sdk }})       | Version **10.0**                  |
| NuGet feeds                              | More details below                |
| [Allure CLI]({{ links.allure_install }}) | 0optional - *for viewing reports* |

### NuGet Feed Configuration

Add this feeds to your global `NuGet.Config` (usually `~/.nuget/NuGet/NuGet.Config`):

```xml
<add key="Feed_A" value="{{ links.nuget_feed_a }}" />
<add key="Feed_B" value="{{ links.nuget_feed_b }}" />
<add key="Feed_C" value="{{ links.nuget_feed_c }}" />
```

## Packages

Add the packages your project needs. At minimum, you need `QaaS.Runner`; the Common libraries are optional plugins.

=== "`.csproj`"

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

=== "CLI"

    ```bash
    nuget install QaaS.Runner # required
    nuget install QaaS.Common.Assertions # optional - contains common assertion
    nuget install QaaS.Common.Generators # optional - contains common data generators
    nuget install QaaS.Common.Probes # optional - contains common probes
    ```

!!! tip "Version compatibility"
    All Common packages must share the same `QaaS.Framework.SDK` version (or a compatible newer minor) as the `QaaS.Runner` you reference.

## Project Templates

QaaS provides `dotnet new` templates for scaffolding new test projects.
These templates are available at: [QaaS Project Templates Repository]({{ links.qaas_project_templates }})

```bash
# Install
dotnet new install QaaS.ProjectTemplates

# Uninstall
dotnet new uninstall QaaS.ProjectTemplates
```

??? example "The template creates"

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

The Allure CLI tool, along with installation instructions.
Can be found at: [Allure CLI Repository]({{ links.allure_install }})
