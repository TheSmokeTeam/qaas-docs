---
id: processors.available.requestechoprocessor.overview
slug: requestechoprocessor
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [processors, RequestEchoProcessor, ProcessorConfiguration]
ai_summary: "Returns a JSON response that echoes the incoming request body and optional request metadata."
tags: [processors]
canonical_url: /processors/availableProcessors/RequestEchoProcessor/overview/
# Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\RequestEchoProcessor.cs
---

# RequestEchoProcessor

Returns a JSON response that echoes the incoming request body and optional request metadata.

## What it does

Returns a JSON response that echoes the incoming request body and optional request metadata. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: RequestEchoProcessorSession
    Processors:
      - Name: RequestEchoProcessorStep
        Processor: RequestEchoProcessor
        ProcessorConfiguration:
        StatusCode:
        ContentType:
        IncludeRequestHeaders:
        IncludePathParameters:
        IncludeUri:
        ResponseHeaders:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | processors |
| **YAML key** | `RequestEchoProcessor` |
| **Schema** | [`processors.schema.json`](../../../_generated/schemas/processors.md) |
| **Source** | `QaaS.Common.Processors\QaaS.Common.Processors\RequestEchoProcessor.cs` |

## See also

- [processors index](../../index.md)
- [Custom processor authoring guide](../../custom-authoring-guide.md)
