---
id: processors.available.jsonenvelopeprocessor.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, JsonEnvelopeProcessor, configuration, reference]
summary: "Field-by-field reference for JsonEnvelopeProcessor ProcessorConfiguration keys, types, defaults and descriptions, generated from processors.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/processors.schema.json -->

# JsonEnvelopeProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.BodyPropertyName` | `string` | &#10004 |  | Name of the JSON property that will contain the request body |
| `ProcessorConfiguration.ContentType` | `string` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.IncludeBodyType` | `string or true/false` | &#10006 |  | Include the CLR body type as bodyType in the response |
| `ProcessorConfiguration.IncludePathParameters` | `string or true/false` | &#10006 |  | Include path parameters as pathParameters in the response |
| `ProcessorConfiguration.IncludeRequestHeaders` | `string or true/false` | &#10006 |  | Include request headers as requestHeaders in the response |
| `ProcessorConfiguration.IncludeUri` | `string or true/false` | &#10006 |  | Include the request URI as uri in the response |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | &#10006 |  | Additional response headers |
