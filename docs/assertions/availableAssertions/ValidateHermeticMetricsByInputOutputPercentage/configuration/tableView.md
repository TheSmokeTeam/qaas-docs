# ValidateHermeticMetricsByInputOutputPercentage Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  | Checks for metrics' hermetics by comparing the hermetics' percentage based on the `metric hermetics formula` to the hermetics percentage based on the outputs' count to inputs' count percentage `DataSources`: Not used. `Session Support`: Supports multiple sessions assertion. CommunicationData objects with same names will be referenced both by InputNames or OutputNames |
| `AssertionConfiguration.InputMetricName` | `string` | &#10004 |  | The name of the input metric of the metric hemetrics formula |
| `AssertionConfiguration.MetricOutputSourceName` | `string` | &#10004 |  | The name of the output to take the metrics from |
| `AssertionConfiguration.OutputMetricName` | `string` | &#10004 |  | The name of the output metric of the metric hemetrics formula |
| `AssertionConfiguration.CombineMetricName` | `string or null` | &#10006 |  | The name of the combine metric of the metric hemetrics formula |
| `AssertionConfiguration.FilteredMetricName` | `string or null` | &#10006 |  | The name of the filtered metric of the metric hemetrics formula |
| `AssertionConfiguration.InputsAreOutputs` | `string or true/false` | &#10006 | False | Whether the given inputs in InputNames are actually another outputs list |
| `AssertionConfiguration.ProcessMetricName` | `string or null` | &#10006 |  | The name of the process metric of the metric hemetrics formula |
| `AssertionConfiguration.SplitMetricName` | `string or null` | &#10006 |  | The name of the split metric of the metric hemetrics formula |
| `AssertionConfiguration.Tolerance` | `number or string` | &#10006 | 0.01 | The tolerance of difference between metrics` hermetics percantage and outputs' count to inputs' count hermetics percentage |
| `AssertionConfiguration.InputNames` | `list or string` | &#10004 |  | The names of the inputs the sum of outputs should be a given percentage of the sum of |
| `AssertionConfiguration.InputNames[]` | `string` | &#10006 |  |  |
| `AssertionConfiguration.OutputNames` | `list or string` | &#10004 |  | The names of the outputs to sum the counts of  |
| `AssertionConfiguration.OutputNames[]` | `string` | &#10006 |  |  |
