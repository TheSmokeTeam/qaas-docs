# HermeticByExpectedOutputCount Configurations Table View

> TL;DR: Field-by-field reference for HermeticByExpectedOutputCount AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json.

| Property Path                          | Type                | Required | Default | Description                                                                                                                                                                                                                                                                                                          |
| -------------------------------------- | ------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AssertionConfiguration`               | `object or string`  | ✖        |         | Checks for IO hermetics by comparing the count of multiple outputs in a given session with certain names to a given expected count. `DataSources`: Not used. `Session Support`: Supports multiple sessions assertion. CommunicationData objects with same names will be referenced both by InputNames or OutputNames |
| `AssertionConfiguration.ExpectedCount` | `integer or string` | ✔        |         | The expected count of the items in the given output name in the given session                                                                                                                                                                                                                                        |
| `AssertionConfiguration.OutputNames`   | `list or string`    | ✔        |         | The names of the outputs to sum the counts of and then compare them to the expected count field in the given session                                                                                                                                                                                                 |
| `AssertionConfiguration.OutputNames[]` | `string`            | ✖        |         |                                                                                                                                                                                                                                                                                                                      |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
