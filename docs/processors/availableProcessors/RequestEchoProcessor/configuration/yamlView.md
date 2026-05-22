---
id: processors.available.requestechoprocessor.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, RequestEchoProcessor, yaml, scaffold]
summary: "Minimal YAML scaffold for RequestEchoProcessor ProcessorConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json -->

# RequestEchoProcessor — Configuration (YAML scaffold)

Drop this into the `ProcessorConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
ProcessorConfiguration:
  StatusCode:
  ContentType:
  IncludeRequestHeaders:
  IncludePathParameters:
  IncludeUri:
  ResponseHeaders:
```
