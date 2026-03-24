# StaticResponseProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.ContentType` | `string` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.Body` | `string or null` | &#10006 |  | Response body to return as UTF-8 text |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | &#10006 |  | Additional response headers |
