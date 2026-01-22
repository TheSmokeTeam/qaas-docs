# FromDataLake Table View

| Property Path                            | Type   | Required   | Default                 | Description                                                                                    |
|:-----------------------------------------|:-------|:-----------|:------------------------|:-----------------------------------------------------------------------------------------------|
| `GeneratorConfiguration.ColumnsToIgnore` | array  | &#10006    | []                      | The columns to ignore in the query results, if no columns are given doesn't ignore any columns |
| `GeneratorConfiguration.TrinoServerUri`  | string | &#10006    | REDA | The trino server to connnect to                                                                |
| `GeneratorConfiguration.ClientTag`       | string | &#10006    | REDA                  | The client tag to use for connection                                                           |
| `GeneratorConfiguration.Catalog`         | string | &#10006    | hive                    | The datalake catalog to query                                                                  |
| `GeneratorConfiguration.Username`        | string | &#10004    |                         | The username for connecting to the trino server                                                |
| `GeneratorConfiguration.Password`        | string | &#10004    |                         | The password for connecting to the trino server                                                |
| `GeneratorConfiguration.Query`           | string | &#10004    |                         | The query to execute against the datalake                                                      |
| `GeneratorConfiguration`                 | object | &#10004    |                         | Supports generating data from data lake. `DataSources`: Not used. `SessionData`: Not used.     |
