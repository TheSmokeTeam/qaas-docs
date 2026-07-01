---
id: qaas.userinterfaces.runner.configurationsections.configurationsections
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections]
summary: "Each configuration section in the .yaml file is used to perform a different action and has its own configurations and descriptions."
---

# Configuration Sections

Each configuration section in the `.yaml` file is used to perform a different action and has its own configurations and descriptions.
In this part of the documentation you can read about all the possible configurations available to you within each configuration section.

> TL;DR: Runner YAML is split into top-level sections for metadata, links, storage, data sources, sessions, assertions, and reporters. Layer additional files, folders, cases, references, and overrides when a base file should stay reusable.

## When to use {: #when-to-use}

- You are deciding where a setting belongs in a Runner configuration file.
- You need a compact map from top-level YAML sections to the detailed reference pages.
- You want a layering pattern for environment-specific or case-specific overrides.

Use the section pages when you want the canonical reference for [MetaData](metaData/overview.md), [Links](links/overview.md), [Storages](storages/overview.md), [DataSources](dataSources/overview.md), [Sessions](sessions/overview.md), [Assertions](assertions/overview.md), and [Reporters](reporters/overview.md).

The `.yaml` configuration file is divided into the following sections:

- `MetaData`
- `Links`
- `Storages`
- `DataSources`
- `Sessions`
- `Assertions`
- `Reporters`

## Layering Example {: #layering-example}

Keep the shared file focused on stable structure:

```yaml
MetaData:
  Environment: local
  System: Checkout
  Team: Platform
Links: []
Storages: []
DataSources: []
Sessions: []
Assertions: []
```

Put environment-specific values in an overwrite file:

```yaml
MetaData:
  Environment: ci
  System: Checkout
  Team: Platform
Links: []
Storages: []
DataSources: []
Sessions: []
Assertions: []
```

Run with the base file first and the overwrite file after it:

```bash
dotnet run -- run test.qaas.yaml -w environments/ci.qaas.yaml
```

For larger setups, use `-f environments/ci` to apply all top-level `.yaml` and `.yml` files in that folder in alphabetical order, then use `-r MetaData:BuildId=1234` for one-off command-line values.

## Table View Order {: #table-view-order}

All configuration table views are ordered according to three rules.

1. The property paths are ordered like a YAML configuration, meaning all fields of every parent are under that parent.
2. Under every parent, fields are ordered by type: first basic types (`integer` / `number` / `string` / `bool` / `enum`), then arrays (`array`), and lastly fields that have sub-fields (`object`).
3. Under every parent, within each type batch, `required` fields come before `not required` fields.

## See also {: #see-also}

- [Configuration Resolution](../configurationResolutionPriority.md)
- [MetaData](metaData/overview.md)
- [Links](links/overview.md)
- [Storages](storages/overview.md)
- [DataSources](dataSources/overview.md)
- [Sessions](sessions/overview.md)
- [Assertions](assertions/overview.md)
- [Reporters](reporters/overview.md)
