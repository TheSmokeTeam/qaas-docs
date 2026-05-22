---
id: processors.available.statuscodetransactionprocessor.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, StatusCodeTransactionProcessor, ProcessorConfiguration]
summary: "Skim Transaction Processor which returns empty-bodied data objects with Status Code configuration."
---
<!-- Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\StatusCodeTransactionProcessor.cs -->

# StatusCodeTransactionProcessor

Skim Transaction Processor which returns empty-bodied data objects with Status Code configuration.

## What it does

Skim Transaction Processor which returns empty-bodied data objects with Status Code configuration. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: StatusCodeTransactionProcessorSession
    Processors:
      - Name: StatusCodeTransactionProcessorStep
        Processor: StatusCodeTransactionProcessor
        ProcessorConfiguration:
        StatusCode:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | processors |
| **YAML key** | `StatusCodeTransactionProcessor` |
| **Schema** | [`processors.schema.json`](../../../_generated/schemas/processors.md) |
| **Source** | `QaaS.Common.Processors\QaaS.Common.Processors\StatusCodeTransactionProcessor.cs` |

## See also

- [processors index](../../index.md)
- [Custom processor authoring guide](../../custom-authoring-guide.md)
