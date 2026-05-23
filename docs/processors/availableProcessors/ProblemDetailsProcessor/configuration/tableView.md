---
id: processors.available.problemdetailsprocessor.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, ProblemDetailsProcessor, configuration, reference]
summary: "Field-by-field reference for ProblemDetailsProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json -->

# ProblemDetailsProcessor Configurations Table View

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
| `ProcessorConfiguration.Title` | `string` | &#10004 |  | Problem details title |
| `ProcessorConfiguration.Type` | `string` | &#10004 |  | Problem details type |
| `ProcessorConfiguration.Detail` | `string or null` | &#10006 |  | Problem details detail |
| `ProcessorConfiguration.Extensions` | `object or string or null` | &#10006 |  | Additional problem details extension fields |
| `ProcessorConfiguration.Instance` | `string or null` | &#10006 |  | Explicit problem details instance |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | &#10006 |  | Additional response headers |
| `ProcessorConfiguration.UseRequestUriAsInstance` | `string or true/false` | &#10006 |  | Use the request URI as the problem details instance when no explicit instance is configured |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
