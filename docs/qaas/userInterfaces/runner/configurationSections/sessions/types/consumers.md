---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.consumers
type: reference
status: stable
since: 2.0.0
last_verified: 2026-11-04
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Consumers are communication actions that receive data from the system. Every consumer creates an Output in SessionData with its own name."
---
# Consumers

> TL;DR — Consumers are communication actions that receive data from the system. Every consumer creates an Output in SessionData with its own name.

Consumers are communication actions that receive data from the system. Every consumer creates an `Output` in `SessionData` with its own name.

At runtime a consumer connects to the selected reader, reads data into session `Output`, applies optional deserialization and data filtering, and exports running output data for other actions in the same session. Single-item readers keep reading until the configured timeout returns no data or a policy stops the action. Chunk readers wait for their inactivity window and then return the chunk once.

Use this page for behavior and YAML shape. The same action can be built in C# with the [ConsumerBuilder API](../../../../../../qaas/functions/builders/consumers.md); that page is the function reference for the code-first surface.

**Table Property Path** - `Sessions[].Consumers[]`

## Concurrent consumers and stress workloads {: #concurrent-consumers}

A consumer action has one reader and no `Parallel` setting or `WithParallelism` method. To run independent readers concurrently, add separately named consumers to the session and assign the same `Stage`. Each action has its own connection, policy chain, timeouts and output collection. Combine those outputs when checking total counts. `Stage` controls launch grouping, not a readiness handshake or completion barrier; see [action concurrency](../overview.md#action-concurrency).

For Kafka, consumers with the same `GroupId` share partitions. At most one member of the group owns a partition at a time; additional readers beyond the usable partition count can be idle. Different groups each read their own copy of the topic stream. To distribute load across two consumers, provision a topic with at least two partitions and distribute produced records across them. A publisher fixed to one partition cannot keep both readers busy.

This session fragment creates two readers in one group. Use a dedicated test topic/group and the broker's authentication settings. `AutoOffsetReset: Earliest` applies when the group has no valid committed offset; it does not rewind an existing group:

```yaml
Sessions:
  - Name: KafkaDrain
    Consumers:
      - Name: ReadEventsA
        Stage: 0
        InitialTimeoutMs: 15000
        TimeoutMs: 5000
        Policies:
          - Timeout:
              TimeoutMs: 60000
        KafkaTopic:
          HostNames: [broker.example:9093]
          Username: ${KAFKA_USERNAME}
          Password: ${KAFKA_PASSWORD}
          SecurityProtocol: SaslSsl
          TopicName: events-load
          GroupId: stress-readers
          AutoOffsetReset: Earliest
          CommitMode: Batched
          CommitBatchSize: 1000
      - Name: ReadEventsB
        Stage: 0
        InitialTimeoutMs: 15000
        TimeoutMs: 5000
        Policies:
          - Timeout:
              TimeoutMs: 60000
        KafkaTopic:
          HostNames: [broker.example:9093]
          Username: ${KAFKA_USERNAME}
          Password: ${KAFKA_PASSWORD}
          SecurityProtocol: SaslSsl
          TopicName: events-load
          GroupId: stress-readers
          AutoOffsetReset: Earliest
          CommitMode: Batched
          CommitBatchSize: 1000
```

The equivalent code adds one `ConsumerBuilder` per reader:

```csharp
using Confluent.Kafka;
using QaaS.Framework.Policies;
using QaaS.Framework.Policies.ConfigurationObjects;
using QaaS.Framework.Protocols.ConfigurationObjects.Kafka;
using QaaS.Runner.Sessions.Actions.Consumers.Builders;
using QaaS.Runner.Sessions.Session.Builders;

static SessionBuilder CreateKafkaDrainSession(
    string broker, string topic, string group,
    string username, string password)
{
    var session = new SessionBuilder().Named("KafkaDrain");
    foreach (var name in new[] { "ReadEventsA", "ReadEventsB" })
    {
        session.AddConsumer(new ConsumerBuilder()
            .Named(name).AtStage(0)
            .WithInitialTimeout(15000).WithTimeout(5000)
            .AddPolicy(new PolicyBuilder().WithTimeout(
                new TimeoutPolicyConfig { TimeoutMs = 60000 }))
            .Configure(new KafkaTopicReaderConfig
            {
                HostNames = [broker], Username = username, Password = password,
                SecurityProtocol = SecurityProtocol.SaslSsl,
                TopicName = topic, GroupId = group,
                AutoOffsetReset = AutoOffsetReset.Earliest,
                CommitMode = KafkaCommitMode.Batched, CommitBatchSize = 1000
            }));
    }
    return session;
}
```

The timeout policy applies separately to each reader and is checked after received items. `InitialTimeoutMs` gives a single-item reader extra time for its first record; `TimeoutMs` controls later idle reads. A reader can stop before 60 seconds if its idle timeout expires. Choose both timeouts to cover producer startup, group assignment and expected gaps between messages. Runner passes these durations to the protocol; enforcement depends on the reader and its client library. The timeout policy itself does not cancel an in-flight read. Chunk readers ignore `InitialTimeoutMs`; their `TimeoutMs` controls protocol-specific acquisition/inactivity behavior.

Omit consumer `LoadBalance` when measuring maximum drain throughput; adding it deliberately paces processing. Both single-item and chunk consumers evaluate their policies once per yielded item. A `Count` policy belongs to one action, not the whole group; uneven partition assignment makes identical per-reader counts unsuitable as a total-group stopping condition.

RabbitMQ consumers on the same nonexclusive queue compete for deliveries. Use separately named actions with matching queue declaration settings, `Exclusive: false`, and a bounded `PrefetchCount` when using subscriptions. Separate queues bound to the same exchange can instead receive separate copies, according to the bindings. For SQL, S3 and Elasticsearch, multiple readers of the same selection can duplicate results; partition the query, key prefix or index selection explicitly. S3 can overlap downloads inside one reader with `MaxConcurrentDownloads`, without adding consumer actions.

## RabbitMq {: #rabbitmq}

Consumes byte payloads from RabbitMQ through `BasicGet` polling or a configured subscription until no message arrives before the timeout. If no queue is configured, the reader creates a temporary queue, binds it to the configured exchange and routing key, and deletes it on disconnect. Consumed output includes the payload plus RabbitMQ routing key, headers, expiration, content type, and message type metadata.

**Table Property Path** - `Sessions[].Consumers[].RabbitMq`

```yaml
RabbitMq: {}
```

## KafkaTopic {: #kafkatopic}

Consumes byte payloads from a Kafka topic with the configured consumer group and consumer options. The configured commit mode records received offsets, and output metadata includes the Kafka message key and headers.

**Table Property Path** - `Sessions[].Consumers[].KafkaTopic`

```yaml
KafkaTopic: {}
```

!!! Tip "Kafka offsets and test runs"
    Kafka consumers advance offsets for their consumer group; they do not clear topic data. `AutoOffsetReset` applies only when no valid committed offset exists. Use a dedicated group and an explicit offset strategy when preparing later test runs.

## OracleSqlTable {: #oraclesqltable}

Reads rows from an Oracle SQL table. The reader waits until the configured inactivity timeout has passed since the latest table change, then queries rows from the configured table, optional `WhereStatement`, and optional insertion-time filter, returning each row as JSON output.

**Table Property Path** - `Sessions[].Consumers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

## MsSqlTable {: #mssqltable}

Reads rows from a Microsoft SQL Server table. The reader waits for the table-change inactivity window, executes the configured query shape, omits configured columns, and returns each row as JSON output.

**Table Property Path** - `Sessions[].Consumers[].MsSqlTable`

```yaml
MsSqlTable: {}
```

## PostgreSqlTable {: #postgresqltable}

Reads rows from a PostgreSQL table. The reader uses the same SQL chunk-reader flow as the other SQL consumers: wait for inactivity, query rows with the configured filters, and return each row as JSON output.

**Table Property Path** - `Sessions[].Consumers[].PostgreSqlTable`

```yaml
PostgreSqlTable: {}
```

## TrinoSqlTable {: #trinosqltable}

Reads rows through a Trino coordinator. The reader builds a Trino connection from the configured host, catalog, schema, tag, and authentication values, waits for the inactivity window, and returns matching rows as JSON output.

**Table Property Path** - `Sessions[].Consumers[].TrinoSqlTable`

```yaml
TrinoSqlTable: {}
```

## S3Bucket {: #s3bucket}

Consumes objects from an S3-compatible bucket. The reader waits until the bucket has been inactive for the configured timeout, lists objects by prefix and delimiter, optionally skips empty objects, and returns object bytes plus `MetaData.Storage.Key`. If the data filter excludes bodies, object contents are not downloaded.

**Table Property Path** - `Sessions[].Consumers[].S3Bucket`

```yaml
S3Bucket: {}
```

## ElasticIndices {: #elasticindices}

Consumes documents from Elasticsearch indices using an index pattern. The reader waits until no matching document has been inserted within the timeout window, then uses the Elasticsearch scroll API with the configured query string, timestamp field, batch size, and scroll expiration. Returned outputs contain serialized JSON documents and timestamps derived from the configured timestamp field.

**Table Property Path** - `Sessions[].Consumers[].ElasticIndices`

```yaml
ElasticIndices: {}
```

!!! warning "ElasticSearch server timeout"
    When sending requests to the Elasticsearch server, remember that it can enforce its own request timeout. If increasing `RequestTimeoutMs` does not help, the server-side timeout may still be the limiting factor.

!!! warning "Elastic keywords"
    When using keywords in Elasticsearch queries, capitalize them. Lowercase keywords can be rejected or misread by the consumer.

## Socket {: #socket}

Consumes byte payloads from a socket. The reader opens the configured socket, waits until bytes are available or the timeout expires, and returns the received buffer as output.

**Table Property Path** - `Sessions[].Consumers[].Socket`

```yaml
Socket: {}
```

## IbmMqQueue {: #ibmmqqueue}

Consumes byte payloads from an IBM MQ queue. The reader opens the configured queue manager and queue, waits with the configured timeout, returns the message body when one is available, and treats `MQRC_NO_MSG_AVAILABLE` as a timeout with no output.

**Table Property Path** - `Sessions[].Consumers[].IbmMqQueue`

```yaml
IbmMqQueue: {}
```

## Throughput controls {: #throughput-and-compatibility}

Choose acknowledgement, buffering and selection settings for the workload:

| Reader | Throughput controls | Semantics and limits |
| --- | --- | --- |
| Kafka | Group members share partitions; `CommitMode: Batched` reduces commit round trips; tune `FetchMinBytes`, `FetchWaitMaxMs` and message-size limits | `PerMessage` is the default. Commits represent receipt, not downstream processing. |
| RabbitMQ | `UseSubscription: true` uses a bounded queue and `PrefetchCount`; polling can validate topology once with `ValidateTopologyOnEveryOperation: false` | Defaults are BasicGet polling and per-operation validation. Subscription reads acknowledge received messages; unread unacknowledged deliveries return to the queue on channel close. |
| SQL Server, PostgreSQL, Oracle | `ColumnsToRead` projects on the server; `StreamResults: true` yields rows incrementally | Defaults are SELECT * and materialized rows. Use separate selections/connections for concurrent readers. |
| Trino | SQL projection and streaming; optional `ReadBufferSizeBytes` | The result buffer defaults to the provider's 50 MiB. `CommandTimeoutSeconds` is measured in seconds. |
| S3 | `StreamResults` and `MaxConcurrentDownloads` | Defaults are eager results and a download limit of 1. Download count is not a byte or retained-output limit. |
| Elasticsearch | `ReadBatchSize` controls each paged search response; restrict the selected index pattern | Each consumer executes its own search. Budget for page bodies and retained output; overlapping searches can duplicate results. |
| Socket | Buffer size and read timeout | Output consists of received byte chunks. TCP does not retain application-message boundaries, and `SeperationChar` is inactive. |
| IBM MQ | Independent queue readers; optional MQCSP `Username`/`Password` and TLS options | One MQGET per read. Use `SslCipherSpec`, `SslKeyRepository` and `SslPeerName` supported by the client and server channel. There is no downstream-processing acknowledgement callback. |
| Redis (Framework reader API) | Destructive single-item reads and idle `PollIntervalMs` | Redis reading is exposed by the Framework reader factory, not by Runner's `Consumers` YAML/ConsumerBuilder. Idle polling interval does not increase populated-queue throughput. |

### Kafka batched receipt commits {: #kafka-batched-receipt-commits}

Add this fragment to an existing Kafka consumer:

```yaml
KafkaTopic:
  CommitMode: Batched
  CommitBatchSize: 1000
```

`CommitMode` defaults to `PerMessage`, which explicitly commits each consumed record even when `EnableAutoCommit` is `false`. `EnableAutoCommit` additionally controls the Kafka client's periodic auto commit in this mode. `Batched` disables the client's auto commit and auto offset store, accumulates the next offset separately for each partition, and commits at the batch count, when a read times out without a record, on orderly disconnect, or for partitions being revoked. It does not use a background timer: while a caller is idle and has not disconnected, a partial batch remains uncommitted. Lost partition ownership discards pending offsets for those partitions instead of committing after ownership has moved.

The generic QaaS reader has no downstream “processing complete” callback. These are **receipt commits**. A successful commit can precede assertions or downstream processing; a crash before committing can cause replay. This is not an exactly-once processing mode. Use a stable consumer group and a deliberate `AutoOffsetReset`; that setting only applies when no valid committed offset exists. A consumer does not delete Kafka topic data.

### RabbitMQ bounded subscription {: #rabbitmq-bounded-subscription}

```yaml
RabbitMq:
  UseSubscription: true
  PrefetchCount: 32
```

The fragment supplements an existing queue/exchange and connection configuration. `UseSubscription: false` selects BasicGet polling and is the default. Subscription mode validates topology during connection, uses manual broker acknowledgements on receipt by `Read`, and bounds its in-memory delivery queue by `PrefetchCount` (1–65535). The bound counts messages, not bytes: select a much smaller prefetch for large payloads. Closing the channel returns unread unacknowledged deliveries to RabbitMQ; an action that has already returned a message cannot acknowledge its later assertion outcome. Channel shutdown is an action failure, not evidence that all expected messages were read.

For polling mode, `ValidateTopologyOnEveryOperation: false` removes the extra passive queue declaration per read; queue declaration still runs during `Connect`. Its default is `true`. Configure `Durable`, `Exclusive`, `AutoDelete` and persistence for the required queue lifetime and message durability.

### Projected and streaming SQL reads {: #projected-and-streaming-sql-reads}

This example is a fragment under an existing SQL consumer; the same fields are available for PostgreSQL, SQL Server, Oracle and Trino:

```yaml
PostgreSqlTable:
  ColumnsToRead:
  - payload
  - created_at
  InsertionTimeField: created_at
  StreamResults: true
```

`ColumnsToRead` defaults to `null`, which selects all columns. Supply stored column names with their exact case; QaaS quotes each name as one identifier, not as a SQL expression. The insertion-time column is added automatically if needed for timestamps. `ColumnsToIgnore` filters on the client and does not reduce the server projection. Do not ignore a field needed for timestamps.

`StreamResults` defaults to `false`: results are materialized eagerly and can be enumerated repeatedly. With `true`, row acquisition is deferred until enumeration, later failures can follow earlier rows, and another enumeration executes another query. Dispose the enumerator before disconnecting or reusing the connection. Early enumeration disposal closes the reader and connection. The inactivity wait happens before acquisition; it is not a total query/download deadline. Runner retains output for assertions, so streaming alone does not cap total session memory.

`CommandTimeoutSeconds` specifies the Trino query deadline in seconds on Windows and Linux. `ReadBufferSizeBytes` affects provider result buffering, not total Runner retention.

For S3's download windows, repeat enumeration, memory costs and early stopping, see [incremental S3 reads](s3-headers-and-key-selection.md#read-large-object-sets-incrementally). For rate, batching and publisher controls, see [publisher throughput guidance](publishers.md#throughput-and-compatibility).

## See also {: #see-also}

- [Sessions](../overview.md)
