---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.publishers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-10-15
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Publishers are communication actions that send data to the system. Every publisher creates an Input in SessionData with its own name."
---
# Publishers

> TL;DR — Publishers are communication actions that send data to the system. Every publisher creates an Input in SessionData with its own name.

Publishers are communication actions that send data to the system. Every publisher creates an `Input` in `SessionData` with its own name.

At runtime a publisher resolves the configured data source names and patterns, serializes each generated data item when a serializer is configured, sends the payload through the selected protocol, and records the original item as session `Input`. Publishers can run in a fixed number of iterations or loop mode, sleep between iterations, run supported sends in parallel, and stop early when the policy chain returns false.

Use this page for behavior and YAML shape. The same action can be built in C# with the [PublisherBuilder API](../../../../../../qaas/functions/builders/publishers.md); that page is the function reference for the code-first surface.

**Table Property Path** - `Sessions[].Publishers[]`

## RabbitMq {: #rabbitmq}

Publishes byte payloads to RabbitMQ through an AMQP channel. When `QueueName` is configured the publisher uses RabbitMQ's default exchange and the queue name as the routing key; otherwise it publishes to the configured exchange and routing key. Per-item `MetaData.RabbitMq` can override the routing key, headers, expiration, content type, and message type for that item.

**Table Property Path** - `Sessions[].Publishers[].RabbitMq`

```yaml
RabbitMq: {}
```

## KafkaTopic {: #kafkatopic}

Publishes byte payloads to a Kafka topic with the configured producer options. The topic, message key, and headers can come from `MetaData.Kafka` on each item or from the publisher configuration. The configured partition is used for sends, producer queue and compression settings are passed to the Kafka client, and `MessageSendMaxRetries` controls retry attempts around `Produce`.

**Table Property Path** - `Sessions[].Publishers[].KafkaTopic`

```yaml
KafkaTopic: {}
```

## Redis {: #redis}

Publishes chunks of byte payloads to Redis by creating a Redis transaction and adding one Redis command per item. The configured `RedisDataType` selects the command: string set, list left or right push, set add, hash set, sorted set add, or geo add. Item metadata supplies the key and any required hash field, sorted-set score, or geo coordinates.

**Table Property Path** - `Sessions[].Publishers[].Redis`

```yaml
Redis: {}
```

!!! Notice "Batch Publishing"
    Redis uses chunk publishing. Configure `Chunk.ChunkSize` on the publisher; `Redis.BatchSize` is a legacy property that the protocol does not read. A chunk size of `1` sends one item per operation. When batch publishing is enabled, policies apply per batch rather than per message.

## OracleSqlTable {: #oraclesqltable}

Publishes chunks of structured data to an Oracle SQL table. Each item body is converted to a row-shaped object, the protocol opens an Oracle connection, and the configured command timeout applies to insert execution.

**Table Property Path** - `Sessions[].Publishers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

## MsSqlTable {: #mssqltable}

Publishes chunks of structured data to a Microsoft SQL Server table. Item bodies are converted into rows and inserted into the configured table with the SQL command timeout from the sender configuration. Values that look like SQL user-defined type literals are passed through instead of quoted as plain strings.

**Table Property Path** - `Sessions[].Publishers[].MsSqlTable`

```yaml
MsSqlTable: {}
```

## PostgreSqlTable {: #postgresqltable}

Publishes chunks of structured data to a PostgreSQL table. Item bodies are converted into row data and inserted into the configured table using the PostgreSQL sender configuration and command timeout.

**Table Property Path** - `Sessions[].Publishers[].PostgreSqlTable`

```yaml
PostgreSqlTable: {}
```

### Explicit column types (Framework 1.7.0) {: #postgresql-column-types}

Available with `QaaS.Framework.Protocols` 1.7.0 and Runner 4.8.3. Use the matching
Runner family schema for configuration validation. Runner 4.8.2 and its schema
do not expose `ColumnTypes`; upgrade the packages and schema before using this
configuration fragment:

```yaml
PostgreSqlTable:
  ConnectionString: Host=localhost;Database=qaas;Username=qaas;Password=example
  TableName: measurements
  ColumnTypes:
    price: double precision
    created_at: timestamp with time zone
    label: text
