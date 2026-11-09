# FromDataLake Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                              | Type               | Required | Default                 | Description                                                                                    |
| ------------------------------------------ | ------------------ | -------- | ----------------------- | ---------------------------------------------------------------------------------------------- |
| `GeneratorConfiguration`                   | `object or string` | ✖        |                         | Supports generating data from data lake. `DataSources`: Not used. `SessionData`: Not used.     |
| `GeneratorConfiguration.Password`          | `string`           | ✔        |                         | The password for connecting to the trino server                                                |
| `GeneratorConfiguration.Query`             | `string`           | ✔        |                         | The query to execute against the datalake                                                      |
| `GeneratorConfiguration.Username`          | `string`           | ✔        |                         | The username for connecting to the trino server                                                |
| `GeneratorConfiguration.Catalog`           | `string`           | ✖        | `hive`                  | The datalake catalog to query                                                                  |
| `GeneratorConfiguration.ClientTag`         | `string`           | ✖        | `qaas`                  | The client tag to use for connection                                                           |
| `GeneratorConfiguration.TrinoServerUri`    | `string`           | ✖        | `http://localhost:8080` | The trino server to connnect to                                                                |
| `GeneratorConfiguration.ColumnsToIgnore`   | `list or string`   | ✖        | `[]`                    | The columns to ignore in the query results, if no columns are given doesn't ignore any columns |
| `GeneratorConfiguration.ColumnsToIgnore[]` | `string`           | ✖        |                         |                                                                                                |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/FromDataLake/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/FromDataLake/overview/index.md)
