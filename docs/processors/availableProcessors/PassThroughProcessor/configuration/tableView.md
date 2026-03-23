# PassThroughProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `Object | String` | &#10006 |  |  |
| `ProcessorConfiguration.StatusCode` | `Integer | String` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.ContentType` | `Null | String` | &#10006 |  | Optional response Content-Type header |
| `ProcessorConfiguration.PreserveMetaData` | `Boolean | String` | &#10006 |  | Preserve request metadata and only replace the HTTP response metadata |
| `ProcessorConfiguration.ResponseHeaders` | `Null | Object | String` | &#10006 |  | Additional response headers |
