---
id: processors.available.datasourceresponseprocessor.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, DataSourceResponseProcessor, ProcessorConfiguration]
summary: "Builds the response from generated data produced by one configured data source."
---
<!-- Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\DataSourceResponseProcessor.cs -->

# DataSourceResponseProcessor

> TL;DR — Builds the response from generated data produced by one configured data source.

## When to use {: #when-to-use}

Selects a generated item from an attached data source and returns that item as the HTTP response body.

It can choose the first item, the last item, or a zero-based index. When no item can be selected, it can return a fallback body instead of throwing. This is useful when responses should come from prepared files or generated fixtures.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

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

## Realistic example {: #realistic-example}

This configuration attaches the `PreparedResponses` data source to the stub and tells the processor to return the first generated response body from that source.

The body is returned as an HTTP `202` response with `application/json`.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Processors](../../index.md)
