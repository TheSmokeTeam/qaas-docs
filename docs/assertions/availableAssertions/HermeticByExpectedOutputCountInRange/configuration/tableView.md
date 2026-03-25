# HermeticByExpectedOutputCountInRange Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  | Checks for IO hermetics by comparing the count of multiple outputs in a given session with certain names to be between a given expected maximum limit and minimum limit. `DataSources`: Not used. `Session Support`: Supports multiple sessions assertion. CommunicationData objects with same names will be referenced both by InputNames or OutputNames |
| `AssertionConfiguration.ExpectedMaximumCount` | `integer or string` | &#10004 |  | The expected maximum count of the items in the given output names in the given session |
| `AssertionConfiguration.ExpectedMinimumCount` | `integer or string` | &#10004 |  | The expected minimum count of the items in the given output names in the given session |
| `AssertionConfiguration.OutputNames` | `list or string` | &#10004 |  | The names of the outputs to sum the counts of and then compare them to the expected count field in the given session |
| `AssertionConfiguration.OutputNames[]` | `string` | &#10006 |  |  |
