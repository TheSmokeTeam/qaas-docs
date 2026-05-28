# FromDataLake Configurations Table View

> TL;DR: Field-by-field reference for FromDataLake GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json.

| Property Path                              | Type               | Required | Default                 | Description                                                                                    |
| ------------------------------------------ | ------------------ | -------- | ----------------------- | ---------------------------------------------------------------------------------------------- |
| `GeneratorConfiguration`                   | `object or string` | ✖        |                         | Supports generating data from data lake. `DataSources`: Not used. `SessionData`: Not used.     |
| `GeneratorConfiguration.Password`          | `string`           | ✔        |                         | The password for connecting to the trino server                                                |
| `GeneratorConfiguration.Query`             | `string`           | ✔        |                         | The query to execute against the datalake                                                      |
| `GeneratorConfiguration.Username`          | `string`           | ✔        |                         | The username for connecting to the trino server                                                |
| `GeneratorConfiguration.Catalog`           | `string`           | ✖        | hive                    | The datalake catalog to query                                                                  |
| `GeneratorConfiguration.ClientTag`         | `string`           | ✖        | qaas                    | The client tag to use for connection                                                           |
| `GeneratorConfiguration.TrinoServerUri`    | `string`           | ✖        | `http://localhost:8080` | The trino server to connnect to                                                                |
| `GeneratorConfiguration.ColumnsToIgnore`   | `list or string`   | ✖        | []                      | The columns to ignore in the query results, if no columns are given doesn't ignore any columns |
| `GeneratorConfiguration.ColumnsToIgnore[]` | `string`           | ✖        |                         |                                                                                                |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
