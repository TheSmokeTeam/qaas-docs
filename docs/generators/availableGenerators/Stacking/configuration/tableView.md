# Stacking Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `Object | String` | &#10006 |  | Supports generating data from multiple DataSources by configured items per generator. `DataSources`: Used. `SessionData`: Passed to used DataSources. |
| `GeneratorConfiguration.Count` | `Integer | Null | String` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |
| `GeneratorConfiguration.LoopFinishedGenerators` | `Boolean | String` | &#10006 | False | When true, generators will restart when there are no more items in them |
| `GeneratorConfiguration.ItemsPerGenerator` | `Array | String` | &#10004 |  | The number of items to generate out of the given data sources in turn |
| `GeneratorConfiguration.ItemsPerGenerator[]` | `Integer | String` | &#10006 |  |  |
