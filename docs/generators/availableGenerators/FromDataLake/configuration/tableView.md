# FromDataLake Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  | Supports generating data from data lake. `DataSources`: Not used. `SessionData`: Not used. |
| `GeneratorConfiguration.Password` | `string` | &#10004 |  | The password for connecting to the trino server |
| `GeneratorConfiguration.Query` | `string` | &#10004 |  | The query to execute against the datalake |
| `GeneratorConfiguration.Username` | `string` | &#10004 |  | The username for connecting to the trino server |
| `GeneratorConfiguration.Catalog` | `string` | &#10006 | hive | The datalake catalog to query |
| `GeneratorConfiguration.ClientTag` | `string` | &#10006 | qaas | The client tag to use for connection |
| `GeneratorConfiguration.TrinoServerUri` | `string` | &#10006 | http://localhost:8080 | The trino server to connnect to |
| `GeneratorConfiguration.ColumnsToIgnore` | `list or string` | &#10006 | [] | The columns to ignore in the query results, if no columns are given doesn't ignore any columns |
| `GeneratorConfiguration.ColumnsToIgnore[]` | `string` | &#10006 |  |  |
