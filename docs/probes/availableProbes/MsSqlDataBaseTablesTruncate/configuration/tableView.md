# MsSqlDataBaseTablesTruncate Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.ConnectionString` | `String` | &#10004 |  | The connection string to the database |
| `ProbeConfiguration.CommandTimeoutSeconds` | `Integer | String` | &#10006 | 30 | The wait time (in seconds) before terminating the attempt to execute the truncate command and generating an error |
| `ProbeConfiguration.TableNames` | `Array | String` | &#10004 |  | The names of all the tables to truncate, they will be truncated by the order they are given in this list |
| `ProbeConfiguration.TableNames[]` | `String` | &#10006 |  |  |
