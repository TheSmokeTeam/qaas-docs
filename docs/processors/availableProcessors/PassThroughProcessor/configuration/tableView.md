<!-- generated hash:3138ea02143a sources:mocker-family, PassThroughProcessor, table-view -->

# PassThroughProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.ContentType` | `string or null` | &#10006 |  | Optional response Content-Type header |
| `ProcessorConfiguration.PreserveMetaData` | `string or true/false` | &#10006 |  | Preserve request metadata and only replace the HTTP response metadata |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | &#10006 |  | Additional response headers |
