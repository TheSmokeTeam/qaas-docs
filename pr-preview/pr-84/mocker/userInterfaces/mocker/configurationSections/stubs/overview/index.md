# Stubs

> TL;DR — Stubs map named mock actions to transaction processor hooks and optional data-source inputs.

## When to use

Use `Stubs` when a server action needs a named transaction processor. Each stub has a `Name`, selects a processor through `Processor`, and can pass data-source inputs through `DataSourceNames`.

Server endpoint actions reference stubs by name through their transaction-stub fields.

## YAML configuration

Use `Stubs[]` for transaction processor entries. Put processor-specific settings under `ProcessorConfiguration`.

The complete schema-derived field list is in the [configuration table](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/configurations/tableView/index.md). The copy-ready scaffold is in the [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/configurations/yamlView/index.md).

## Edge cases

- `Name` values must stay aligned with server action references.
- `Processor` must match an available transaction processor hook.
- Use `DataSourceNames` only when the selected processor reads generated data-source inputs.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/configurations/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/configurations/yamlView/index.md)
- [Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md)
- [DataSources](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/dataSources/overview/index.md)
- [Servers](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/server/overview/index.md)
