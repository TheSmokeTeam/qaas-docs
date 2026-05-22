---
id: processors.available.conditionalresponseprocessor.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
prerequisites: [processors/availableProcessors/ConditionalResponseProcessor/overview.md]
code_langs: [yaml]
keywords: [processors, ConditionalResponseProcessor, configuration, reference]
ai_summary: "Field-by-field reference for ConditionalResponseProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json."
tags: [processors]
canonical_url: /processors/availableProcessors/ConditionalResponseProcessor/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json
---

# ConditionalResponseProcessor — Configuration (table view)

Generated from `processors.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.Rules` | `array or string` | &#10004 |  | Rules evaluated in order. The first matching rule wins. |
| `ProcessorConfiguration.DefaultBody` | `null or string` | &#10006 |  | Fallback response body when no rule matches |
| `ProcessorConfiguration.DefaultStatusCode` | `integer or string` | &#10004 |  | Fallback response Status Code |
| `ProcessorConfiguration.DefaultContentType` | `string` | &#10004 |  | Fallback response Content-Type header |
| `ProcessorConfiguration.DefaultResponseHeaders` | `null or object or string` | &#10006 |  | Fallback response headers |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
