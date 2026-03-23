<!-- generated hash:c603a816ccf8 sources:mocker-family, RequestEchoProcessor, table-view -->

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
