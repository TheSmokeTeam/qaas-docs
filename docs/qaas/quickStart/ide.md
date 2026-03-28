# Runner IDE Setup

QaaS.Runner can be configured in YAML or in C# (Configuration as Code). This page focuses on the YAML experience for Runner projects.

If your team keeps Runner definitions in `test.qaas.yaml`, configure your IDE with the Runner JSON schema so you get validation, completion, and structure-aware suggestions while editing.

## Runner Schema

- [**QaaS.Runner Schema**]({{ links.runner_schema }})

The Runner schema covers:

- core `QaaS.Runner` configuration such as `MetaData`, `Links`, `Storages`, `DataSources`, `Sessions`, and `Assertions`
- the packaged hook families commonly used by Runner projects, including assertions, generators, and probes

## What you get after mapping the schema

After you attach the schema to your Runner YAML files, your IDE can provide:

- syntax highlighting
- auto-completion
- validation errors for invalid values or missing required fields
- contextual suggestions based on the current configuration section

!!! tip
    To trigger suggestions manually, use `Ctrl + Space`.

## VS Code

Open `settings.json` and add a YAML schema mapping for your Runner files:

```json
"yaml.schemas": {
  "{{ links.runner_schema }}": "test.qaas.yaml"
}
```

If your project uses a different file name or a folder pattern, change the right-hand side to match your own YAML files.

## Rider

1. Open `File` -> `Settings` -> `Languages & Frameworks` -> `Schemas and DTDs` -> `JSON Schema Mappings`.
2. Click the **+** button to add a new mapping.
3. Select the Runner schema file or URL.
4. Map it to `test.qaas.yaml` or to the YAML pattern your Runner project uses.

!!! warning "⚠️ Important"
    Rider stores schema mappings per project. Repeat this setup for each Runner repository you create.
