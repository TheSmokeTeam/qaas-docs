# DataSourceResponseProcessor

> TL;DR — Builds the response from generated data produced by one configured data source.

## When to use

Selects a generated item from an attached data source and returns that item as the HTTP response body.

It can choose the first item, the last item, or a zero-based index. When no item can be selected, it can return a fallback body instead of throwing. This is useful when responses should come from prepared files or generated fixtures.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
DataSources:
  - Name: PreparedResponses
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/responses
        SearchPattern: '*.json'
      StorageMetaData: ItemName

Stubs:
  - Name: DataSourceResponseProcessorStub
    Processor: DataSourceResponseProcessor
    DataSourceNames:
      - PreparedResponses
    ProcessorConfiguration:
      DataSourceName: PreparedResponses
      SelectionMode: First
      StatusCode: 202
      ContentType: application/json

Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /health
          Actions:
            - Name: HealthAction
              Method: Get
              TransactionStubName: DataSourceResponseProcessorStub
```

## Realistic example

This configuration attaches the `PreparedResponses` data source to the stub and tells the processor to return the first generated response body from that source.

The body is returned as an HTTP `202` response with `application/json`.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/DataSourceResponseProcessor/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/DataSourceResponseProcessor/configuration/yamlView/index.md)
- [Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md)
