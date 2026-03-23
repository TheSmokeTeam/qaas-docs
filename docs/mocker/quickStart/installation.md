# Installation

## Prerequisites

| Requirement | Details |
| ----------- | ------- |
| [.NET SDK]({{ links.dotnet_sdk }}) | Version **10.0** |
| NuGet feed | A global `NuGet.Config` file configured with feed URLs A, B, and C |
| IDE setup | Recommended for YAML schema validation and completion |

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

Add the package to your project:

=== "`.csproj`"

    ```xml
    <ItemGroup>
      <PackageReference Include="QaaS.Mocker" Version="x.x.x" />
      <PackageReference Include="QaaS.Common.Generators" Version="x.x.x" />
    </ItemGroup>
    ```

=== "CLI"

    ```bash
    dotnet add package QaaS.Mocker
    dotnet add package QaaS.Common.Generators
    ```

`QaaS.Common.Generators` is optional in general, but it is used by the quick-start examples on this site.

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

All QaaS projects can be configured using either **YAML** files or **C# code**. YAML is convenient for versioned configuration, while C# is useful when you need programmatic composition, reuse, or conditional behavior.

If you work with YAML, use an IDE with schema validation and completion enabled.

### Available Schemas

- [**QaaS.Runner Schema**]({{ links.runner_schema }}) - covers Runner configuration and its common hook packages.
- [**QaaS.Mocker Schema**]({{ links.mocker_schema }}) - covers Mocker configuration and its common hook packages.

| Schema file | Covers |
| ----------- | ------ |
| `runnerSchema.json` | Core `QaaS.Runner` configuration plus the commonly documented Runner hook packages |
| `mockerSchema.json` | Core `QaaS.Mocker` configuration plus the commonly documented Mocker hook packages |

### Using the Schema

After the schema is configured in your IDE, you get:

- syntax highlighting
- auto-completion
- validation errors for invalid values or missing required fields
- contextual suggestions for the current section of the file

### IDE Recommendations

=== "VS Code"

    1. Install the [YAML extension for VS Code]({{ links.vscode_yaml_extension }}).
    2. Open `settings.json`.
    3. Add a schema mapping:

        ```json
        "yaml.schemas": {
          "{{ links.mocker_schema }}": "mocker.qaas.yaml",
          "{{ links.runner_schema }}": "test.qaas.yaml"
        }
        ```

=== "Rider"

    1. Open `File` -> `Settings` -> `Languages & Frameworks` -> `Schemas and DTDs` -> `JSON Schema Mappings`.
    2. Add the schema file or URL you want to use.
    3. Map it to `mocker.qaas.yaml` or another project-specific YAML pattern.
