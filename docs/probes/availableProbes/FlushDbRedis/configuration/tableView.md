# FlushDbRedis Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.AbortOnConnectFail` | `string or true/false` | &#10006 | True | If true, connect will not create connection while no servers are available |
| `ProbeConfiguration.AsyncTimeout` | `integer or string` | &#10006 | 5000 | Time(ms) to allow for asynchronous operations |
| `ProbeConfiguration.ClientName` | `string or null` | &#10006 |  | Identification for the connection within redis |
| `ProbeConfiguration.ConnectRetry` | `integer or string` | &#10006 | 3 | The number of times to repeat connect attempts during initial connect |
| `ProbeConfiguration.KeepAlive` | `integer or string` | &#10006 | 60 | Time (seconds) at which to send a message to help keep alive |
| `ProbeConfiguration.Password` | `string or null` | &#10006 |  | Password for the redis server |
| `ProbeConfiguration.RedisDataBase` | `integer or string` | &#10006 | 0 | Redis database to perform the probe on |
| `ProbeConfiguration.Ssl` | `string or true/false` | &#10006 | False | Specifies that SSL encryption should be used |
| `ProbeConfiguration.SslHost` | `string or null` | &#10006 |  | Enforces a preticular SSL host identity on the server's certificate |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing Redis probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
| `ProbeConfiguration.Username` | `string or null` | &#10006 |  | User for the redis server |
| `ProbeConfiguration.HostNames` | `list or string` | &#10004 |  | List of the redis hostnames (each hostname should contain the port too for example: - 'host1:8080' |
| `ProbeConfiguration.HostNames[]` | `string` | &#10006 |  |  |
