---
id: processors.available.conditionalresponseprocessor.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, ConditionalResponseProcessor, ProcessorConfiguration]
summary: "Returns the first configured response whose rule matches the incoming request metadata, or the configured default response when no rule matches."
---
<!-- Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\ConditionalResponseProcessor.cs -->

# ConditionalResponseProcessor

Returns the first configured response whose rule matches the incoming request metadata, or the configured default response when no rule matches.

## What it does

Returns the first configured response whose rule matches the incoming request metadata, or the configured default response when no rule matches. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: ConditionalResponseProcessorSession
    Processors:
      - Name: ConditionalResponseProcessorStep
        Processor: ConditionalResponseProcessor
        ProcessorConfiguration:
        Rules: []
        DefaultBody:
        DefaultStatusCode:
        DefaultContentType:
        DefaultResponseHeaders:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | processors |
| **YAML key** | `ConditionalResponseProcessor` |
| **Schema** | [`processors.schema.json`](../../../_generated/schemas/processors.md) |
| **Source** | `QaaS.Common.Processors\QaaS.Common.Processors\ConditionalResponseProcessor.cs` |

## See also

- [processors index](../../index.md)
- [Custom processor authoring guide](../../custom-authoring-guide.md)
