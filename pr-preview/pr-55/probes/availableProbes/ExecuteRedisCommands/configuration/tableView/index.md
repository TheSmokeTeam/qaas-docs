# ExecuteRedisCommands Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                                  | Type                     | Required | Default | Description                                                                                                                              |
| ---------------------------------------------- | ------------------------ | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                           | `object or string`       | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.AbortOnConnectFail`        | `string or true/false`   | ✖        | `True`  | If true, connect will not create connection while no servers are available                                                               |
| `ProbeConfiguration.AsyncTimeout`              | `integer or string`      | ✖        | `5000`  | Time(ms) to allow for asynchronous operations                                                                                            |
| `ProbeConfiguration.ClientName`                | `string or null`         | ✖        |         | Identification for the connection within redis                                                                                           |
| `ProbeConfiguration.ConnectRetry`              | `integer or string`      | ✖        | `3`     | The number of times to repeat connect attempts during initial connect                                                                    |
| `ProbeConfiguration.KeepAlive`                 | `integer or string`      | ✖        | `60`    | Time (seconds) at which to send a message to help keep alive                                                                             |
| `ProbeConfiguration.Password`                  | `string or null`         | ✖        |         | Password for the redis server                                                                                                            |
| `ProbeConfiguration.RedisDataBase`             | `integer or string`      | ✖        | `0`     | Redis database to perform the probe on                                                                                                   |
| `ProbeConfiguration.Ssl`                       | `string or true/false`   | ✖        | `False` | Specifies that SSL encryption should be used                                                                                             |
| `ProbeConfiguration.SslHost`                   | `string or null`         | ✖        |         | Enforces a preticular SSL host identity on the server's certificate                                                                      |
| `ProbeConfiguration.UseGlobalDict`             | `string or true/false`   | ✖        | `False` | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Username`                  | `string or null`         | ✖        |         | User for the redis server                                                                                                                |
| `ProbeConfiguration.Commands`                  | `list or string`         | ✔        |         | The redis commands to execute                                                                                                            |
| `ProbeConfiguration.Commands[]`                | `object or string`       | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.Commands[].Command`        | `string`                 | ✔        |         | The redis command to execute                                                                                                             |
| `ProbeConfiguration.Commands[].StoreResultAs`  | `string or null`         | ✖        |         | Optional alias used to store the command result for later redisResults placeholders                                                      |
| `ProbeConfiguration.Commands[].Arguments`      | `list or string or null` | ✖        |         | Optional redis command arguments                                                                                                         |
| `ProbeConfiguration.Commands[].Arguments[]`    | `string`                 | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.HostNames`                 | `list or string`         | ✔        |         | List of the redis hostnames (each hostname should contain the port too for example: - 'host1:8080'                                       |
| `ProbeConfiguration.HostNames[]`               | `string`                 | ✖        |         |                                                                                                                                          |
| `ProbeConfiguration.RepeatUntil`               | `object or string`       | ✖        |         | Optional loop that repeats the command sequence until a stored redis result path matches the expected value                              |
| `ProbeConfiguration.RepeatUntil.ExpectedValue` | `string`                 | ✔        |         | Scalar value that ends the loop when the resolved ResultPath matches it                                                                  |
| `ProbeConfiguration.RepeatUntil.ResultPath`    | `string`                 | ✔        |         | Stored redisResults path to inspect after each command sequence iteration                                                                |
| `ProbeConfiguration.RepeatUntil.MaxIterations` | `integer or string`      | ✖        | `100`   | Safety cap for loop iterations                                                                                                           |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/ExecuteRedisCommands/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/ExecuteRedisCommands/overview/index.md)
