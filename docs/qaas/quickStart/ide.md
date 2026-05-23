---
id: qaas.quickstart.ide
type: tutorial
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner]
keywords: [qaas, quickstart, ide]
summary: "QaaS.Runner can be configured in YAML or in C# (Configuration as Code). This page focuses on the YAML experience for Runner projects."
render_macros: true
---
# Runner IDE Setup

> TL;DR — Configure IDE schema assistance for Runner YAML while keeping C# configuration available when needed.

QaaS.Runner can be configured in YAML or in C# ([Configuration as Code](../advancedConcepts/configurationAsCode.md)). This page focuses on the YAML experience for Runner projects.

If your team keeps Runner definitions in `test.qaas.yaml`, configure your IDE with the Runner JSON schema so you get validation, completion, and structure-aware suggestions while editing.

## Runner Schema {: #runner-schema}

- [**QaaS.Runner Schema**]({{ links.runner_schema }})

The Runner schema covers:

- core `QaaS.Runner` configuration such as [MetaData](../userInterfaces/runner/configurationSections/metaData/overview.md), [Links](../userInterfaces/runner/configurationSections/links/overview.md), [Storages](../userInterfaces/runner/configurationSections/storages/overview.md), [DataSources](../userInterfaces/runner/configurationSections/dataSources/overview.md), [Sessions](../userInterfaces/runner/configurationSections/sessions/overview.md), and [Assertions](../userInterfaces/runner/configurationSections/assertions/overview.md)
- the packaged hook families commonly used by Runner projects, including [QaaS.Common.Assertions](../../assertions/index.md), [QaaS.Common.Generators](../../generators/index.md), and [QaaS.Common.Probes](../../probes/index.md)

## What you get after mapping the schema {: #what-you-get-after-mapping-the-schema}

After you attach the schema to your Runner YAML files, your IDE can provide:

- syntax highlighting
- auto-completion
- validation errors for invalid values or missing required fields
- contextual suggestions based on the current configuration section

!!! tip
    To trigger suggestions manually, use `Ctrl + Space`.

## VS Code {: #vs-code}

Open `settings.json` and add a YAML schema mapping for your Runner files:

```json
"yaml.schemas": {
  "{{ links.runner_schema }}": "test.qaas.yaml"
}
```

If your project uses a different file name or a folder pattern, change the right-hand side to match your own YAML files.

## Rider {: #rider}

1. Open `File` -> `Settings` -> `Languages & Frameworks` -> `Schemas and DTDs` -> `JSON Schema Mappings`.
2. Click the **+** button to add a new mapping.
3. Select the Runner schema file or URL.
4. Map it to `test.qaas.yaml` or to the YAML pattern your Runner project uses.

!!! warning "⚠️ Important"
    Rider stores schema mappings per project. Repeat this setup for each Runner repository you create.

## See also {: #see-also}

- [Installation](installation.md)
- [Write a test in YAML](writeTestYaml.md)
- [Configuration sections](../userInterfaces/runner/configurationSections/configurationSections.md)
- [Runner commands](../userInterfaces/runner/commands/commands.md)
