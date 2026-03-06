# Redis

## Available Probes

- `FlushAllRedis`
- `FlushDbRedis`
- `EmptyRedisByChunks`

## Common Configuration Fields

The Redis probes use the shared Redis protocol configuration:

| Field | Required | Description |
|---|---|---|
| `HostNames` | yes | Redis endpoints, including port, for example `redis:6379`. |
| `Username` | no | Redis username. |
| `Password` | no | Redis password. |
| `AbortOnConnectFail` | no | Fail fast if no servers are available. Default: `true`. |
| `ConnectRetry` | no | Initial connection retry count. Default: `3`. |
| `ClientName` | no | Redis client name. |
| `AsyncTimeout` | no | Async timeout in milliseconds. Default: `5000`. |
| `Ssl` | no | Whether SSL is enabled. |
| `SslHost` | no | Expected SSL host identity. |
| `KeepAlive` | no | Keep-alive interval in seconds. Default: `60`. |
| `RedisDataBase` | no | Target database number. Default: `0`. |

`EmptyRedisByChunks` also adds:

| Field | Required | Description |
|---|---|---|
| `BatchSize` | no | Number of keys to scan and delete per chunk. Default: `100`. |

Use `FlushAllRedis` for broad cleanup, `FlushDbRedis` for one database, and `EmptyRedisByChunks` when you want a safer chunked delete flow.
