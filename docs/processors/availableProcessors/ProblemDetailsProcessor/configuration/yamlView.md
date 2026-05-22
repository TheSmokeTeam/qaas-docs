---
id: processors.available.problemdetailsprocessor.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
prerequisites: [processors/availableProcessors/ProblemDetailsProcessor/overview.md]
code_langs: [yaml]
keywords: [processors, ProblemDetailsProcessor, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for ProblemDetailsProcessor ProcessorConfiguration — copy, fill the blanks, drop into a Session step."
tags: [processors]
canonical_url: /processors/availableProcessors/ProblemDetailsProcessor/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json
---

# ProblemDetailsProcessor — Configuration (YAML scaffold)

Drop this into the `ProcessorConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
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
