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

Builds the response from generated data produced by one configured data source.

## What it does

Builds the response from generated data produced by one configured data source. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DataSourceResponseProcessorSession
    Processors:
      - Name: DataSourceResponseProcessorStep
        Processor: DataSourceResponseProcessor
        ProcessorConfiguration:
        DataSourceName:
        SelectionMode:
        Index:
        StatusCode:
        ContentType:
        FallbackBody:
        ResponseHeaders:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | processors |
| **YAML key** | `DataSourceResponseProcessor` |
| **Schema** | [`processors.schema.json`](../../../_generated/schemas/processors.md) |
| **Source** | `QaaS.Common.Processors\QaaS.Common.Processors\DataSourceResponseProcessor.cs` |

## See also

- [processors index](../../index.md)
- [Custom processor authoring guide](../../custom-authoring-guide.md)
