# RequestEchoProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `Object | String` | &#10006 |  |  |
| `ProcessorConfiguration.ContentType` | `String` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.StatusCode` | `Integer | String` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.IncludePathParameters` | `Boolean | String` | &#10006 |  | Include request path parameters in the echoed JSON response |
| `ProcessorConfiguration.IncludeRequestHeaders` | `Boolean | String` | &#10006 |  | Include request headers in the echoed JSON response |
| `ProcessorConfiguration.IncludeUri` | `Boolean | String` | &#10006 |  | Include request Uri in the echoed JSON response |
| `ProcessorConfiguration.ResponseHeaders` | `Null | Object | String` | &#10006 |  | Additional response headers |
