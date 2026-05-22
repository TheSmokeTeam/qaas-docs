---
id: processors.available.datasourceresponseprocessor.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
prerequisites: [processors/availableProcessors/DataSourceResponseProcessor/overview.md]
code_langs: [yaml]
keywords: [processors, DataSourceResponseProcessor, configuration, reference]
ai_summary: "Field-by-field reference for DataSourceResponseProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json."
tags: [processors]
canonical_url: /processors/availableProcessors/DataSourceResponseProcessor/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json
---

# DataSourceResponseProcessor — Configuration (table view)

Generated from `processors.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.DataSourceName` | `null or string` | &#10006 |  | Optional data source name. When omitted, the first data source is used. |
| `ProcessorConfiguration.SelectionMode` | `integer or string` | &#10004 |  | Selection mode used to pick a generated item from the resolved data source |
| `ProcessorConfiguration.Index` | `integer or string` | &#10006 |  | Zero-based item index used when SelectionMode is ByIndex |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.ContentType` | `null or string` | &#10006 |  | Optional response Content-Type header |
| `ProcessorConfiguration.FallbackBody` | `null or string` | &#10006 |  | Fallback body to return when the data source cannot be resolved or selected |
| `ProcessorConfiguration.ResponseHeaders` | `null or object or string` | &#10006 |  | Additional response headers |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
