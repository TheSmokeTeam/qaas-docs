<!-- generated hash:de491517b36e sources:mocker-family, DataSourceResponseProcessor, table-view -->

# DataSourceResponseProcessor Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProcessorConfiguration` | `object or string` | &#10006 |  |  |
| `ProcessorConfiguration.SelectionMode` | `one of [First / Last / ByIndex]` | &#10004 |  | Selection mode used to pick a generated item from the resolved data source |
| `ProcessorConfiguration.StatusCode` | `integer or string` | &#10004 |  | Response Status Code |
| `ProcessorConfiguration.ContentType` | `string or null` | &#10006 |  | Optional response Content-Type header |
| `ProcessorConfiguration.DataSourceName` | `string or null` | &#10006 |  | Optional data source name. When omitted, the first data source is used. |
| `ProcessorConfiguration.FallbackBody` | `string or null` | &#10006 |  | Fallback body to return when the data source cannot be resolved or selected |
| `ProcessorConfiguration.Index` | `integer or string` | &#10006 |  | Zero-based item index used when SelectionMode is ByIndex |
| `ProcessorConfiguration.ResponseHeaders` | `object or string or null` | &#10006 |  | Additional response headers |
