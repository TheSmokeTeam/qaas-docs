# ValidateHermeticMetricsByInputOutputPercentage Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `Object | String` | &#10006 |  | Checks for metrics' hermetics by comparing the hermetics' percentage based on the `metric hermetics formula` to the hermetics percentage based on the outputs' count to inputs' count percentage `DataSources`: Not used. `Session Support`: Supports multiple sessions assertion. CommunicationData objects with same names will be referenced both by InputNames or OutputNames |
| `AssertionConfiguration.InputMetricName` | `String` | &#10004 |  | The name of the input metric of the metric hemetrics formula |
| `AssertionConfiguration.MetricOutputSourceName` | `String` | &#10004 |  | The name of the output to take the metrics from |
| `AssertionConfiguration.OutputMetricName` | `String` | &#10004 |  | The name of the output metric of the metric hemetrics formula |
| `AssertionConfiguration.CombineMetricName` | `Null | String` | &#10006 |  | The name of the combine metric of the metric hemetrics formula |
| `AssertionConfiguration.FilteredMetricName` | `Null | String` | &#10006 |  | The name of the filtered metric of the metric hemetrics formula |
| `AssertionConfiguration.InputsAreOutputs` | `Boolean | String` | &#10006 | False | Whether the given inputs in InputNames are actually another outputs list |
| `AssertionConfiguration.ProcessMetricName` | `Null | String` | &#10006 |  | The name of the process metric of the metric hemetrics formula |
| `AssertionConfiguration.SplitMetricName` | `Null | String` | &#10006 |  | The name of the split metric of the metric hemetrics formula |
| `AssertionConfiguration.Tolerance` | `Number | String` | &#10006 | 0.01 | The tolerance of difference between metrics` hermetics percantage and outputs' count to inputs' count hermetics percentage |
| `AssertionConfiguration.InputNames` | `Array | String` | &#10004 |  | The names of the inputs the sum of outputs should be a given percentage of the sum of |
| `AssertionConfiguration.InputNames[]` | `String` | &#10006 |  |  |
| `AssertionConfiguration.OutputNames` | `Array | String` | &#10004 |  | The names of the outputs to sum the counts of  |
| `AssertionConfiguration.OutputNames[]` | `String` | &#10006 |  |  |
