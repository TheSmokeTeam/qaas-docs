---
id: processors.available.staticresponseprocessor.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
prerequisites: [processors/availableProcessors/StaticResponseProcessor/overview.md]
code_langs: [yaml]
keywords: [processors, StaticResponseProcessor, configuration, reference]
ai_summary: "Field-by-field reference for StaticResponseProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json."
tags: [processors]
canonical_url: /processors/availableProcessors/StaticResponseProcessor/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json
---

# StaticResponseProcessor — Configuration (table view)

Generated from `processors.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.Body` | `null or string` | &#10006 |  | Response body to return as UTF-8 text |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.ContentType` | `string` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.ResponseHeaders` | `null or object or string` | &#10006 |  | Additional response headers |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
