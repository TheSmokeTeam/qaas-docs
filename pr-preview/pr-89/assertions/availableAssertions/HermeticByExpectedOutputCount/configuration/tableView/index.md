# HermeticByExpectedOutputCount Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                          | Type                | Required | Default | Description                                                                                                                                                                                                                                                                                                          |
| -------------------------------------- | ------------------- | -------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AssertionConfiguration`               | `object or string`  | ✖        |         | Checks for IO hermetics by comparing the count of multiple outputs in a given session with certain names to a given expected count. `DataSources`: Not used. `Session Support`: Supports multiple sessions assertion. CommunicationData objects with same names will be referenced both by InputNames or OutputNames |
| `AssertionConfiguration.ExpectedCount` | `integer or string` | ✔        |         | The expected count of the items in the given output name in the given session                                                                                                                                                                                                                                        |
| `AssertionConfiguration.OutputNames`   | `list or string`    | ✔        |         | The names of the outputs to sum the counts of and then compare them to the expected count field in the given session                                                                                                                                                                                                 |
| `AssertionConfiguration.OutputNames[]` | `string`            | ✖        |         |                                                                                                                                                                                                                                                                                                                      |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/HermeticByExpectedOutputCount/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/HermeticByExpectedOutputCount/overview/index.md)
