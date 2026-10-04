# Configuration Sections

> TL;DR — Each configuration section in the mocker.qaas.yaml file is used to perform a different action and has its own configurations and descriptions.

Each configuration section in the `mocker.qaas.yaml` file is used to perform a different action and has its own configurations and descriptions. In this part of the documentation you can read about all of the possible configurations available to you within each configuration section.

Use the section pages when you want the canonical reference for [DataSources](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/dataSources/overview/index.md), [Stubs](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/overview/index.md), [Controller](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/overview/index.md), and [Servers](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/server/overview/index.md).

The `mocker.qaas.yaml` configuration file is divided into the following sections:

```yaml
DataSources: []

Stubs: []

Controller: {}

Servers: []
```

## Table View Order

All configuration table views are ordered according to three rules.

1. The property paths are ordered like a YAML configuration, meaning all fields of every parent are under that parent.
1. Under every parent, fields are ordered by type: first basic types (`integer` / `number` / `string` / `bool` / `enum`), then arrays (`array`), and lastly fields that have sub-fields (`object`).
1. Under every parent, within each type batch, `required` fields come before `not required` fields.

## See also

- [QaaS Mocker](https://TheSmokeTeam.github.io/qaas-docs/mocker/index.md)
