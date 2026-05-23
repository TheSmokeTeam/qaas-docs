---
id: processors.available.datasourceresponseprocessor.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, DataSourceResponseProcessor, configuration, reference]
summary: "Field-by-field reference for DataSourceResponseProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json -->

# DataSourceResponseProcessor Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.SelectionMode` | `one of [First / Last / ByIndex]` | &#10004 |  | Selection mode used to pick a generated item from the resolved data source |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.ContentType` | `string or null` | &#10006 |  | Optional response Content-Type header |
| `ProcessorConfiguration.DataSourceName` | `string or null` | &#10006 |  | Optional data source name. When omitted, the first data source is used. |
| `ProcessorConfiguration.FallbackBody` | `string or null` | &#10006 |  | Fallback body to return when the data source cannot be resolved or selected |
| `ProcessorConfiguration.Index` | `integer or string` | &#10006 |  | Zero-based item index used when SelectionMode is ByIndex |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | &#10006 |  | Additional response headers |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
