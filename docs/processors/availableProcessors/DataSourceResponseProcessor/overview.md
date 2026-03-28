# DataSourceResponseProcessor

Builds the response from generated data produced by one configured data source.

> Logical group: Data-driven responses / Data source lookup

## What It Does

Selects a generated item from an attached data source and returns that item as the HTTP response body.

It can choose the first item, the last item, or a zero-based index. When no item can be selected, it can return a fallback body instead of throwing. This is useful when responses should come from prepared files or generated fixtures.

## YAML Example

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

## What This Configuration Does

This configuration attaches the `PreparedResponses` data source to the stub and tells the processor to return the first generated response body from that source.

The body is returned as an HTTP `202` response with `application/json`.
