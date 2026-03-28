# Configuration Sections

Each configuration section in the `.yaml` file is used to perform a different action and has its own configurations and descriptions.
In this part of the documentation you can read about all the possible configurations available to you within each configuration section.

Use the section pages when you want the canonical reference for [MetaData](metaData/overview.md), [Links](links/overview.md), [Storages](storages/overview.md), [DataSources](dataSources/overview.md), [Sessions](sessions/overview.md), and [Assertions](assertions/overview.md).

The `.yaml` configuration file is divided into the following sections:

```yaml
Links: []

Storages: []

DataSources: []

Sessions: []

Assertions: []

MetaData: {}
```

## Table View Order

All configuration table views are ordered according to three rules.

1. The property paths are ordered like a YAML configuration, meaning all fields of every parent are under that parent.
2. Under every parent, fields are ordered by type: first basic types (`integer` / `number` / `string` / `bool` / `enum`), then arrays (`array`), and lastly fields that have sub-fields (`object`).
3. Under every parent, within each type batch, `required` fields come before `not required` fields.
