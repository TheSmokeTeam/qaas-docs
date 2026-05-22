---
id: processors.available.problemdetailsprocessor.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, ProblemDetailsProcessor, ProcessorConfiguration]
summary: "Returns an RFC 7807 style problem-details JSON response using the configured status and fields."
---
<!-- Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\ProblemDetailsProcessor.cs -->

# ProblemDetailsProcessor

Returns an RFC 7807 style problem-details JSON response using the configured status and fields.

## What it does

Returns an RFC 7807 style problem-details JSON response using the configured status and fields. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: ProblemDetailsProcessorSession
    Processors:
      - Name: ProblemDetailsProcessorStep
        Processor: ProblemDetailsProcessor
        ProcessorConfiguration:
        StatusCode:
        Title:
        Detail:
        Type:
        Instance:
        UseRequestUriAsInstance:
        ContentType:
        Extensions:
        ResponseHeaders:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | processors |
| **YAML key** | `ProblemDetailsProcessor` |
| **Schema** | [`processors.schema.json`](../../../_generated/schemas/processors.md) |
| **Source** | `QaaS.Common.Processors\QaaS.Common.Processors\ProblemDetailsProcessor.cs` |

## See also

- [processors index](../../index.md)
- [Custom processor authoring guide](../../custom-authoring-guide.md)
