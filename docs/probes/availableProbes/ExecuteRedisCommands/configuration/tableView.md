# ExecuteRedisCommands Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.AbortOnConnectFail` | `Boolean | String` | &#10006 | True | If true, connect will not create connection while no servers are available |
| `ProbeConfiguration.AsyncTimeout` | `Integer | String` | &#10006 | 5000 | Time(ms) to allow for asynchronous operations |
| `ProbeConfiguration.ClientName` | `Null | String` | &#10006 |  | Identification for the connection within redis |
| `ProbeConfiguration.ConnectRetry` | `Integer | String` | &#10006 | 3 | The number of times to repeat connect attempts during initial connect |
| `ProbeConfiguration.KeepAlive` | `Integer | String` | &#10006 | 60 | Time (seconds) at which to send a message to help keep alive |
| `ProbeConfiguration.Password` | `Null | String` | &#10006 |  | Password for the redis server |
| `ProbeConfiguration.RedisDataBase` | `Integer | String` | &#10006 | 0 | Redis database to perform the probe on |
| `ProbeConfiguration.Ssl` | `Boolean | String` | &#10006 | False | Specifies that SSL encryption should be used |
| `ProbeConfiguration.SslHost` | `Null | String` | &#10006 |  | Enforces a preticular SSL host identity on the server's certificate |
| `ProbeConfiguration.Username` | `Null | String` | &#10006 |  | User for the redis server |
| `ProbeConfiguration.Commands` | `Array | String` | &#10004 |  | The redis commands to execute |
| `ProbeConfiguration.Commands[]` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.Commands[].Command` | `String` | &#10004 |  | The redis command to execute |
| `ProbeConfiguration.Commands[].Arguments` | `Array | Null | String` | &#10006 |  | Optional redis command arguments |
| `ProbeConfiguration.Commands[].Arguments[]` | `String` | &#10006 |  |  |
| `ProbeConfiguration.HostNames` | `Array | String` | &#10004 |  | List of the redis hostnames (each hostname should contain the port too for example: - 'host1:8080' |
| `ProbeConfiguration.HostNames[]` | `String` | &#10006 |  |  |
