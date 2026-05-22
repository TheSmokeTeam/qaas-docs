---
id: processors.available.texttransformprocessor.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, TextTransformProcessor, configuration, reference]
summary: "Field-by-field reference for TextTransformProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json -->

# TextTransformProcessor — Configuration (table view)

Generated from `processors.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.ContentType` | `string` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.Prefix` | `string` | &#10006 |  | Text to prepend to the transformed payload |
| `ProcessorConfiguration.Suffix` | `string` | &#10006 |  | Text to append to the transformed payload |
| `ProcessorConfiguration.SearchText` | `null or string` | &#10006 |  | Optional text to search for in the incoming payload |
| `ProcessorConfiguration.ReplacementText` | `null or string` | &#10006 |  | Replacement text for SearchText. Null removes the matched text. |
| `ProcessorConfiguration.TrimWhitespace` | `boolean or string` | &#10006 |  | Trim leading and trailing whitespace before applying prefix, suffix, and replacement |
| `ProcessorConfiguration.ResponseHeaders` | `null or object or string` | &#10006 |  | Additional response headers |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
