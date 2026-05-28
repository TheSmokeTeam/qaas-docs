# FlushDbRedis Configurations Table View

> TL;DR: Field-by-field reference for FlushDbRedis ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path                           | Type                   | Required | Default | Description                                                                                                                          |
| --------------------------------------- | ---------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `ProbeConfiguration`                    | `object or string`     | ✖        |         |                                                                                                                                      |
| `ProbeConfiguration.AbortOnConnectFail` | `string or true/false` | ✖        | True    | If true, connect will not create connection while no servers are available                                                           |
| `ProbeConfiguration.AsyncTimeout`       | `integer or string`    | ✖        | 5000    | Time(ms) to allow for asynchronous operations                                                                                        |
| `ProbeConfiguration.ClientName`         | `string or null`       | ✖        |         | Identification for the connection within redis                                                                                       |
| `ProbeConfiguration.ConnectRetry`       | `integer or string`    | ✖        | 3       | The number of times to repeat connect attempts during initial connect                                                                |
| `ProbeConfiguration.KeepAlive`          | `integer or string`    | ✖        | 60      | Time (seconds) at which to send a message to help keep alive                                                                         |
| `ProbeConfiguration.Password`           | `string or null`       | ✖        |         | Password for the redis server                                                                                                        |
| `ProbeConfiguration.RedisDataBase`      | `integer or string`    | ✖        | 0       | Redis database to perform the probe on                                                                                               |
| `ProbeConfiguration.Ssl`                | `string or true/false` | ✖        | False   | Specifies that SSL encryption should be used                                                                                         |
| `ProbeConfiguration.SslHost`            | `string or null`       | ✖        |         | Enforces a preticular SSL host identity on the server's certificate                                                                  |
| `ProbeConfiguration.UseGlobalDict`      | `string or true/false` | ✖        | False   | When true, missing Redis probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
| `ProbeConfiguration.Username`           | `string or null`       | ✖        |         | User for the redis server                                                                                                            |
| `ProbeConfiguration.HostNames`          | `list or string`       | ✔        |         | List of the redis hostnames (each hostname should contain the port too for example: - 'host1:8080'                                   |
| `ProbeConfiguration.HostNames[]`        | `string`               | ✖        |         |                                                                                                                                      |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
