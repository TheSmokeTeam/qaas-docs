# Runner IDE Setup

> TL;DR — Configure IDE schema assistance for Runner YAML while keeping C# configuration available when needed.

QaaS.Runner can be configured in YAML or in C# ([Configuration as Code](https://TheSmokeTeam.github.io/qaas-docs/qaas/advancedConcepts/configurationAsCode/index.md)). This page focuses on the YAML experience for Runner projects.

If your team keeps Runner definitions in `test.qaas.yaml`, configure your IDE with the Runner JSON schema so you get validation, completion, and structure-aware suggestions while editing.

## Runner Schema

[Download QaaS.Runner Schema](https://TheSmokeTeam.github.io/qaas-docs/assets/schemas/runner-family-schema.json)

The Runner schema covers:

- core `QaaS.Runner` configuration such as [MetaData](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/metaData/overview/index.md), [Links](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/links/overview/index.md), [Storages](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/storages/overview/index.md), [DataSources](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/dataSources/overview/index.md), [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md), and [Assertions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/overview/index.md)
- the packaged hook families commonly used by Runner projects, including [QaaS.Common.Assertions](https://TheSmokeTeam.github.io/qaas-docs/assertions/index.md), [QaaS.Common.Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md), and [QaaS.Common.Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)

## What you get after mapping the schema

After you attach the schema to your Runner YAML files, your IDE can provide:

- syntax highlighting
- auto-completion
- validation errors for invalid values or missing required fields
- contextual suggestions based on the current configuration section

Tip

To trigger suggestions manually, use `Ctrl + Space`.

## VS Code

Open `settings.json` and add a YAML schema mapping for your Runner files:

```json
{
  "yaml.schemas": {
    "../../../assets/schemas/runner-family-schema.json": "test.qaas.yaml"
  }
}
```

If your project uses a different file name or a folder pattern, change the right-hand side to match your own YAML files.

## Rider

1. Open `File` -> `Settings` -> `Languages & Frameworks` -> `Schemas and DTDs` -> `JSON Schema Mappings`.
1. Click the **+** button to add a new mapping.
1. Select the Runner schema file or URL.
1. Map it to `test.qaas.yaml` or to the YAML pattern your Runner project uses.

⚠️ Important

Rider stores schema mappings per project. Repeat this setup for each Runner repository you create.

## See also

- [Installation](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/installation/index.md)
- [Write a test in YAML](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/writeTestYaml/index.md)
- [Configuration sections](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/configurationSections/index.md)
- [Runner commands](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/commands/index.md)
