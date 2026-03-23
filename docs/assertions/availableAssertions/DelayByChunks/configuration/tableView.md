# DelayByChunks Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `Object | String` | &#10006 |  | Delay checks the time interval between the inputs and outputs is not bigger than a configured number by subtracting the timestamp of input chunks of a configured size from a timestamp of output chunks of a configured size, The timestamp of the chunks is calculated differently depending on the configuration. takes the chunks in ascending order (which will be the send/arrival order) from the configured input/output. `Warning`: This delay test only works on synchronous applications! `DataSources`: Not used. `Session Support`: Only supports a single session assertion |
| `AssertionConfiguration.MaximumDelayMs` | `Integer | String` | &#10004 |  | maximum delay in milliseconds allowed for a chunk's delay for the chunk to be considered as arrived on time |
| `AssertionConfiguration.InputsAreOutputs` | `Boolean | String` | &#10006 | False | Whether the given input in Input is actually another outputs list |
| `AssertionConfiguration.MaximumNegativeDelayBufferMs` | `Integer | Null | String` | &#10006 | 100 | maximum negative delay buffer of a chunk's delay in milliseconds, if value falls within the buffer it is still compared to maximum allowed delay |
| `AssertionConfiguration.Input` | `Object | String` | &#10004 |  | The information about the input required for the assertion |
| `AssertionConfiguration.Input.ChunkSize` | `Integer | String` | &#10004 |  | The end point items chunk size |
| `AssertionConfiguration.Input.Name` | `String` | &#10004 |  | Name of the end point the chunk belongs to |
| `AssertionConfiguration.Input.ChunkTimeOption` | `enum [Average / First / Last]` | &#10006 |  | How to calculate the time of a chunk. Options: [ `Average` - Calculates the chunks time by taking the average of all times in the chunk / `First` - Calculates the chunks time by taking the time of the first item in the chunk / `Last` - Calculates the chunks time by taking the time of the last item in the chunk ] |
| `AssertionConfiguration.Output` | `Object | String` | &#10004 |  | The information about the output required for the assertion  |
| `AssertionConfiguration.Output.ChunkSize` | `Integer | String` | &#10004 |  | The end point items chunk size |
| `AssertionConfiguration.Output.Name` | `String` | &#10004 |  | Name of the end point the chunk belongs to |
| `AssertionConfiguration.Output.ChunkTimeOption` | `enum [Average / First / Last]` | &#10006 |  | How to calculate the time of a chunk. Options: [ `Average` - Calculates the chunks time by taking the average of all times in the chunk / `First` - Calculates the chunks time by taking the time of the first item in the chunk / `Last` - Calculates the chunks time by taking the time of the last item in the chunk ] |
