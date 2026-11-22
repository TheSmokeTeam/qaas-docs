# DataSources

> TL;DR — DataSources define named generator-backed item streams that Mocker resolves before it builds stubs and servers.

## When to use

Use DataSources when mock behavior needs generated request, response, or routing data.

- Transaction stubs select data sources by `DataSourceNames`.
- Other data sources can select entries by name or pattern to compose generated data.
- The socket server build path receives the resolved data-source list when server behavior depends on generated items.

Every data source entry points to an `IGenerator` hook through `Generator` and gives that hook its configuration through `GeneratorConfiguration`.

## YAML configuration

Each `DataSources[]` entry needs a unique `Name` and a `Generator`. The `GeneratorConfiguration` object belongs to the selected generator; for example, `FromFileSystem` reads files from `GeneratorConfiguration.FileSystem.Path`.

Use `Lazy: true` when each consumer should trigger generation as it reads. Leave it unset when Mocker should cache generated items after the first retrieval. Use `DataSourceNames` or `DataSourcePatterns` when a generator needs other named data sources as input.

## C# (CAC) usage

Code-based configuration uses `DataSourceBuilder.Named(string name)` and `DataSourceBuilder.HookNamed(string hookName)` to set the YAML-equivalent identity fields. Add the builder to Mocker with `ExecutionBuilder.AddDataSource(DataSourceBuilder dataSourceBuilder)`.

Transaction stubs reference the generated stream with `TransactionStubBuilder.AddDataSourceName(string dataSourceName)`.

## Minimal example

```yaml
DataSources:
  - Name: ResponseBodies
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/responses
        SearchPattern: '*.json'
      StorageMetaData: ItemName
```

## Realistic example

A Mocker setup usually defines one response-body data source, passes it to a transaction stub through `DataSourceNames`, and lets the selected transaction processor choose which generated item becomes the response.

## Edge cases

- `Name` values must be unique inside the `DataSources` list.
- `DataSourceNames` cannot contain the current data source's own `Name`.
- `Serialize` and `Deserialize` are mutually exclusive on the same data-source entry.
- A missing `Generator` or generator-specific required field fails configuration validation before Mocker starts.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/dataSources/configurations/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/dataSources/configurations/yamlView/index.md)
- [Stubs](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/overview/index.md)
- [Servers](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/server/overview/index.md)
- [DataSourceBuilder API](https://TheSmokeTeam.github.io/qaas-docs/framework/functions/builders/data-sources/index.md)
- [TransactionStubBuilder API](https://TheSmokeTeam.github.io/qaas-docs/mocker/functions/builders/transaction-stubs/index.md)