```

`ColumnTypes` is an optional map from column names to SQL type expressions, with
no mapping by default. For individual sends, a configured column uses
`CAST(value AS type)` before automatic date or UDT inference. This keeps a value
such as `1.12` numeric when configured as `double precision`, and date-like text
as text when configured as `text`. Unconfigured columns retain the legacy row
inference order. Null values remain SQL `NULL`. Type expressions are trusted
configuration in the target database's dialect, like the table name; invalid
casts fail in the database without falling back to automatic inference.

When the mapping is omitted or empty, single sends and bulk chunk sends retain
their existing behavior. A nonempty mapping makes chunk sends use parameterized
row inserts to apply explicit casts, which can be slower than COPY. Every chunk
value is passed as data without date inference or executable UDT-expression
detection. Configured and unconfigured native values, including timestamps and
binary payloads, keep their provider representation. Parsed JSON numbers retain
their original text so the database cast preserves precision and exponent range.
PostgreSQL binds text with an unspecified type so the
target column or explicit cast determines conversion. Quotes and function-like
text remain data. Both configured and unconfigured nulls remain database nulls.
Typed chunk inserts run in one transaction and roll back together if any row fails.

Configured values in individual sends are also bound as parameters before the
explicit cast. Unconfigured values in individual sends retain the original
inference behavior.

## MongoDbCollection {: #mongodbcollection}

Publishes chunks of documents to a MongoDB collection. Each item body is serialized to JSON, parsed as a BSON document, and inserted with `InsertMany` into the configured database and collection.

**Table Property Path** - `Sessions[].Publishers[].MongoDbCollection`

```yaml
MongoDbCollection: {}
```

## S3Bucket {: #s3bucket}

Publishes byte payloads as objects in an S3-compatible bucket. The object key comes from `MetaData.Storage.Key` when present; otherwise the configured object-name generator and prefix are used. Uploads use the configured storage class and retry mechanism.

**Table Property Path** - `Sessions[].Publishers[].S3Bucket`

```yaml
S3Bucket: {}
```

## ElasticIndex {: #elasticindex}

Publishes chunks of documents to the configured Elasticsearch index with the Bulk API. The protocol sends item bodies as the indexed documents and fails the action if Elasticsearch reports bulk errors or an unsuccessful API call.

**Table Property Path** - `Sessions[].Publishers[].ElasticIndex`

```yaml
ElasticIndex: {}
```

!!! warning "ElasticSearch server timeout"
    When sending requests to the Elasticsearch server, remember that it can enforce its own request timeout. If increasing `RequestTimeoutMilliseconds` does not help, the server-side timeout may still be the limiting factor.

## Socket {: #socket}

Publishes byte payloads directly through a socket connection to the configured host and port. The sender applies the configured socket family, type, protocol, send buffer size, timeout, Nagle setting, and linger setting before sending each payload.

**Table Property Path** - `Sessions[].Publishers[].Socket`

```yaml
Socket: {}
```

## Sftp {: #sftp}

Publishes byte payloads as files over SFTP. The target file path is the configured remote path plus `MetaData.Storage.Key` when present, or a generated object name when no key is provided.

**Table Property Path** - `Sessions[].Publishers[].Sftp`

```yaml
Sftp: {}
```

## See also {: #see-also}

- [Sessions](../overview.md)

## Throughput and compatibility (unreleased) {: #throughput-and-compatibility}

!!! warning "Source preview; wait for matching packages and schemas"
    These additions are not in Framework Protocols 1.7.1 or Runner Sessions 4.8.4. Use a Framework build containing the throughput changes for protocol options, and a Runner build containing the bounded-worker changes for `Chunk.MaxBytes`. After release, update the Runner/Mocker package dependencies and family schema downloads through PackageMirror before using new YAML fields. Existing configurations need no new fields.

The default configuration keeps the existing batching, acknowledgement, ordering and serialization choices. New settings that change those choices are opt-in. There is no blanket guarantee that enabling every option makes a workload faster: measure completed delivery and readback on the target server.

### Rate, workers and chunk budgets {: #rate-workers-and-chunk-budgets}

The rate policy now uses fractional milliseconds with the standard timer, removing the approximately 1,000-action/s ceiling caused by truncating elapsed time. Existing custom `ITimer` implementations still work; they can implement `IHighResolutionTimer` to supply fractional elapsed milliseconds. This is not a real-time scheduler: CPU contention, operating-system scheduling and protocol latency can lower the attained rate. Sub-millisecond pacing uses a short spin and costs CPU.

Runner bounds the worker loop itself to `Parallel.Parallelism`, rather than creating extra workers that block on the send semaphore. This applies to single publishers, chunk publishers and transactions. A degree of `1` has one worker and no speculative input buffer. Omitting `Parallel` still runs sequentially. Policy evaluation is serialized; already-running operations can finish after a stop policy fires. Worker bounds do not make a shared protocol connection support concurrent requests: keep SQL actions sequential, and use independent actions/connections only when needed. RabbitMQ and SFTP serialize access to their shared sending channel/client.

`Chunk.ChunkSize` remains the maximum item count. The optional `Chunk.MaxBytes` adds a serialized-body budget, for example:

```yaml
Chunk:
  ChunkSize: 100
  MaxBytes: 4194304
