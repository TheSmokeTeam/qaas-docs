# Stacking Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  | Supports generating data from multiple DataSources by configured items per generator. `DataSources`: Used. `SessionData`: Passed to used DataSources. |
| `GeneratorConfiguration.Count` | `integer or string or null` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |
| `GeneratorConfiguration.LoopFinishedGenerators` | `string or true/false` | &#10006 | False | When true, generators will restart when there are no more items in them |
| `GeneratorConfiguration.ItemsPerGenerator` | `list or string` | &#10004 |  | The number of items to generate out of the given data sources in turn |
| `GeneratorConfiguration.ItemsPerGenerator[]` | `integer or string` | &#10006 |  |  |
