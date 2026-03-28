# Mocker IDE Setup

QaaS.Mocker can be configured in YAML or in C# (Configuration as Code). This page focuses on the YAML experience for Mocker projects.

If your team keeps mock definitions in `mocker.qaas.yaml`, configure your IDE with the Mocker JSON schema so you get validation, completion, and structure-aware suggestions while editing.

## Mocker Schema

- [**QaaS.Mocker Schema**]({{ links.mocker_schema }})

The Mocker schema covers:

- core `QaaS.Mocker` configuration such as `DataSources`, `Stubs`, `Controller`, and `Servers`
- packaged generator configuration used by mocker projects
- processor configuration for packaged processors and project-local processors referenced by the mock

## What you get after mapping the schema

After you attach the schema to your Mocker YAML files, your IDE can provide:

- syntax highlighting
- auto-completion
- validation errors for invalid values or missing required fields
- contextual suggestions based on the current configuration section

!!! tip
    To trigger suggestions manually, use `Ctrl + Space`.

## VS Code

Open `settings.json` and add a YAML schema mapping for your Mocker files:

```json
"yaml.schemas": {
  "{{ links.mocker_schema }}": "mocker.qaas.yaml"
}
```

If your project uses a different file name or a folder pattern, change the right-hand side to match your own YAML files.

## Rider

1. Open `File` -> `Settings` -> `Languages & Frameworks` -> `Schemas and DTDs` -> `JSON Schema Mappings`.
2. Click the **+** button to add a new mapping.
3. Select the Mocker schema file or URL.
4. Map it to `mocker.qaas.yaml` or to the YAML pattern your Mocker project uses.

!!! warning "⚠️ Important"
    Rider stores schema mappings per project. Repeat this setup for each Mocker repository you create.
