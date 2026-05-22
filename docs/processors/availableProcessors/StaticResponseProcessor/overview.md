---
id: processors.available.staticresponseprocessor.overview
slug: staticresponseprocessor
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [processors, StaticResponseProcessor, ProcessorConfiguration]
ai_summary: "Returns a fixed UTF-8 response body with the configured status code, content type, and headers."
tags: [processors]
canonical_url: /processors/availableProcessors/StaticResponseProcessor/overview/
# Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\StaticResponseProcessor.cs
---

# StaticResponseProcessor

Returns a fixed UTF-8 response body with the configured status code, content type, and headers.

## What it does

Returns a fixed UTF-8 response body with the configured status code, content type, and headers. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: StaticResponseProcessorSession
    Processors:
      - Name: StaticResponseProcessorStep
        Processor: StaticResponseProcessor
        ProcessorConfiguration:
        Body:
        StatusCode:
        ContentType:
        ResponseHeaders:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | processors |
| **YAML key** | `StaticResponseProcessor` |
| **Schema** | [`processors.schema.json`](../../../_generated/schemas/processors.md) |
| **Source** | `QaaS.Common.Processors\QaaS.Common.Processors\StaticResponseProcessor.cs` |

## See also

- [processors index](../../index.md)
- [Custom processor authoring guide](../../custom-authoring-guide.md)
