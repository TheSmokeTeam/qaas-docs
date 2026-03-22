# Controller Configurations Table View

| Property Path | Type | Required | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| `Controller` | `object` | &#10006; |  | Optional controller configuration |
| `Controller.ServerName` | `string` | &#10006; |  | Logical server name used by controller clients |
| `Controller.Redis` | `object` | &#10006; |  | Redis connection settings |
| `Controller.Redis.Host` | `string` | &#10006; |  | Redis host and port, for example `redis:6379` |
| `Controller.Redis.Username` | `string` | &#10006; |  | Redis username |
| `Controller.Redis.Password` | `string` | &#10006; |  | Redis password |
| `Controller.Redis.AbortOnConnectFail` | `boolean` | &#10006; | `true` | Stop connection creation when no Redis server is available |
| `Controller.Redis.ConnectRetry` | `integer` | &#10006; | `3` | Number of connection retries |
| `Controller.Redis.ClientName` | `string` | &#10006; |  | Client name registered in Redis |
| `Controller.Redis.AsyncTimeout` | `integer` | &#10006; | `5000` | Async operation timeout in milliseconds |
| `Controller.Redis.Ssl` | `boolean` | &#10006; | `false` | Enable TLS for Redis |
| `Controller.Redis.SslHost` | `string` | &#10006; |  | Expected TLS host name |
| `Controller.Redis.KeepAlive` | `integer` | &#10006; | `60` | Keep-alive interval in seconds |
| `Controller.Redis.RedisDataBase` | `integer` | &#10006; | `0` | Redis database index |
