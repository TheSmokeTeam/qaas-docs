# DataSources

> TL;DR — DataSources define named generator-backed item streams that Runner loads before sessions and assertions run.

## When to use

Use DataSources when generated data must be reused by more than one part of a run.

- Publishers select data sources by `DataSourceNames` or `DataSourcePatterns`.
- Other data sources can select earlier or later entries by name or pattern to chain generation.
- Assertions receive the resolved data-source list selected by their own data-source filters.

Every data source entry points to an `IGenerator` hook through `Generator` and gives that hook its configuration through `GeneratorConfiguration`.

## YAML configuration

Each `DataSources[]` entry needs a unique `Name` and a `Generator`. The `GeneratorConfiguration` object belongs to the selected generator; for example, `FromFileSystem` reads files from `GeneratorConfiguration.FileSystem.Path`.

Use `Lazy: true` when each consumer should trigger generation as it reads. Leave it unset when Runner should cache generated items after the first retrieval. Use `DataSourceNames` or `DataSourcePatterns` when a generator needs other named data sources as input.

## C# (CAC) usage

Code-based configuration uses `DataSourceBuilder.Named(string name)` and `DataSourceBuilder.HookNamed(string hookName)` to set the YAML-equivalent identity fields. Add the builder to Runner with `ExecutionBuilder.AddDataSource(DataSourceBuilder dataSourceBuilder)`.

The same builder exposes `Configure(object configuration)`, `UpdateConfiguration(object configuration)`, `AddDataSourceName(string dataSourceName)`, `AddDataSourcePattern(string dataSourcePattern)`, and `IsLazy()` for the common DataSources fields.

## Minimal example

```yaml
DataSources:
  - Name: PayloadFiles
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/payloads
        SearchPattern: '*.json'
      StorageMetaData: ItemName
```

## Realistic example

A Runner flow usually defines one file-backed data source, references it from a publisher through `DataSourceNames`, and references the same data source from an assertion when the assertion needs the expected payloads.

## Edge cases

- `Name` values must be unique inside the `DataSources` list.
- `DataSourceNames` cannot contain the current data source's own `Name`.
- `Serialize` and `Deserialize` are mutually exclusive on the same data-source entry.
- A missing `Generator` or generator-specific required field fails configuration validation before the run starts.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/dataSources/configurations/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/dataSources/configurations/yamlView/index.md)
- [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
- [Assertions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/overview/index.md)
- [DataSourceBuilder API](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/builders/data-sources/index.md)
