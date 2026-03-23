# DataSourceResponseProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `Object | String` | &#10006 |  |  |
| `ProcessorConfiguration.SelectionMode` | `enum [First / Last / ByIndex]` | &#10004 |  | Selection mode used to pick a generated item from the resolved data source |
| `ProcessorConfiguration.StatusCode` | `Integer | String` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.ContentType` | `Null | String` | &#10006 |  | Optional response Content-Type header |
| `ProcessorConfiguration.DataSourceName` | `Null | String` | &#10006 |  | Optional data source name. When omitted, the first data source is used. |
| `ProcessorConfiguration.FallbackBody` | `Null | String` | &#10006 |  | Fallback body to return when the data source cannot be resolved or selected |
| `ProcessorConfiguration.Index` | `Integer | String` | &#10006 |  | Zero-based item index used when SelectionMode is ByIndex |
| `ProcessorConfiguration.ResponseHeaders` | `Null | Object | String` | &#10006 |  | Additional response headers |
