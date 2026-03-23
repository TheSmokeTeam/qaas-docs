<!-- generated hash:06147d8bef55 sources:runner-family, PostgreSqlDataBaseTablesTruncate, table-view -->

# PostgreSqlDataBaseTablesTruncate Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.ConnectionString` | `string` | &#10004 |  | The connection string to the database |
| `ProbeConfiguration.CommandTimeoutSeconds` | `integer or string` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute the truncate command and generating an error |
| `ProbeConfiguration.TableNames` | `list or string` | &#10004 |  | The names of all the tables to truncate, they will be truncated by the order they are given in this list |
| `ProbeConfiguration.TableNames[]` | `string` | &#10006 |  |  |
