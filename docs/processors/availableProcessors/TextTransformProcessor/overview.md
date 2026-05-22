---
id: processors.available.texttransformprocessor.overview
slug: texttransformprocessor
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [processors, TextTransformProcessor, ProcessorConfiguration]
ai_summary: "Reads the incoming payload as text, applies the configured text transformation, and returns the transformed response."
tags: [processors]
canonical_url: /processors/availableProcessors/TextTransformProcessor/overview/
# Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\TextTransformProcessor.cs
---

# TextTransformProcessor

Reads the incoming payload as text, applies the configured text transformation, and returns the transformed response.

## What it does

Reads the incoming payload as text, applies the configured text transformation, and returns the transformed response. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: TextTransformProcessorSession
    Processors:
      - Name: TextTransformProcessorStep
        Processor: TextTransformProcessor
        ProcessorConfiguration:
        StatusCode:
        ContentType:
        Prefix:
        Suffix:
        SearchText:
        ReplacementText:
        TrimWhitespace:
        ResponseHeaders:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | processors |
| **YAML key** | `TextTransformProcessor` |
| **Schema** | [`processors.schema.json`](../../../_generated/schemas/processors.md) |
| **Source** | `QaaS.Common.Processors\QaaS.Common.Processors\TextTransformProcessor.cs` |

## See also

- [processors index](../../index.md)
- [Custom processor authoring guide](../../custom-authoring-guide.md)
