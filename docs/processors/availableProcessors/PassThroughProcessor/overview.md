---
id: processors.available.passthroughprocessor.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, PassThroughProcessor, ProcessorConfiguration]
summary: "Returns the incoming request payload unchanged while applying the configured response metadata."
---
<!-- Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\PassThroughProcessor.cs -->

# PassThroughProcessor

Returns the incoming request payload unchanged while applying the configured response metadata.

## What it does

Returns the incoming request payload unchanged while applying the configured response metadata. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: PassThroughProcessorSession
    Processors:
      - Name: PassThroughProcessorStep
        Processor: PassThroughProcessor
        ProcessorConfiguration:
        StatusCode:
        ContentType:
        ResponseHeaders:
        PreserveMetaData:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | processors |
| **YAML key** | `PassThroughProcessor` |
| **Schema** | [`processors.schema.json`](../../../_generated/schemas/processors.md) |
| **Source** | `QaaS.Common.Processors\QaaS.Common.Processors\PassThroughProcessor.cs` |

## See also

- [processors index](../../index.md)
- [Custom processor authoring guide](../../custom-authoring-guide.md)
