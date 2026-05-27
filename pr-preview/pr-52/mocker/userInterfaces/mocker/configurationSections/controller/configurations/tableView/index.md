# Controller Configurations Table View

> TL;DR: Controller Configurations Table View

| Property Path                         | Type                   | Required | Default | Description                                                                |
| ------------------------------------- | ---------------------- | -------- | ------- | -------------------------------------------------------------------------- |
| `Controller`                          | `object or string`     | ✖        |         | The server mocker controller configuration                                 |
| `Controller.ServerName`               | `string or null`       | ✖        |         | The Server name                                                            |
| `Controller.Redis`                    | `object or string`     | ✖        |         | The Server Controller Redis API                                            |
| `Controller.Redis.AbortOnConnectFail` | `string or true/false` | ✖        | True    | If true, connect will not create connection while no servers are available |
| `Controller.Redis.AsyncTimeout`       | `integer or string`    | ✖        | 5000    | Time(ms) to allow for asynchronous operations                              |
| `Controller.Redis.ClientName`         | `string or null`       | ✖        |         | Identification for the connection within redis                             |
| `Controller.Redis.ConnectRetry`       | `integer or string`    | ✖        | 3       | The number of times to repeat connect attempts during initial connect      |
| `Controller.Redis.Host`               | `string`               | ✖        |         | Redis hostname (should contain the port too for example: - 'host1:8080')   |
| `Controller.Redis.KeepAlive`          | `integer or string`    | ✖        | 60      | Time (seconds) at which to send a message to help keep alive               |
| `Controller.Redis.Password`           | `string or null`       | ✖        |         | Password for the redis server                                              |
| `Controller.Redis.RedisDataBase`      | `integer or string`    | ✖        | 0       | Redis database to use                                                      |
| `Controller.Redis.Ssl`                | `string or true/false` | ✖        | False   | Specifies that SSL encryption should be used                               |
| `Controller.Redis.SslHost`            | `string or null`       | ✖        |         | Enforces a preticular SSL host identity on the server's certificate        |
| `Controller.Redis.Username`           | `string or null`       | ✖        |         | User for the redis server                                                  |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
