# Mocker IDE Setup

> TL;DR — Configure IDE schema assistance for Mocker YAML while keeping C# configuration available when needed.

QaaS.Mocker can be configured in YAML or in C# ([Configuration as Code](https://TheSmokeTeam.github.io/qaas-docs/qaas/advancedConcepts/configurationAsCode/index.md)). This page focuses on the YAML experience for Mocker projects.

If your team keeps mock definitions in `mocker.qaas.yaml`, configure your IDE with the Mocker JSON schema so you get validation, completion, and structure-aware suggestions while editing.

## Mocker Schema

[Download QaaS.Mocker Schema](https://TheSmokeTeam.github.io/qaas-docs/assets/schemas/mocker-family-schema.json)

The Mocker schema covers:

- core `QaaS.Mocker` configuration such as [DataSources](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/dataSources/overview/index.md), [Stubs](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/overview/index.md), [Controller](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/overview/index.md), and [Servers](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/server/overview/index.md)
- packaged generator configuration used by Mocker projects through [QaaS.Common.Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md)
- processor configuration for packaged [QaaS.Common.Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md) and project-local processors referenced by [Stubs](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/overview/index.md)

## What you get after mapping the schema

After you attach the schema to your Mocker YAML files, your IDE can provide:

- syntax highlighting
- auto-completion
- validation errors for invalid values or missing required fields
- contextual suggestions based on the current configuration section

Tip

To trigger suggestions manually, use `Ctrl + Space`.

## VS Code

Open `settings.json` and add a YAML schema mapping for your Mocker files:

```json
{
  "yaml.schemas": {
    "../../../assets/schemas/mocker-family-schema.json": "mocker.qaas.yaml"
  }
}
```

If your project uses a different file name or a folder pattern, change the right-hand side to match your own YAML files.

## Rider

1. Open `File` -> `Settings` -> `Languages & Frameworks` -> `Schemas and DTDs` -> `JSON Schema Mappings`.
1. Click the **+** button to add a new mapping.
1. Select the Mocker schema file or URL.
1. Map it to `mocker.qaas.yaml` or to the YAML pattern your Mocker project uses.

⚠️ Important

Rider stores schema mappings per project. Repeat this setup for each Mocker repository you create.

## See also

- [Installation](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/installation/index.md)
- [Create a mock in YAML](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/createMock/index.md)
- [Controller](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/overview/index.md)
- [Servers](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/server/overview/index.md)
- [Stubs](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/overview/index.md)