```

This fragment belongs alongside the protocol configuration under a chunk publisher. Byte arrays use their length, strings use UTF-8 bytes, and structured bodies use their JSON representation. A single body exceeding the budget fails the action; it is not split. Transport envelopes, BSON/SQL representation, compression, client buffers and retained session inputs are outside this budget. Leave headroom and reduce chunk sizes for large messages. JSON size estimation has CPU/allocation cost. Omit `MaxBytes` to preserve count-only batching.

Rate policies count **send operations**, so they count chunks for chunk publishers. With fixed 100-item chunks, a policy rate of 100 chunks/s targets approximately 10,000 items/s. Byte-bounded chunks can contain different item counts; use observed item throughput instead of assuming a constant multiplier. Runner continues retaining session data for assertions; these controls do not provide a total process-memory bound.

### Choose controls by publisher {: #choose-controls-by-publisher}

| Publisher | Start with existing features | Additions in this preview | Semantics and limits |
| --- | --- | --- | --- |
| Kafka | Long-lived actions, bounded producer queue, appropriate compression and partition/key distribution | Nullable `LingerMs`, `BatchSize`, `Acks`, `EnableIdempotence`, `MessageTimeoutMs`, `MaxInFlight`; optional `FlushTimeoutMs` and `ReportDeliveryErrors` | Omitted nullable options leave client defaults intact. `Send` enqueues; it does not wait for broker delivery. Idempotence is not a transaction across messages. |
| RabbitMQ | Reuse the channel; choose the default exchange only when its routing semantics fit | `ValidateTopologyOnEveryOperation: false` checks a named exchange once during `Connect`; optional `PublisherConfirms: true` waits for confirmations | Defaults keep per-send passive validation and no confirms. Shared-channel sends are serialized. Confirmed sends can be slower; queue durability and message persistence are separate settings. |
| Redis | Use `Chunk.ChunkSize`; the old `Redis.BatchSize` property does not partition sends | `UseTransactions: false` uses a nontransactional pipeline | Default remains MULTI/EXEC. Every queued command result is observed. A command error after execution fails the action without replaying the batch; successful sibling commands may already be stored. |
| PostgreSQL | Bounded chunks use COPY; keep one connection sequential | `ParameterizeRows: true` binds all singular INSERT values as data; byte-bounded Runner chunks | Default row date/UDT inference is unchanged. `ColumnTypes` still selects row transactions instead of COPY. No new binary COPY or per-worker connection pool is implied. |
| SQL Server | Bounded chunks use SqlBulkCopy; keep one connection sequential | Byte-bounded Runner chunks | `ColumnTypes` still selects per-row inserts. A chunk body budget is not a DataTable or SQL Server memory limit. |
| Oracle | Prefer bounded OracleBulkCopy chunks where supported | Correct explicit CLOB/NCLOB/BLOB binding; `ParameterizeRows: true` enables safe singular data binding | CLOB/NCLOB use provider LOB parameters rather than unsupported `CAST(... AS CLOB)`. Native binary or base64 JSON values can bind to BLOB. Large parameterized strings use CLOB binding. Legacy untyped singular INSERTs remain unchanged and can still fail on large string literals. |
| MongoDB | Tune InsertMany chunk count/bytes; set write concern in the connection string | `IsOrdered: false`, nullable `BypassDocumentValidation`, `UseBsonDocumentDirectly: true` | Ordered insertion remains the default. Unordered insertion changes failure/order semantics. Direct mode applies only to BSON document bodies and clones them so driver-generated `_id` values do not mutate the input. Other bodies keep JSON conversion. |
| Elasticsearch | Tune bulk chunks and check per-item failures | QaaS JSON node/element bodies are translated for the existing NEST 7 serializer | Existing POCO bodies are unchanged. Numbers outside the bridge's exact decimal range fail explicitly rather than being rounded. This does not upgrade the client or certify all server-major combinations. |
| S3 | Reuse the client, bound concurrency, use finite retries and unique keys | Bounded Runner workers and atomic numeric object-name generation | No multipart/streaming PUT or byte-based in-flight upload queue is added. Names remain zero-based within one generator instance, not globally unique across actions/runs. |
| SFTP | Reuse the SSH connection and choose distinct paths | Nullable `UploadBufferSize`, serialized shared-client writes, explicit disposal | Omitted buffer size keeps the SSH.NET default. Parallel workers on one action do not create extra SSH connections. File aggregation or atomic rename requires an explicit downstream contract. |
| Socket | Tune buffers and Nagle behavior, verify received bytes | Stream sends continue until all bytes are accepted; simultaneous sends are serialized | Datagram sends are not split. TCP remains a byte stream; this preview does not introduce message framing or activate the legacy `SeperationChar` property. |

IBM MQ and Trino are consumer-only in the QaaS factories; MongoDB and SFTP have no QaaS reader. Do not report native fixture seeding/readback as a QaaS publisher/consumer measurement. See [consumer throughput controls](consumers.md#throughput-and-compatibility).

### Kafka delivery and batching example {: #kafka-delivery-and-batching-example}

Add these fields to an existing `KafkaTopic` publisher only after upgrading to the matching package/schema:

```yaml
KafkaTopic:
  LingerMs: 5
  BatchSize: 65536
  Acks: All
  EnableIdempotence: true
  MessageTimeoutMs: 30000
  FlushTimeoutMs: 35000
  ReportDeliveryErrors: true
