---
id: processors.available.passthroughprocessor.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, PassThroughProcessor, configuration, reference]
summary: "Field-by-field reference for PassThroughProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json -->

# PassThroughProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.ContentType` | `string or null` | &#10006 |  | Optional response Content-Type header |
| `ProcessorConfiguration.PreserveMetaData` | `string or true/false` | &#10006 |  | Preserve request metadata and only replace the HTTP response metadata |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | &#10006 |  | Additional response headers |
