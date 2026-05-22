---
id: processors.available.requestechoprocessor.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, RequestEchoProcessor, configuration, reference]
summary: "Field-by-field reference for RequestEchoProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json -->

# RequestEchoProcessor — Configuration (table view)

Generated from `processors.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.ContentType` | `string` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.IncludeRequestHeaders` | `boolean or string` | &#10006 |  | Include request headers in the echoed JSON response |
| `ProcessorConfiguration.IncludePathParameters` | `boolean or string` | &#10006 |  | Include request path parameters in the echoed JSON response |
| `ProcessorConfiguration.IncludeUri` | `boolean or string` | &#10006 |  | Include request Uri in the echoed JSON response |
| `ProcessorConfiguration.ResponseHeaders` | `null or object or string` | &#10006 |  | Additional response headers |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
