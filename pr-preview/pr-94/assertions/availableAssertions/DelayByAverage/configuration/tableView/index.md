# DelayByAverage Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                                         | Type                        | Required | Default | Description                                                                                                                                                                                                                                                                                 |
| ----------------------------------------------------- | --------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AssertionConfiguration`                              | `object or string`          | ✖        |         | Delay checks the time interval between the inputs and outputs is not bigger than a configured number by subtracting the average timestamp of all inputs from the average timestamp of all the outputs. `DataSources`: Not used. `Session Support`: Only supports a single session assertion |
| `AssertionConfiguration.InputName`                    | `string`                    | ✔        |         | Name of the input end point to check the inputs of                                                                                                                                                                                                                                          |
| `AssertionConfiguration.MaximumDelayMs`               | `integer or string`         | ✔        |         | maximum delay in milliseconds allowed for average delay for assertion to pass                                                                                                                                                                                                               |
| `AssertionConfiguration.OutputName`                   | `string`                    | ✔        |         | Name of the output end point to check the outputs of                                                                                                                                                                                                                                        |
| `AssertionConfiguration.InputsAreOutputs`             | `string or true/false`      | ✖        | `False` | Whether the given input in InputName is actually another outputs list                                                                                                                                                                                                                       |
| `AssertionConfiguration.MaximumNegativeDelayBufferMs` | `integer or string or null` | ✖        | `100`   | maximum negative delay buffer of average delay in milliseconds, if value falls within the buffer it is still compared to maximum allowed delay                                                                                                                                              |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/DelayByAverage/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/DelayByAverage/overview/index.md)
