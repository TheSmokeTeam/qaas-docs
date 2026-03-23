# Installation

## Prerequisites

| Requirement | Details |
| ----------- | ------- |
| [.NET SDK]({{ links.dotnet_sdk }}) | Version **10.0** |
| NuGet feed | A global `NuGet.Config` file configured with feed URLs A, B, and C |
| IDE setup | Recommended for YAML schema validation and completion |

## Global NuGet.Config

Add package sources to your global `NuGet.Config` file, usually `~/.nuget/NuGet/NuGet.Config`.

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

Add the package to your project:

=== "`.csproj`"

    ```xml
    <ItemGroup>
      <PackageReference Include="QaaS.Mocker" Version="*" />
      <PackageReference Include="QaaS.Common.Generators" Version="*" />
      <PackageReference Include="QaaS.Common.Processors" Version="*" />
    </ItemGroup>
    ```

=== "CLI"

    ```bash
    dotnet add package QaaS.Mocker
    dotnet add package QaaS.Common.Generators
    dotnet add package QaaS.Common.Processors
    ```

`QaaS.Common.Generators` is optional in general, but it is used by the quick-start examples on this site. `QaaS.Common.Processors` is also optional, but install it when you want packaged reusable processors instead of only project-local processor classes.

## Project Template

Use [QaaS.Mocker.Template]({{ links.repository_mocker_template }}) when you want a ready-to-run mocker repo instead of wiring packages by hand.

```bash
dotnet new install QaaS.Mocker.Template
dotnet new qaas-mocker -n MyServiceMock
```

The generated repo includes:

- `NuGet.config` pointing at:
  - `{{ links.nuget_feed_a }}`
  - `{{ links.nuget_feed_b }}`
  - `{{ links.nuget_feed_c }}`
- `QaaS.Mocker` with `Version="x.x.x"` (set a concrete package version for your project)
- a minimal `/health` mock under `Servers`
- `Dockerfile` and generated GitHub Actions CI

If you use Artifactory or another private feed, update the generated `NuGet.config` before the first restore.

## IDE Setup

All QaaS projects can be configured using either **YAML** files or **C# code** (Configuration as Code). While YAML provides a declarative, human-readable format ideal for version control and collaboration, **C# offers full programmatic control** for dynamic, conditional, and reusable mock logic.

For teams choosing to use YAML, it is strongly recommended to use a capable IDE with real-time schema validation and intelligent code completion to ensure correctness, reduce errors, and improve productivity.

### Available Schemas

- [**QaaS.Runner Schema**]({{ links.runner_schema }}) - Covers all core configuration fields for the QaaS Runner.
- [**QaaS.Mocker Schema**]({{ links.mocker_schema }}) - Covers all hook configuration fields for the QaaS Mocker.

| Schema file | Covers |
| ----------- | ------ |
| `runnerSchema.json` | Core `QaaS.Runner` configuration plus the commonly documented Runner hook packages |
| `mockerSchema.json` | Core `QaaS.Mocker` configuration, generator hook configuration from `QaaS.Common.Generators`, common packaged processor configuration, and project-local processor sections referenced by your mock |

!!! note
    Each schema corresponds to a specific component of the QaaS ecosystem. Use the correct schema based on your configuration file's content.
    Moreover, each schema covers all its relevant hooks even if their NuGet packages are not yet installed in the project.

### Using the Schema

After installing the schema in your IDE:

- syntax highlighting
- auto-completion
- validation errors for invalid values or missing required fields
- contextual suggestions for the current section of the file

!!! tip
    To trigger suggestions, use `Ctrl + Space`.

## IDE Recommendations & Setup

=== "VS Code"

    1. Install the [YAML extension for VS Code]({{ links.vscode_yaml_extension }}).
    2. Open VS Code -> `File` -> `Preferences` -> `Settings`.
    3. Search for `yaml: schemas`.
    4. Click **"Edit in settings.json"**.
    5. Add a schema mapping:

        ```json
        "yaml.schemas": {
          "{{ links.mocker_schema }}": "mocker.qaas.yaml",
          "{{ links.runner_schema }}": "test.qaas.yaml"
        }
        ```

    6. Save the file and restart VS Code.
    7. Open any `.yaml` file and schema validation plus auto-completion will now be active.

=== "Rider"

    1. Open `File` -> `Settings` -> `Languages & Frameworks` -> `Schemas and DTDs` -> `JSON Schema Mappings`.
    2. Click the **+** button to add a new mapping.
    3. Add the schema file or URL you want to use.
    4. Map it to `mocker.qaas.yaml` or another project-specific YAML pattern.

    !!! warning "Important"
        This configuration is project-specific. You must repeat this setup for each new QaaS project.
