<!-- generated hash:5c66be19fd2d sources:mocker-family, Controller, table-view -->

# Controller Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Controller` | `object or string` | &#10006 |  | The server mocker controller configuration |
| `Controller.ServerName` | `string or null` | &#10006 |  | The Server name |
| `Controller.Redis` | `object or string` | &#10006 |  | The Server Controller Redis API |
| `Controller.Redis.AbortOnConnectFail` | `string or true/false` | &#10006 | True | If true, connect will not create connection while no servers are available |
| `Controller.Redis.AsyncTimeout` | `integer or string` | &#10006 | 5000 | Time(ms) to allow for asynchronous operations |
| `Controller.Redis.ClientName` | `string or null` | &#10006 |  | Identification for the connection within redis |
| `Controller.Redis.ConnectRetry` | `integer or string` | &#10006 | 3 | The number of times to repeat connect attempts during initial connect |
| `Controller.Redis.Host` | `string` | &#10006 |  | Redis hostname (should contain the port too for example: - 'host1:8080') |
| `Controller.Redis.KeepAlive` | `integer or string` | &#10006 | 60 | Time (seconds) at which to send a message to help keep alive |
| `Controller.Redis.Password` | `string or null` | &#10006 |  | Password for the redis server |
| `Controller.Redis.RedisDataBase` | `integer or string` | &#10006 | 0 | Redis database to use |
| `Controller.Redis.Ssl` | `string or true/false` | &#10006 | False | Specifies that SSL encryption should be used |
| `Controller.Redis.SslHost` | `string or null` | &#10006 |  | Enforces a preticular SSL host identity on the server's certificate |
| `Controller.Redis.Username` | `string or null` | &#10006 |  | User for the redis server |
