# YAML Configuration Reference

This page focuses on the user-facing model that `ExecutionBuilder`, the session builders, and the protocol config types actually bind.

## Top-Level Sections

| Section | Purpose |
| --- | --- |
| `anchors` | Plain YAML anchors. QaaS does not own this section; YAML does. |
| `variables` | Placeholder source values such as hosts, ports, and credentials. |
| `DataSources` | Reusable generator-backed input definitions. |
| `Sessions` | Traffic and side-effect actions against the system under test. |
| `Storages` | External storage for `act` and `assert` workflows. |
| `Assertions` | Pass/fail rules over session data. |
| `Links` | Observability links attached to assertion results. |
| `MetaData` | Team, system, and other run metadata written into context and reports. |

## DataSources

| Field | Meaning |
| --- | --- |
| `Name` | Unique data source identifier. Other builders reference this value. |
| `Generator` | Hook name to resolve. |
| `Lazy` | When `true`, keeps generation lazy instead of materializing eagerly. |
| `DataSourceNames` | Named upstream data sources passed into the generator. |
| `DataSourcePatterns` | Regex-based upstream data source selection. |
| `GeneratorConfiguration` | Dynamic config object bound into the generator. |
| `Serialize` | Optional serializer applied to generated data. |
| `Deserialize` | Optional deserializer applied to generated data. |

`Serialize` and `Deserialize` use `SerializationType` values such as `Binary`, `Json`, `MessagePack`, `Xml`, `Yaml`, `ProtobufMessage`, and `XmlElement`.

## Sessions

| Field | Meaning |
| --- | --- |
| `Name` | Unique session identifier. |
| `Stage` | Sessions with the same stage can run together. Defaults to the session index. |
| `Category` | Optional filterable category for `--session-categories`. |
| `SaveData` | When `false`, session data is discarded after iteration. |
| `TimeoutBeforeSessionMs` | Delay before the session starts. |
| `TimeoutAfterSessionMs` | Delay after the session ends. |
| `Publishers` | Outbound actions that send data. |
| `Consumers` | Inbound actions that read data until timeout. |
| `Transactions` | Request/response actions such as HTTP or gRPC. |
| `Probes` | Side-effect hooks with no returned data. |
| `Collectors` | Observability fetchers that collect data around the session runtime. |
| `MockerCommands` | Redis-backed commands sent to QaaS.Mocker. |
| `Stages` | Per-stage timeout overrides. |

## Publishers

| Field | Meaning |
| --- | --- |
| `Name` | Publisher identifier and input name in saved session data. |
| `DataSourceNames` / `DataSourcePatterns` | Which data sources to publish from. |
| `DataFilter` | Whether `Body`, `Timestamp`, and `MetaData` are kept in stored data. |
| `Iterations` | Number of publishing passes. Default `1`. |
| `Loop` | Repeats indefinitely until another policy stops it. |
| `SleepTimeMs` | Delay between iterations. |
| `Parallel` | Parallelism block with `Parallelism`. |
| `Chunk` | Chunked publishing block with `ChunkSize`. |
| `Stage` | Action stage inside the session. |
| `Policies` | Ordered policy pipeline. |
| `Serialize` | Serializer for outgoing bodies. |
| protocol block | Exactly one of `RabbitMq`, `KafkaTopic`, `Redis`, `PostgreSqlTable`, `OracleSqlTable`, `S3Bucket`, `Socket`, `ElasticIndex`, `MsSqlTable`, `MongoDbCollection`, `Sftp`. |

## Consumers

| Field | Meaning |
| --- | --- |
| `Name` | Consumer identifier and output name in saved session data. |
| `TimeoutMs` | Stops consuming when no new message arrives within this window. |
| `DataFilter` | Controls stored `Body`, `Timestamp`, and `MetaData`. |
| `Stage` | Action stage inside the session. |
| `Policies` | Policy pipeline for the underlying protocol. |
| `Deserialize` | Deserializer for incoming bodies. |
| protocol block | Exactly one of `RabbitMq`, `KafkaTopic`, `MsSqlTable`, `OracleSqlTable`, `TrinoSqlTable`, `PostgreSqlTable`, `S3Bucket`, `ElasticIndices`, `Socket`, `IbmMqQueue`. |

## Transactions

| Field | Meaning |
| --- | --- |
| `Name` | Shared input/output action name. |
| `DataSourceNames` / `DataSourcePatterns` | Which data sources drive the requests. |
| `Iterations` / `Loop` / `SleepTimeMs` | Request repetition controls. |
| `TimeoutMs` | Request timeout for the response. |
| `InputDataFilter` | Filter for saved request data. |
| `OutputDataFilter` | Filter for saved response data. |
| `Stage` | Action stage inside the session. |
| `Policies` | Policy pipeline. |
| `InputSerialize` | Serializer for outgoing request bodies. |
| `OutputDeserialize` | Deserializer for incoming response bodies. |
| `Http` or `Grpc` | Exactly one transactor configuration. |

## Probes

