# Publishers

> TL;DR — Publishers are communication actions that send data to the system. Every publisher creates an Input in SessionData with its own name.

Publishers are communication actions that send data to the system. Every publisher creates an `Input` in `SessionData` with its own name.

At runtime a publisher resolves the configured data source names and patterns, serializes each generated data item when a serializer is configured, sends the payload through the selected protocol, and records the original item as session `Input`. Publishers can run in a fixed number of iterations or loop mode, sleep between iterations, run supported sends in parallel, and stop early when the policy chain returns false.

Use this page for behavior and YAML shape. The same action can be built in C# with the [PublisherBuilder API](https://TheSmokeTeam.github.io/qaas-docs/qaas/functions/builders/publishers/index.md); that page is the function reference for the code-first surface.

**Table Property Path** - `Sessions[].Publishers[]`

## Parallel publishing and stress workloads

`Parallel.Parallelism` sets the maximum worker count for one publisher action. Omit `Parallel` for sequential execution, or set `Parallelism: 1` for one worker. A positive value such as `4` permits up to four sends at a time, provided the protocol supports concurrent calls. For chunk publishers it permits up to four **chunks** at a time. The limit applies separately to each action; two publishers with four workers each can have eight operations in progress.

Workers share the action's protocol instance and its connections. Increasing the worker count does not create a connection per worker. Parallel sends can complete out of source order. Policy evaluation is serialized across an action's workers, and operations already in progress can complete after a stop policy fires. See [action concurrency](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/#action-concurrency) for the separate `Stage` setting.

### Kafka publishing with a rate and duration

This session fragment sends a reusable, nonempty data source named `Events` whose items contain `byte[]` bodies. Supply the data source in your test and use the Kafka authentication settings required by your broker. It targets 5,000 sends/s for approximately 60 seconds with up to four workers:

```yaml
Sessions:
  - Name: KafkaStress
    Publishers:
      - Name: PublishEvents
        Stage: 0
        DataSourceNames: [Events]
        Loop: true
        Parallel:
          Parallelism: 4
        Policies:
          - LoadBalance:
              Rate: 5000
              TimeIntervalMs: 1000
          - Timeout:
              TimeoutMs: 60000
        KafkaTopic:
          HostNames: [broker.example:9093]
          Username: ${KAFKA_USERNAME}
          Password: ${KAFKA_PASSWORD}
          SecurityProtocol: SaslSsl
          TopicName: events-load
          QueueBufferingMaxKbytes: 32768
          LingerMs: 5
          BatchSize: 65536
          Acks: All
          EnableIdempotence: true
          MessageTimeoutMs: 30000
          FlushTimeoutMs: 35000
          ReportDeliveryErrors: true
```

The equivalent code returns a session builder to add to your execution configuration. `dataSourceName` must identify the same kind of reusable byte-payload source:

```csharp
using Confluent.Kafka;
using QaaS.Framework.Policies;
using QaaS.Framework.Policies.ConfigurationObjects;
using QaaS.Framework.Protocols.ConfigurationObjects.Kafka;
using QaaS.Runner.Sessions.Actions.Publishers.Builders;
using QaaS.Runner.Sessions.Session.Builders;

static SessionBuilder CreateKafkaStressSession(
    string dataSourceName, string broker, string topic,
    string username, string password)
{
    var publisher = new PublisherBuilder()
        .Named("PublishEvents")
        .AtStage(0)
        .AddDataSource(dataSourceName)
        .InLoops()
        .WithParallelism(4)
        .AddPolicy(new PolicyBuilder().WithLoadBalance(
            new LoadBalancePolicyConfig { Rate = 5000, TimeIntervalMs = 1000 }))
        .AddPolicy(new PolicyBuilder().WithTimeout(
            new TimeoutPolicyConfig { TimeoutMs = 60000 }))
        .Configure(new KafkaTopicSenderConfig
        {
            HostNames = [broker], Username = username, Password = password,
            SecurityProtocol = SecurityProtocol.SaslSsl, TopicName = topic,
            QueueBufferingMaxKbytes = 32768, LingerMs = 5, BatchSize = 65536,
            Acks = Acks.All, EnableIdempotence = true,
            MessageTimeoutMs = 30000, FlushTimeoutMs = 35000,
            ReportDeliveryErrors = true
        });
    return new SessionBuilder().Named("KafkaStress").AddPublisher(publisher);
}
```

The rate is shared by the action's workers; it is not 5,000 sends/s per worker. `Loop: true` repeats the selected source until a stop policy fires. `Iterations` instead specifies a finite number of source passes, and `SleepTimeMs` sleeps between passes, not between messages. An empty loop input performs no operations and therefore does not reach policy evaluation; provide a nonempty source. A timeout policy is checked after operations; it does not cancel an in-flight network call or flush. Omit `LoadBalance` for a capacity test with no configured pacing, and retain a finite source/iteration count or stopping policy. Start with one worker and increase gradually while measuring delivered records and resource use. Kafka `Send` enqueues, so include disconnect/flush and broker/readback verification when measuring delivery throughput.

### Chunk publishing and byte budgets

Runner requires `Chunk.ChunkSize` for Redis, MongoDB, Elasticsearch, Oracle and SQL Server publishers. PostgreSQL supports either singular sends or chunks. Kafka, RabbitMQ, S3, SFTP and socket publishers use singular sends and do not accept `Chunk`. `Parallel` still counts worker operations, but each operation sends a chunk. A fixed chunk of 100 items at 100 operations/s targets about 10,000 items/s. Chunk-publisher count and rate policies count chunks; consumer policies count yielded items.

This PostgreSQL session uses one connection sequentially, a reusable structured source named `Rows`, and at most 100 bodies or 4 MiB of serialized bodies per chunk. The table must already exist with columns matching the source:

```yaml
Sessions:
  - Name: BulkStress
    Publishers:
      - Name: PublishRows
        DataSourceNames: [Rows]
        Loop: true
        Chunk:
          ChunkSize: 100
          MaxBytes: 4194304
        Policies:
          - LoadBalance:
              Rate: 100
              TimeIntervalMs: 1000
          - Timeout:
              TimeoutMs: 60000
        PostgreSqlTable:
          ConnectionString: ${POSTGRES_CONNECTION_STRING}
          TableName: measurements
```

```csharp
using QaaS.Framework.Policies;
using QaaS.Framework.Policies.ConfigurationObjects;
using QaaS.Framework.Protocols.ConfigurationObjects.Sql;
using QaaS.Runner.Sessions.Actions.Publishers.Builders;
using QaaS.Runner.Sessions.ConfigurationObjects;
using QaaS.Runner.Sessions.Session.Builders;

static SessionBuilder CreateBulkStressSession(
    string dataSourceName, string connectionString, string tableName)
{
    var publisher = new PublisherBuilder()
        .Named("PublishRows")
        .AddDataSource(dataSourceName)
        .InLoops()
        .WithChunks(new Chunks { ChunkSize = 100, MaxBytes = 4194304 })
        .AddPolicy(new PolicyBuilder().WithLoadBalance(
            new LoadBalancePolicyConfig { Rate = 100, TimeIntervalMs = 1000 }))
        .AddPolicy(new PolicyBuilder().WithTimeout(
            new TimeoutPolicyConfig { TimeoutMs = 60000 }))
        .Configure(new PostgreSqlSenderConfig
        {
            ConnectionString = connectionString, TableName = tableName
        });
    return new SessionBuilder().Named("BulkStress").AddPublisher(publisher);
}
```

For a chunk protocol that supports concurrent sends, `.WithParallelism(2)` or `Parallel: { Parallelism: 2 }` permits two chunks in progress. Keep SQL actions sequential because their sends share one database connection. Use separate actions with separate connections and disjoint input subsets when the database workload requires concurrent writers. Each action has its own rate policy, so divide a total target among the actions.

`MaxBytes` measures byte-array lengths, UTF-8 string bytes, or the JSON representation of structured bodies. One body larger than the limit fails the action; it is not split. With byte-limited chunks, item counts vary and the rate-to-items multiplier varies too. The budget excludes transport envelopes, client buffers, DataTables, compression and retained session data. Omitting `MaxBytes` uses count-only chunks.

## RabbitMq

Publishes byte payloads to RabbitMQ through an AMQP channel. When `QueueName` is configured the publisher uses RabbitMQ's default exchange and the queue name as the routing key; otherwise it publishes to the configured exchange and routing key. Per-item `MetaData.RabbitMq` can override the routing key, headers, expiration, content type, and message type for that item.

**Table Property Path** - `Sessions[].Publishers[].RabbitMq`

```yaml
RabbitMq: {}
```

## KafkaTopic

Publishes byte payloads to a Kafka topic with the configured producer options. The topic, message key, and headers can come from `MetaData.Kafka` on each item or from the publisher configuration. The configured partition is used for sends, producer queue and compression settings are passed to the Kafka client, and `MessageSendMaxRetries` controls retry attempts around `Produce`.

**Table Property Path** - `Sessions[].Publishers[].KafkaTopic`

```yaml
KafkaTopic: {}
```

## Redis

Publishes chunks of byte payloads to Redis with one Redis command per item, using a transaction by default or a configured pipeline. The configured `RedisDataType` selects the command: string set, list left or right push, set add, hash set, sorted set add, or geo add. Item metadata supplies the key and any required hash field, sorted-set score, or geo coordinates.

**Table Property Path** - `Sessions[].Publishers[].Redis`

```yaml
Redis: {}
```

Batch Publishing

Redis uses chunk publishing. Configure `Chunk.ChunkSize` on the publisher; `Redis.BatchSize` is not read by the protocol. A chunk size of `1` sends one item per operation. When batch publishing is enabled, policies apply per batch rather than per message.

## OracleSqlTable

Publishes chunks of structured data to an Oracle SQL table. Each item body is converted to a row-shaped object, the protocol opens an Oracle connection, and the configured command timeout applies to insert execution.

**Table Property Path** - `Sessions[].Publishers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

## MsSqlTable

Publishes chunks of structured data to a Microsoft SQL Server table. Item bodies are converted into rows and inserted into the configured table with the SQL command timeout from the sender configuration. An empty `ColumnTypes` mapping uses SqlBulkCopy; a nonempty mapping uses parameterized row inserts in a transaction.

**Table Property Path** - `Sessions[].Publishers[].MsSqlTable`

```yaml
MsSqlTable: {}
```

## PostgreSqlTable

Publishes chunks of structured data to a PostgreSQL table. Item bodies are converted into row data and inserted into the configured table using the PostgreSQL sender configuration and command timeout.

**Table Property Path** - `Sessions[].Publishers[].PostgreSqlTable`

```yaml
PostgreSqlTable: {}
```

### Explicit column types

Use `ColumnTypes` to bind selected columns with explicit database type expressions:

```yaml
PostgreSqlTable:
  ConnectionString: Host=localhost;Database=qaas;Username=qaas;Password=example
  TableName: measurements
  ColumnTypes:
    price: double precision
    created_at: timestamp with time zone
    label: text
```

`ColumnTypes` is an optional map from column names to SQL type expressions, with no mapping by default. For individual sends, a configured column uses `CAST(value AS type)` before automatic date or UDT inference. This keeps a value such as `1.12` numeric when configured as `double precision`, and date-like text as text when configured as `text`. Unconfigured columns use automatic date/UDT inference unless `ParameterizeRows` is enabled. Null values remain SQL `NULL`. Type expressions are trusted configuration in the target database's dialect, like the table name; invalid casts fail in the database without falling back to automatic inference.

An omitted or empty mapping selects the native bulk path for chunks. A nonempty mapping selects parameterized row inserts to apply explicit casts, which can be slower than COPY. Every chunk value is passed as data without date inference or executable UDT-expression detection. Configured and unconfigured native values, including timestamps and binary payloads, keep their provider representation. Parsed JSON numbers retain their original text so the database cast preserves precision and exponent range. PostgreSQL binds text with an unspecified type so the target column or explicit cast determines conversion. Quotes and function-like text remain data. Both configured and unconfigured nulls remain database nulls. Typed chunk inserts run in one transaction and roll back together if any row fails.

Configured values in individual sends are also bound as parameters before the explicit cast. Unconfigured values in individual sends use automatic date/UDT inference unless `ParameterizeRows` is enabled.

## MongoDbCollection

Publishes chunks of documents to a MongoDB collection with `InsertMany`. Bodies are serialized to JSON and parsed as BSON by default. With `UseBsonDocumentDirectly: true`, BSON document bodies are cloned and inserted directly; other bodies use JSON conversion.

**Table Property Path** - `Sessions[].Publishers[].MongoDbCollection`

```yaml
MongoDbCollection: {}
```

## S3Bucket

Publishes byte payloads as objects in an S3-compatible bucket. The object key comes from `MetaData.Storage.Key` when present; otherwise the configured object-name generator and prefix are used. Uploads use the configured storage class and retry mechanism.

**Table Property Path** - `Sessions[].Publishers[].S3Bucket`

```yaml
S3Bucket: {}
```

## ElasticIndex

Publishes chunks of documents to the configured Elasticsearch index with the Bulk API. The protocol sends item bodies as the indexed documents and fails the action if Elasticsearch reports bulk errors or an unsuccessful API call.

**Table Property Path** - `Sessions[].Publishers[].ElasticIndex`

```yaml
ElasticIndex: {}
```

ElasticSearch server timeout

When sending requests to the Elasticsearch server, remember that it can enforce its own request timeout. If increasing `RequestTimeoutMs` does not help, the server-side timeout may still be the limiting factor.

## Socket

Publishes byte payloads directly through a socket connection to the configured host and port. The sender applies the configured socket family, type, protocol, send buffer size, timeout, Nagle setting, and linger setting before sending each payload.

**Table Property Path** - `Sessions[].Publishers[].Socket`

```yaml
Socket: {}
```

## Sftp

Publishes byte payloads as files over SFTP. The target file path is the configured remote path plus `MetaData.Storage.Key` when present, or a generated object name when no key is provided.

**Table Property Path** - `Sessions[].Publishers[].Sftp`

```yaml
Sftp: {}
```

## Throughput controls

Use package versions and matching configuration schemas that expose the settings you configure. Measure delivery and readback on the target server; worker count, batching and protocol options have different effects on latency, ordering and acknowledgement.

### Rate, workers and chunk budgets

The rate policy uses fractional milliseconds with the standard timer. Custom `ITimer` implementations can implement `IHighResolutionTimer` to supply fractional elapsed milliseconds. CPU contention, operating-system scheduling and protocol latency can lower the attained rate. Sub-millisecond pacing uses a short spin and costs CPU.

The worker limit controls active publisher or transaction operations, with no speculative input buffer in that loop. Transactions materialize parallel input before executing their workers. Runner retains session data for assertions; neither worker limits, streaming reads nor chunk byte budgets impose a total process-memory limit.

### Choose controls by publisher

| Publisher     | Concurrency and batching                                                                             | Configuration and delivery semantics                                                                                                                                                                                                                        |
| ------------- | ---------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Kafka         | Share the action's producer; start with one worker and increase only when measured delivery benefits | `LingerMs` and `BatchSize` control producer batching; `CompressionType` controls compression. `Acks`, `EnableIdempotence` and `MaxInFlight` define delivery/ordering constraints. `Send` enqueues. Nullable options use Kafka client defaults when omitted. |
| RabbitMQ      | Shared-channel sends are serialized; independent actions have independent channels                   | `ValidateTopologyOnEveryOperation` defaults to `true`; `false` validates a named exchange once at connection. `PublisherConfirms` defaults to `false`; `true` waits for confirms. Durability and message persistence are separate settings.                 |
| Redis         | Use chunks; `Redis.BatchSize` does not partition sends                                               | `UseTransactions` defaults to `true` for MULTI/EXEC; `false` uses a pipeline. Command results are observed. A command error fails the action without replaying successful sibling commands.                                                                 |
| PostgreSQL    | Keep one action sequential; untyped chunks use COPY                                                  | `ParameterizeRows: true` binds singular INSERT values as data. A nonempty `ColumnTypes` selects transactional row inserts for chunks.                                                                                                                       |
| SQL Server    | Keep one action sequential; untyped chunks use SqlBulkCopy                                           | A nonempty `ColumnTypes` selects row inserts. Budget for the DataTable and provider buffers in addition to body bytes.                                                                                                                                      |
| Oracle        | Keep one action sequential; untyped chunks use OracleBulkCopy where supported                        | Explicit CLOB/NCLOB/BLOB use provider LOB parameters. Large parameterized strings use CLOB binding. Runner requires `Chunk` for Oracle publishing.                                                                                                          |
| MongoDB       | Use InsertMany chunks and tune write concern in the connection string                                | `IsOrdered` defaults to `true`; `false` permits unordered inserts. `BypassDocumentValidation` is optional. `UseBsonDocumentDirectly: true` clones BSON document bodies; other bodies use JSON conversion.                                                   |
| Elasticsearch | Use bulk chunks and inspect per-item errors                                                          | JSON node/element bodies are translated for the NEST serializer; POCO bodies use normal client serialization. Numbers outside the bridge's exact decimal range fail explicitly.                                                                             |
| S3            | Bound publisher workers, request retries and object sizes                                            | Each send uploads one byte-array body. Numeric object names are zero-based and unique within one generator instance; provide distinct keys across actions and runs. `MaxConcurrentDownloads` is a reader setting.                                           |
| SFTP          | Shared-client sends are serialized; separate actions have separate SSH connections                   | `UploadBufferSize` is optional; omission uses the SSH.NET default. Select distinct paths across writers.                                                                                                                                                    |
| Socket        | Shared stream sends are serialized and continue until the full body is accepted                      | Datagram sends are not split. TCP is a byte stream; `SeperationChar` does not provide message framing. Verify bytes at the receiving application.                                                                                                           |

IBM MQ and Trino are reader-only in the QaaS protocol factories; MongoDB and SFTP have no QaaS reader. See [consumer throughput controls](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/consumers/#throughput-and-compatibility).

### Kafka delivery and batching

`ReportDeliveryErrors` defaults to `false`. When enabled, the first asynchronous delivery error is surfaced by a later `Send` or `Disconnect`. `FlushTimeoutMs` has no deadline when omitted; a configured deadline fails the action if records remain undelivered. The client validates incompatible idempotence, acknowledgement and in-flight settings. Match producer, topic/broker and reader maximum-message settings for large records and keep queue limits within available memory.

Runner disconnects publishers and consumers when action work succeeds or fails. A disconnect/flush failure fails otherwise successful work. If action work has already failed, its exception is retained and the cleanup error is logged.

### Oracle large payload chunks

Oracle publishing in Runner uses chunks. For a CLOB target column, configure a one-item chunk and explicit LOB type alongside the data source, connection and table settings:

```yaml
Chunk:
  ChunkSize: 1
OracleSqlTable:
  ColumnTypes:
    PAYLOAD: CLOB
```

Typed Oracle chunks bind every value as data and execute row inserts within a transaction. The configured CLOB column uses an Oracle LOB parameter. Select the native bulk path by omitting `ColumnTypes` when its type support and semantics fit the workload. `ParameterizeRows` controls singular INSERTs exposed by Framework SQL APIs; it does not select the Runner Oracle chunk path.

### Size and rate profiles

For a stress test, start with a finite duration and modest worker count, then increase one control at a time. Example profiles are 256-byte bodies at 10,000 items/s, 16-KiB bodies at 1,000 items/s, and 1-MiB bodies at 10 items/s. For chunks, convert the item target to chunk operations/s. These are workload inputs, not promised capacities.

Warm up, repeat runs, check counts and full payloads, and record CPU, peak memory, delivery completion, first-item latency and drain time. Keep acknowledgement, persistence, payloads, server limits and readback checks consistent between comparisons. Run one backend/workload at a time on a resource-constrained machine. For large messages reduce worker count, chunk size and prefetch before raising the rate. Use `DataFilter` to retain only assertion-relevant fields, while accounting for source data and other retained objects that it does not remove.

## See also

- [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
