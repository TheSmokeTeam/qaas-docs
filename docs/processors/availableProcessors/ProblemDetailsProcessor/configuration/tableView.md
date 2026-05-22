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

# ProblemDetailsProcessor — Configuration (table view)

Generated from `processors.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.Title` | `string` | &#10004 |  | Problem details title |
| `ProcessorConfiguration.Detail` | `null or string` | &#10006 |  | Problem details detail |
| `ProcessorConfiguration.Type` | `string` | &#10004 |  | Problem details type |
| `ProcessorConfiguration.Instance` | `null or string` | &#10006 |  | Explicit problem details instance |
| `ProcessorConfiguration.UseRequestUriAsInstance` | `boolean or string` | &#10006 |  | Use the request URI as the problem details instance when no explicit instance is configured |
| `ProcessorConfiguration.ContentType` | `string` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.Extensions` | `null or object or string` | &#10006 |  | Additional problem details extension fields |
| `ProcessorConfiguration.ResponseHeaders` | `null or object or string` | &#10006 |  | Additional response headers |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