```

The client validates incompatible idempotence/acknowledgement/in-flight settings. `ReportDeliveryErrors` defaults to `false`; when enabled, the first asynchronous delivery error is retained and surfaced by a later `Send` or `Disconnect`. `FlushTimeoutMs` defaults to no deadline, preserving the existing flush behavior. When set, an incomplete flush fails the action rather than reporting undelivered records as successful. Match producer, topic/broker and reader maximum-message settings for large records. Keep queue limits within available memory.

Runner now disconnects publishers and consumers even if work fails. A disconnect/flush failure fails otherwise successful work; if the operation already failed, that original exception is preserved and the cleanup error is logged.

### Oracle large singular payload example {: #oracle-large-singular-payload-example}

Use provider-correct LOB types for an Oracle target with a CLOB column:

```yaml
OracleSqlTable:
  ParameterizeRows: true
  ColumnTypes:
    PAYLOAD: CLOB
```

This is a fragment; retain the existing connection/table settings. `ParameterizeRows` defaults to `false`. Enabling it treats date-like and function-like strings as data rather than executing the legacy inferred expression. Explicit `ColumnTypes` continues to bypass that inference even when `ParameterizeRows` is omitted. Typed chunks still execute row inserts within a transaction; use the native bulk path when its type support and semantics fit.

### Benchmark without changing the workload contract {: #benchmark-without-changing-the-workload-contract}

Measure one publisher/backend at a time on a constrained machine. A useful starting matrix is 256-byte bodies at 10,000 items/s, 16-KiB bodies at 1,000 items/s, and 1-MiB bodies at 10 items/s, followed by an unthrottled run. Warm up, repeat runs, check counts and full payloads, and record CPU, peak memory, delivery completion, first-item latency and drain time separately. These are test profiles, not promised capacities. Keep acknowledgements, persistence, server limits and readback checks identical when comparing tuning options.

Further work such as processing acknowledgements, fully asynchronous protocol APIs, typed native SQL bulk paths, per-worker connection pools, multipart S3 uploads, socket framing and new protocol readers needs separate contracts and validation. None of those semantics is silently enabled by a version update.
