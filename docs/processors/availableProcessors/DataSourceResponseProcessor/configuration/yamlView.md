---
id: processors.available.datasourceresponseprocessor.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, DataSourceResponseProcessor, yaml, scaffold]
summary: "Minimal YAML scaffold for DataSourceResponseProcessor ProcessorConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json -->

# DataSourceResponseProcessor — Configuration (YAML scaffold)

Drop this into the `ProcessorConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
ProcessorConfiguration:
  DataSourceName:
  SelectionMode:
  Index:
  StatusCode:
  ContentType:
  FallbackBody:
  ResponseHeaders:
```
