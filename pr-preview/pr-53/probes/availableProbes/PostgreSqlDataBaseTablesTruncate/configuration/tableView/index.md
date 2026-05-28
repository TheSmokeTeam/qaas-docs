# PostgreSqlDataBaseTablesTruncate Configurations Table View

> TL;DR: Field-by-field reference for PostgreSqlDataBaseTablesTruncate ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path                              | Type                   | Required | Default | Description                                                                                                                        |
| ------------------------------------------ | ---------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                       | `object or string`     | ✖        |         |                                                                                                                                    |
| `ProbeConfiguration.ConnectionString`      | `string`               | ✔        |         | The connection string to the database                                                                                              |
| `ProbeConfiguration.CommandTimeoutSeconds` | `integer or string`    | ✖        | 30      | The wait time (in seconds) before terminating the attempt to execute the truncate command and generating an error                  |
| `ProbeConfiguration.UseGlobalDict`         | `string or true/false` | ✖        | False   | When true, missing SQL probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
| `ProbeConfiguration.TableNames`            | `list or string`       | ✔        |         | The names of all the tables to truncate, they will be truncated by the order they are given in this list                           |
| `ProbeConfiguration.TableNames[]`          | `string`               | ✖        |         |                                                                                                                                    |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