| Field | Meaning |
| --- | --- |
| `Name` | Probe identifier inside the session. |
| `Probe` | Hook type name to resolve. |
| `Stage` | Stage in which the probe runs. |
| `DataSourceNames` / `DataSourcePatterns` | Upstream data sources passed to the probe. |
| `ProbeConfiguration` | Dynamic config bound into the probe. |

## Collectors

| Field | Meaning |
| --- | --- |
| `Name` | Collector identifier. |
| `DataFilter` | Filters collected data before it is stored. |
| `CollectionRange` | Time window relative to session start and end. |
| `EndTimeReachedCheckIntervalMs` | Poll interval while waiting for collection end time. |
| `Prometheus` | Prometheus `query_range` fetch configuration. |

## MockerCommands

| Field | Meaning |
| --- | --- |
| `Name` | Command identifier. |
| `Stage` | Stage in which the command runs. |
| `ServerName` | Target mocker server name. |
| `Redis` | Redis connection settings for the controller channel. |
| `Command` | Exactly one command block such as `ChangeActionStub`, `TriggerAction`, or `Consume`. |
| `RequestDurationMs` | Wait duration per command request. |
| `RequestRetries` | Number of retry attempts. |

## Assertions

| Field | Meaning |
| --- | --- |
| `Assertion` | Hook name to resolve. |
| `Name` | Unique test result name shown in the report. |
| `Category` | Optional filter for `--assertion-categories`. |
| `SessionNames` / `SessionNamePatterns` | Session selection for the assertion. |
| `DataSourceNames` / `DataSourcePatterns` | Additional data source selection. |
| `SaveSessionData` | Includes session data in the report when `true`. |
| `SaveAttachments` | Includes assertion attachments when `true`. |
| `SaveTemplate` | Includes the rendered configuration template when `true`. |
| `DisplayTrace` | Controls whether the full assertion trace is written to the report. |
| `Severity` | Allure severity mapping. |
| `AssertionConfiguration` | Dynamic config bound into the assertion hook. |
| `Links` | Assertion-specific observability links. |
| `StatusesToReport` | Status whitelist for report output. |

## Storages

| Field | Meaning |
| --- | --- |
| `JsonStorageFormat` | `Indented` or compact JSON output. |
| `FileSystem` | Directory-backed storage with `Path` and `SearchPattern`. |
| `S3` | S3-backed storage with bucket, credentials, prefix, delimiter, retries, and empty-object handling. |

## Links

| Field | Meaning |
| --- | --- |
| `Name` | Display name in the report. |
| `Kibana` | Generates a Kibana discovery link. |
| `Prometheus` | Generates one or more Prometheus graph links. |
| `Grafana` | Generates a Grafana dashboard link. |

## Common Nested Configs

### RabbitMQ sender and reader

| Field | Meaning |
| --- | --- |
| `Host` | RabbitMQ host name. |
| `Username` / `Password` | Connection credentials. |
| `Port` | AMQP port. Default `5672`. |
| `VirtualHost` | RabbitMQ virtual host. Default `/`. |
| `ContinuationTimeoutSeconds` | Timeout for protocol operations such as queue declaration. |
| `RequestedConnectionTimeoutSeconds` | Connection timeout. |
| `HandshakeContinuationTimeoutSeconds` | Handshake timeout. |
| `ExchangeName` | Exchange target or source. Mutually exclusive with `QueueName`. |
| `QueueName` | Queue target or source. Mutually exclusive with `ExchangeName`. |
| `RoutingKey` | Routing key. Default `/`. |

Sender-only fields:

- `Headers`
- `ContentType`
- `Type`
- `Expiration`

Reader-only field:

- `CreatedQueueTimeToExpireMs`

### HTTP transaction

| Field | Meaning |
| --- | --- |
| `Method` | Required HTTP verb. |
| `BaseAddress` | Required base URL including `http://` or `https://`. |
| `Port` | Destination port. Default `8080`. |
| `Route` | Relative route. |
| `Headers` | Default content headers. |
| `RequestHeaders` | Default request headers. |
| `JwtAuth` | Optional bearer token generation config. |
| `Retries` | Retry count for failed requests. |
| `MessageSendRetriesIntervalMs` | Delay between retries. |

`JwtAuth` supports `Secret`, flat `Claims`, optional `HierarchicalClaims`, `JwtAlgorithm`, `HttpAuthScheme`, and `BuildJwtConfig`.

### gRPC transaction

| Field | Meaning |
| --- | --- |
| `Host` | gRPC server host. |
| `Port` | gRPC server port. |
| `AssemblyName` | Assembly that contains the generated proto types. |
| `ProtoNameSpace` | Namespace that contains the generated proto types. |
| `ServiceName` | gRPC service name. |
| `RpcName` | RPC method name. |

### Redis controller config

The runner mocker command config and the mocker controller config both use the same shape in practice:

`Host`, `Username`, `Password`, `AbortOnConnectFail`, `ConnectRetry`, `ClientName`, async timeout, `Ssl`, `SslHost`, keep-alive seconds, and `RedisDataBase`.

## Source of Truth

For deeper field-by-field behavior, use the source:

- [QaaS.Runner]([[repo:runner]])
- [QaaS.Framework]([[repo:framework]])
