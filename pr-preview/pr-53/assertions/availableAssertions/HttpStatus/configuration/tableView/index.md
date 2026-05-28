# HttpStatus Configurations Table View

> TL;DR: Field-by-field reference for HttpStatus AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json.

| Property Path                          | Type                | Required | Default | Description                                                                                                                                                             |
| -------------------------------------- | ------------------- | -------- | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `AssertionConfiguration`               | `object or string`  | ✖        |         | Checks that all configured output's http status code is equal to a certain number. `DataSources`: Not used. `Session Support`: Only supports a single session assertion |
| `AssertionConfiguration.StatusCode`    | `integer or string` | ✔        |         | The http status code all configured outputs should have                                                                                                                 |
| `AssertionConfiguration.OutputNames`   | `list or string`    | ✔        |         | The names of the outputs to check the status code of                                                                                                                    |
| `AssertionConfiguration.OutputNames[]` | `string`            | ✖        |         |                                                                                                                                                                         |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
