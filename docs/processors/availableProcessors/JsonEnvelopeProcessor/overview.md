---
id: processors.available.jsonenvelopeprocessor.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, JsonEnvelopeProcessor, ProcessorConfiguration]
summary: "Wraps the incoming request payload and optional request metadata in a JSON envelope response."
---
<!-- Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\JsonEnvelopeProcessor.cs -->

# JsonEnvelopeProcessor

Wraps the incoming request payload and optional request metadata in a JSON envelope response.

## What it does

Wraps the incoming request payload and optional request metadata in a JSON envelope response. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: JsonEnvelopeProcessorSession
    Processors:
      - Name: JsonEnvelopeProcessorStep
        Processor: JsonEnvelopeProcessor
        ProcessorConfiguration:
        StatusCode:
        ContentType:
        BodyPropertyName:
        IncludeBodyType:
        IncludeUri:
        IncludeRequestHeaders:
        IncludePathParameters:
        ResponseHeaders:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | processors |
| **YAML key** | `JsonEnvelopeProcessor` |
| **Schema** | [`processors.schema.json`](../../../_generated/schemas/processors.md) |
| **Source** | `QaaS.Common.Processors\QaaS.Common.Processors\JsonEnvelopeProcessor.cs` |

## See also

- [processors index](../../index.md)
- [Custom processor authoring guide](../../custom-authoring-guide.md)
