---
id: mocker.userinterfaces.mocker.configurationsections.datasources.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [mocker]
keywords: [mocker, userinterfaces, configurationsections, datasources, overview]
summary: "The list of the data sources that contain enumerables of data to be generated and iterated later in several places."
---
<!-- Verified-against: QaaS.Framework\QaaS.Framework.Executions\BaseExecutionBuilder.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\DataSourceObjects\DataSourceBuilder.cs -->
<!-- Verified-against: QaaS.Framework\QaaS.Framework.SDK\Hooks\Generator\IGenerator.cs -->
<!-- Verified-against: QaaS.Mocker\QaaS.Mocker\ExecutionBuilder.cs -->
<!-- Verified-against: QaaS.Mocker\QaaS.Mocker\Logics\StubsLogic.cs -->
<!-- Verified-against: QaaS.Mocker\QaaS.Mocker.Stubs\ConfigurationObjects\TransactionStubBuilder.cs -->
<!-- Verified-against: QaaS.Mocker\QaaS.Mocker.Servers\ServerFactory.cs -->
<!-- Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromExternalSourceGenerators\FromFileSystem.cs -->

# DataSources

> TL;DR — DataSources define named generator-backed item streams that Mocker resolves before it builds stubs and servers.

## When to use {: #when-to-use}

Use DataSources when mock behavior needs generated request, response, or routing data.

- Transaction stubs select data sources by `DataSourceNames`.
- Other data sources can select entries by name or pattern to compose generated data.
- The socket server build path receives the resolved data-source list when server behavior depends on generated items.

Every data source entry points to an `IGenerator` hook through `Generator` and gives that hook its configuration through `GeneratorConfiguration`.

## YAML configuration {: #yaml-configuration}

Each `DataSources[]` entry needs a unique `Name` and a `Generator`. The `GeneratorConfiguration` object belongs to the selected generator; for example, `FromFileSystem` reads files from `GeneratorConfiguration.FileSystem.Path`.

Use `Lazy: true` when each consumer should trigger generation as it reads. Leave it unset when Mocker should cache generated items after the first retrieval. Use `DataSourceNames` or `DataSourcePatterns` when a generator needs other named data sources as input.

## C# (CAC) usage {: #c-cac-usage}

Code-based configuration uses `DataSourceBuilder.Named(string name)` and `DataSourceBuilder.HookNamed(string hookName)` to set the YAML-equivalent identity fields. Add the builder to Mocker with `ExecutionBuilder.AddDataSource(DataSourceBuilder dataSourceBuilder)`.

Transaction stubs reference the generated stream with `TransactionStubBuilder.AddDataSourceName(string dataSourceName)`.

## Minimal example {: #minimal-example}

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

## Realistic example {: #realistic-example}

A Mocker setup usually defines one response-body data source, passes it to a transaction stub through `DataSourceNames`, and lets the selected transaction processor choose which generated item becomes the response.

## Edge cases {: #edge-cases}

- `Name` values must be unique inside the `DataSources` list.
- `DataSourceNames` cannot contain the current data source's own `Name`.
- `Serialize` and `Deserialize` are mutually exclusive on the same data-source entry.
- A missing `Generator` or generator-specific required field fails configuration validation before Mocker starts.

## See also {: #see-also}

- [Configuration table](configurations/tableView.md)
- [YAML scaffold](configurations/yamlView.md)
- [Stubs](../stubs/overview.md)
- [Servers](../server/overview.md)
- [DataSourceBuilder API](../../../../../framework/functions/builders/data-sources.md)
- [TransactionStubBuilder API](../../../../functions/builders/transaction-stubs.md)
