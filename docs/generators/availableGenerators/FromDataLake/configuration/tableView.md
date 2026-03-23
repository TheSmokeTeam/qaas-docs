# FromDataLake Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `Object | String` | &#10006 |  | Supports generating data from data lake. `DataSources`: Not used. `SessionData`: Not used. |
| `GeneratorConfiguration.Password` | `String` | &#10004 |  | The password for connecting to the trino server |
| `GeneratorConfiguration.Query` | `String` | &#10004 |  | The query to execute against the datalake |
| `GeneratorConfiguration.Username` | `String` | &#10004 |  | The username for connecting to the trino server |
| `GeneratorConfiguration.Catalog` | `String` | &#10006 | hive | The datalake catalog to query |
| `GeneratorConfiguration.ClientTag` | `String` | &#10006 | qaas | The client tag to use for connection |
| `GeneratorConfiguration.TrinoServerUri` | `String` | &#10006 | http://localhost:8080 | The trino server to connnect to |
| `GeneratorConfiguration.ColumnsToIgnore` | `Array | String` | &#10006 |  | The columns to ignore in the query results, if no columns are given doesn't ignore any columns |
| `GeneratorConfiguration.ColumnsToIgnore[]` | `String` | &#10006 |  |  |
