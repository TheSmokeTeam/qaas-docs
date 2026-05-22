---
id: processors.availableprocessors.requestechoprocessor.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, availableprocessors, requestechoprocessor, configuration, tableview]
summary: "RequestEchoProcessor Configurations Table View"
---
# RequestEchoProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.ContentType` | `string` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.IncludePathParameters` | `string or true/false` | &#10006 |  | Include request path parameters in the echoed JSON response |
| `ProcessorConfiguration.IncludeRequestHeaders` | `string or true/false` | &#10006 |  | Include request headers in the echoed JSON response |
| `ProcessorConfiguration.IncludeUri` | `string or true/false` | &#10006 |  | Include request Uri in the echoed JSON response |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | &#10006 |  | Additional response headers |
