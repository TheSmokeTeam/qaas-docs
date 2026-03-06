# Controller Configurations Table View

| Property Path                         | Type      | Required   | Default   | Description                                                                |
|:--------------------------------------|:----------|:-----------|:----------|:---------------------------------------------------------------------------|
| `Controller`                          | `object`  | &#10006    |           | The server mocker controller configuration                                 |
| `Controller.ServerName`               | `string`  | &#10006    |           | The Server name                                                            |
| `Controller.Redis`                    | `object`  | &#10006    |           | The Server Controller Redis API                                            |
| `Controller.Redis.RedisDataBase`      | `integer` | &#10006    | 0         | Redis database to use                                                      |
| `Controller.Redis.KeepAlive`          | `integer` | &#10006    | 60        | Time (seconds) at which to send a message to help keep alive               |
| `Controller.Redis.SslHost`            | `string`  | &#10006    |           | Enforces a preticular SSL host identity on the server's certificate        |
| `Controller.Redis.Ssl`                | `boolean` | &#10006    | False     | Specifies that SSL encryption should be used                               |
| `Controller.Redis.AsyncTimeout`       | `integer` | &#10006    | 5000      | Time(ms) to allow for asynchronous operations                              |
| `Controller.Redis.ClientName`         | `string`  | &#10006    |           | Identification for the connection within redis                             |
| `Controller.Redis.ConnectRetry`       | `integer` | &#10006    | 3         | The number of times to repeat connect attempts during initial connect      |
| `Controller.Redis.AbortOnConnectFail` | `boolean` | &#10006    | True      | If true, connect will not create connection while no servers are available |
| `Controller.Redis.Password`           | `string`  | &#10006    |           | Password for the redis server                                              |
| `Controller.Redis.Username`           | `string`  | &#10006    |           | User for the redis server                                                  |
| `Controller.Redis.Host`               | `string`  | &#10006    |           | Redis hostname (should contain the port too for example: - 'host1:8080')   |
