# JsonEnvelopeProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `Object | String` | &#10006 |  |  |
| `ProcessorConfiguration.BodyPropertyName` | `String` | &#10004 |  | Name of the JSON property that will contain the request body |
| `ProcessorConfiguration.ContentType` | `String` | &#10004 |  | Response Content-Type header |
| `ProcessorConfiguration.StatusCode` | `Integer | String` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.IncludeBodyType` | `Boolean | String` | &#10006 |  | Include the CLR body type as bodyType in the response |
| `ProcessorConfiguration.IncludePathParameters` | `Boolean | String` | &#10006 |  | Include path parameters as pathParameters in the response |
| `ProcessorConfiguration.IncludeRequestHeaders` | `Boolean | String` | &#10006 |  | Include request headers as requestHeaders in the response |
| `ProcessorConfiguration.IncludeUri` | `Boolean | String` | &#10006 |  | Include the request URI as uri in the response |
| `ProcessorConfiguration.ResponseHeaders` | `Null | Object | String` | &#10006 |  | Additional response headers |
