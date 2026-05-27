---
id: processors.available.staticresponseprocessor.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, StaticResponseProcessor, configuration, reference]
summary: "Field-by-field reference for StaticResponseProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json -->

# StaticResponseProcessor Configurations Table View

> TL;DR: Field-by-field reference for StaticResponseProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.ContentType` | `string` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.Body` | `string or null` | &#10006 |  | Response body to return as UTF-8 text |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | &#10006 |  | Additional response headers |

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
