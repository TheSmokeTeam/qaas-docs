# DelayByAverage Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `Object | String` | &#10006 |  | Delay checks the time interval between the inputs and outputs is not bigger than a configured number by subtracting the average timestamp of all inputs from the average timestamp of all the outputs. `DataSources`: Not used. `Session Support`: Only supports a single session assertion |
| `AssertionConfiguration.InputName` | `String` | &#10004 |  | Name of the input end point to check the inputs of |
| `AssertionConfiguration.MaximumDelayMs` | `Integer | String` | &#10004 |  | maximum delay in milliseconds allowed for average delay for assertion to pass |
| `AssertionConfiguration.OutputName` | `String` | &#10004 |  | Name of the output end point to check the outputs of |
| `AssertionConfiguration.InputsAreOutputs` | `Boolean | String` | &#10006 | False | Whether the given input in InputName is actually another outputs list |
| `AssertionConfiguration.MaximumNegativeDelayBufferMs` | `Integer | Null | String` | &#10006 | 100 | maximum negative delay buffer of average delay in milliseconds, if value falls within the buffer it is still compared to maximum allowed delay |
