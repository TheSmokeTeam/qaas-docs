# PostgreSqlDataBaseTablesTruncate Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                              | Type                   | Required | Default | Description                                                                                                                        |
| ------------------------------------------ | ---------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                       | `object or string`     | ✖        |         |                                                                                                                                    |
| `ProbeConfiguration.ConnectionString`      | `string`               | ✔        |         | The connection string to the database                                                                                              |
| `ProbeConfiguration.CommandTimeoutSeconds` | `integer or string`    | ✖        | `30`    | The wait time (in seconds) before terminating the attempt to execute the truncate command and generating an error                  |
| `ProbeConfiguration.UseGlobalDict`         | `string or true/false` | ✖        | `False` | When true, missing SQL probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
| `ProbeConfiguration.TableNames`            | `list or string`       | ✔        |         | The names of all the tables to truncate, they will be truncated by the order they are given in this list                           |
| `ProbeConfiguration.TableNames[]`          | `string`               | ✖        |         |                                                                                                                                    |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/PostgreSqlDataBaseTablesTruncate/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/PostgreSqlDataBaseTablesTruncate/overview/index.md)
