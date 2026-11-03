# HttpStatus Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                          | Type                | Required | Default | Description                                                                                                                                                             |
| -------------------------------------- | ------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AssertionConfiguration`               | `object or string`  | ✖        |         | Checks that all configured output's http status code is equal to a certain number. `DataSources`: Not used. `Session Support`: Only supports a single session assertion |
| `AssertionConfiguration.StatusCode`    | `integer or string` | ✔        |         | The http status code all configured outputs should have                                                                                                                 |
| `AssertionConfiguration.OutputNames`   | `list or string`    | ✔        |         | The names of the outputs to check the status code of                                                                                                                    |
| `AssertionConfiguration.OutputNames[]` | `string`            | ✖        |         |                                                                                                                                                                         |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/HttpStatus/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/HttpStatus/overview/index.md)
