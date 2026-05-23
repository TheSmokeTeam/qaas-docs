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

# TextTransformProcessor Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.ContentType` | `string` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.Prefix` | `string` | &#10006 |  | Text to prepend to the transformed payload |
| `ProcessorConfiguration.ReplacementText` | `string or null` | &#10006 |  | Replacement text for SearchText. Null removes the matched text. |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | &#10006 |  | Additional response headers |
| `ProcessorConfiguration.SearchText` | `string or null` | &#10006 |  | Optional text to search for in the incoming payload |
| `ProcessorConfiguration.Suffix` | `string` | &#10006 |  | Text to append to the transformed payload |
| `ProcessorConfiguration.TrimWhitespace` | `string or true/false` | &#10006 |  | Trim leading and trailing whitespace before applying prefix, suffix, and replacement |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
