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

# ProblemDetailsProcessor Configurations Table View

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
