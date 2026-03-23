# StaticResponseProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `Object | String` | &#10006 |  |  |
| `ProcessorConfiguration.ContentType` | `String` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.StatusCode` | `Integer | String` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.Body` | `Null | String` | &#10006 |  | Response body to return as UTF-8 text |
| `ProcessorConfiguration.ResponseHeaders` | `Null | Object | String` | &#10006 |  | Additional response headers |
