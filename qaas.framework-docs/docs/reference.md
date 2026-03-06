# Framework Reference

## Configuration Types

### Shared Configuration Objects

| Type | Fields |
| --- | --- |
| `FilesInFileSystemConfig` | filesystem storage root and file-handling settings |
| `S3BucketConfig` | bucket name, region/endpoint details, and object prefix |
| `MongoCollectionConfig` | connection string, database name, collection name |
| `ReferenceConfig` | replacement keyword plus one or more YAML reference files |

### Protocol Configuration Families

The framework factories accept one config type per action. The family below tells you which type to use.

| Family | Types |
| --- | --- |
| HTTP / RPC | `HttpTransactorConfig`, `GrpcTransactorConfig` |
| Messaging | `RabbitMqReaderConfig`, `RabbitMqSenderConfig`, `KafkaTopicReaderConfig`, `KafkaTopicSenderConfig`, `IbmMqReaderConfig` |
| Storage / Object | `S3BucketReaderConfig`, `S3BucketSenderConfig`, `SftpSenderConfig` |
| Databases | `MsSqlReaderConfig`, `MsSqlSenderConfig`, `PostgreSqlReaderConfig`, `PostgreSqlSenderConfig`, `OracleReaderConfig`, `OracleSenderConfig`, `TrinoReaderConfig`, `MongoDbCollectionSenderConfig`, `RedisSenderConfig` |
| Search / Metrics | `ElasticReaderConfig`, `ElasticSenderConfig`, `PrometheusFetcherConfig` |
| Socket | `SocketReaderConfig`, `SocketSenderConfig` |

### Policy Types

| Type | Fields that matter most |
| --- | --- |
| `CountPolicyConfig` | max count before stop |
| `TimeoutPolicyConfig` | timeout in milliseconds |
| `LoadBalancePolicyConfig` | requests per interval |
| `IncreasingLoadBalancePolicyConfig` | min rate, max rate, increment cadence |
| `AdvancedLoadBalancePolicyConfig` | ordered stages with amount or timeout thresholds |

## Source-Derived Field Notes

### `HttpTransactorConfig`

- `Method`: required HTTP method.
- `BaseAddress`: required base URI and must include `http://` or `https://`.
- `Port`: optional port override, default `8080`.
- `Route`: optional path suffix, default empty string.
- `Headers`: default content headers.
- `RequestHeaders`: default request headers.
- `JwtAuth`: optional JWT generation settings.
- `Retries`: retry count, default `1`.
- `MessageSendRetriesIntervalMs`: delay between retries, default `1000`.

### `GrpcTransactorConfig`

- `Host`: required host.
- `Port`: required port.
- `AssemblyName`: assembly that contains the generated proto types.
- `ProtoNameSpace`: namespace containing the service definitions.
- `ServiceName`: service to invoke.
- `RpcName`: RPC method to invoke.

### `RabbitMqSenderConfig`

- `ExchangeName`: optional exchange target.
- `RoutingKey`: routing key, default `/`.
- `QueueName`: optional direct queue target.
- `Headers`: optional message headers.
- `ContentType`, `Type`, `Expiration`: optional AMQP properties.

### `KafkaTopicSenderConfig`

- `TopicName`: required topic.
- `DefaultKafkaKey`: fallback key when generated data does not provide one.
- `Partition`: explicit partition or `-1` for any partition.
- `MessageSendMaxRetries`: retry ceiling.
- `MessageSendRetriesIntervalMs`: retry backoff.
- `QueueBufferingMaxMessages`, `QueueBufferingMaxKbytes`, `QueueBufferingBackpressureThreshold`: producer buffering controls.
- `Headers`: optional Kafka headers.
- `CompressionType`, `CompressionLevel`: transport compression.

### `RedisSenderConfig`

- `RedisDataType`: required Redis write primitive.
- `RedisDataBase`: logical database, default `0`.
- `Retries` and `RetryIntervalMs`: write retry controls.
- `BatchSize`: optional batch limit.
- `When`: conditional write mode.
- `CommandFlags`: StackExchange.Redis execution flags.

### `PrometheusFetcherConfig`

- `Url`: base Prometheus URL.
- `Expression`: required `query_range` expression.
- `SampleIntervalMs`: step interval, default `30000`.
- `TimeoutMs`: API timeout, default `120000`.
- `ApiKey`: optional authentication token.

### `BaseRedisConfig`

- `HostNames`: required endpoints.
- `Username` / `Password`: optional credentials.
- `AbortOnConnectFail`, `ConnectRetry`, `AsyncTimeout`, `KeepAlive`: connection behavior.
- `Ssl` and `SslHost`: TLS controls.
- `ClientName`: logical client name visible on the server.

## Extension Guidance

- Add new protocol configs only when you can also wire them into the correct factory.
- Keep config types narrow. The existing design prefers one explicit config per protocol or action family over large discriminated unions.
- Use `Description`, `Display`, and validation attributes in source. The docs depend on those annotations staying accurate.
