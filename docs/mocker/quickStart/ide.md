---
id: mocker.quickstart.ide
type: tutorial
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [mocker]
keywords: [mocker, quickstart, ide]
summary: "QaaS.Mocker can be configured in YAML or in C# (Configuration as Code). This page focuses on the YAML experience for Mocker projects."
render_macros: true
---
# Mocker IDE Setup

> TL;DR — Configure IDE schema assistance for Mocker YAML while keeping C# configuration available when needed.

QaaS.Mocker can be configured in YAML or in C# ([Configuration as Code](../../qaas/advancedConcepts/configurationAsCode.md)). This page focuses on the YAML experience for Mocker projects.

If your team keeps mock definitions in `mocker.qaas.yaml`, configure your IDE with the Mocker JSON schema so you get validation, completion, and structure-aware suggestions while editing.

## Mocker Schema {: #mocker-schema}

<a class="md-button md-button--primary" href="{{ links.mocker_schema }}" download="mocker-family-schema.json">Download QaaS.Mocker Schema</a>

The Mocker schema covers:

- core `QaaS.Mocker` configuration such as [DataSources](../userInterfaces/mocker/configurationSections/dataSources/overview.md), [Stubs](../userInterfaces/mocker/configurationSections/stubs/overview.md), [Controller](../userInterfaces/mocker/configurationSections/controller/overview.md), and [Servers](../userInterfaces/mocker/configurationSections/server/overview.md)
- packaged generator configuration used by Mocker projects through [QaaS.Common.Generators](../../generators/index.md)
- processor configuration for packaged [QaaS.Common.Processors](../../processors/index.md) and project-local processors referenced by [Stubs](../userInterfaces/mocker/configurationSections/stubs/overview.md)

## What you get after mapping the schema {: #what-you-get-after-mapping-the-schema}

After you attach the schema to your Mocker YAML files, your IDE can provide:

- syntax highlighting
- auto-completion
- validation errors for invalid values or missing required fields
- contextual suggestions based on the current configuration section

!!! tip
    To trigger suggestions manually, use `Ctrl + Space`.

## VS Code {: #vs-code}

Open `settings.json` and add a YAML schema mapping for your Mocker files:

```json
"yaml.schemas": {
  "{{ links.mocker_schema }}": "mocker.qaas.yaml"
}
```

If your project uses a different file name or a folder pattern, change the right-hand side to match your own YAML files.

## Rider {: #rider}

1. Open `File` -> `Settings` -> `Languages & Frameworks` -> `Schemas and DTDs` -> `JSON Schema Mappings`.
2. Click the **+** button to add a new mapping.
3. Select the Mocker schema file or URL.
4. Map it to `mocker.qaas.yaml` or to the YAML pattern your Mocker project uses.

!!! warning "⚠️ Important"
    Rider stores schema mappings per project. Repeat this setup for each Mocker repository you create.

## See also {: #see-also}

- [Installation](installation.md)
- [Create a mock in YAML](createMock.md)
- [Controller](../userInterfaces/mocker/configurationSections/controller/overview.md)
- [Servers](../userInterfaces/mocker/configurationSections/server/overview.md)
- [Stubs](../userInterfaces/mocker/configurationSections/stubs/overview.md)
