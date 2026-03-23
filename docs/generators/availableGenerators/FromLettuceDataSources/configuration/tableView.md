# FromLettuceDataSources Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `Object | String` | &#10006 |  | Supports generating data from multiple DataSources that contain lettuce files. `DataSources`: Used, must all contain Lettuce formatted data deserialized into Json (JsonNode). `SessionData`: Passed to used DataSources. |
| `GeneratorConfiguration.Count` | `Integer | Null | String` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |
