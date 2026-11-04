# Consumers

> TL;DR — Consumers are communication actions that receive data from the system. Every consumer creates an Output in SessionData with its own name.

Consumers are communication actions that receive data from the system. Every consumer creates an `Output` in `SessionData` with its own name.

At runtime a consumer connects to the selected reader, reads data into session `Output`, applies optional deserialization and data filtering, and exports running output data for other actions in the same session. Single-item readers keep reading until the configured timeout returns no data or a policy stops the action. Chunk readers wait for their inactivity window and then return the chunk once.

Use this page for behavior and YAML shape. The same action can be built in C# with the [ConsumerBuilder API](https://TheSmokeTeam.github.io/qaas-docs/qaas/functions/builders/consumers/index.md); that page is the function reference for the code-first surface.

**Table Property Path** - `Sessions[].Consumers[]`

## RabbitMq

Consumes byte payloads from RabbitMQ with `BasicGet` until no message arrives before the timeout. If no queue is configured, the reader creates a temporary queue, binds it to the configured exchange and routing key, and deletes it on disconnect. Consumed output includes the payload plus RabbitMQ routing key, headers, expiration, content type, and message type metadata.

**Table Property Path** - `Sessions[].Consumers[].RabbitMq`

```yaml
RabbitMq: {}
```

## KafkaTopic

Consumes byte payloads from a Kafka topic with the configured consumer group and consumer options. Each successful consume is committed, and the output metadata includes the Kafka message key and headers.

**Table Property Path** - `Sessions[].Consumers[].KafkaTopic`

```yaml
KafkaTopic: {}
```

Using Kafka consumer to empty a topic

Kafka consumers advance offsets for their consumer group; they do not clear topic data. `AutoOffsetReset` applies only when no valid committed offset exists. Use a dedicated group and an explicit offset strategy when preparing later test runs.

## OracleSqlTable

Reads rows from an Oracle SQL table. The reader waits until the configured inactivity timeout has passed since the latest table change, then queries rows from the configured table, optional `WhereStatement`, and optional insertion-time filter, returning each row as JSON output.

**Table Property Path** - `Sessions[].Consumers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

## MsSqlTable

Reads rows from a Microsoft SQL Server table. The reader waits for the table-change inactivity window, executes the configured query shape, omits configured columns, and returns each row as JSON output.

**Table Property Path** - `Sessions[].Consumers[].MsSqlTable`

```yaml
MsSqlTable: {}
```

## PostgreSqlTable

Reads rows from a PostgreSQL table. The reader uses the same SQL chunk-reader flow as the other SQL consumers: wait for inactivity, query rows with the configured filters, and return each row as JSON output.

**Table Property Path** - `Sessions[].Consumers[].PostgreSqlTable`

```yaml
PostgreSqlTable: {}
```

## TrinoSqlTable

Reads rows through a Trino coordinator. The reader builds a Trino connection from the configured host, catalog, schema, tag, and authentication values, waits for the inactivity window, and returns matching rows as JSON output.

**Table Property Path** - `Sessions[].Consumers[].TrinoSqlTable`

```yaml
TrinoSqlTable: {}
```

## S3Bucket

Consumes objects from an S3-compatible bucket. The reader waits until the bucket has been inactive for the configured timeout, lists objects by prefix and delimiter, optionally skips empty objects, and returns object bytes plus `MetaData.Storage.Key`. If the data filter excludes bodies, object contents are not downloaded.

**Table Property Path** - `Sessions[].Consumers[].S3Bucket`

```yaml
S3Bucket: {}
```

## ElasticIndices

Consumes documents from Elasticsearch indices using an index pattern. The reader waits until no matching document has been inserted within the timeout window, then uses the Elasticsearch scroll API with the configured query string, timestamp field, batch size, and scroll expiration. Returned outputs contain serialized JSON documents and timestamps derived from the configured timestamp field.

**Table Property Path** - `Sessions[].Consumers[].ElasticIndices`

```yaml
ElasticIndices: {}
```

ElasticSearch server timeout

When sending requests to the Elasticsearch server, remember that it can enforce its own request timeout. If increasing `RequestTimeoutMilliseconds` does not help, the server-side timeout may still be the limiting factor.

Elastic keywords

When using keywords in Elasticsearch queries, capitalize them. Lowercase keywords can be rejected or misread by the consumer.

## Socket

Consumes byte payloads from a socket. The reader opens the configured socket, waits until bytes are available or the timeout expires, and returns the received buffer as output.

**Table Property Path** - `Sessions[].Consumers[].Socket`

```yaml
Socket: {}
```

## IbmMqQueue

Consumes byte payloads from an IBM MQ queue. The reader opens the configured queue manager and queue, waits with the configured timeout, returns the message body when one is available, and treats `MQRC_NO_MSG_AVAILABLE` as a timeout with no output.

**Table Property Path** - `Sessions[].Consumers[].IbmMqQueue`

```yaml
IbmMqQueue: {}
```

## Throughput and compatibility (unreleased)

Source preview; wait for matching packages and schemas

The controls below require the Framework throughput changes and are not available in Protocols 1.7.1. Update the consuming Runner/Mocker packages and the generated family schemas after release. Existing configurations retain their default receipt, materialization and polling behavior.

| Consumer                       | Existing default                                                                   | Opt-in or repair in this preview                                                                                                                                                  | What to verify                                                                                                                                                                                                                                             |
| ------------------------------ | ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Kafka                          | Synchronous commit for every received message, even with `EnableAutoCommit: false` | `CommitMode: Batched` with `CommitBatchSize` (default 1000)                                                                                                                       | Commits receipt offsets, not downstream processing acknowledgements. Crash replay and rebalance behavior matter.                                                                                                                                           |
| RabbitMQ                       | Passive queue check plus auto-ack BasicGet polling                                 | `ValidateTopologyOnEveryOperation: false`; `UseSubscription: true` with bounded `PrefetchCount` (default 100)                                                                     | Subscription acknowledges on `Read`, not after assertions. Buffered unread deliveries remain unacknowledged and are requeued when the channel closes.                                                                                                      |
| SQL Server, PostgreSQL, Oracle | SELECT * and materialized rows                                                     | `ColumnsToRead` projects on the server; `StreamResults: true` returns rows incrementally                                                                                          | Projection uses exact quoted column names. Streaming changes error timing and repeat-enumeration behavior.                                                                                                                                                 |
| Trino                          | SQL query reader with the provider's 50-MiB result buffer                          | Same SQL projection/streaming controls; optional `ReadBufferSizeBytes`; corrected clock units for `CommandTimeoutSeconds`                                                         | A configured timeout remains seconds on both Windows and Linux. Query throughput is different from broker message throughput.                                                                                                                              |
| S3                             | Eager result snapshot, with bounded acquisition in the new implementation          | `StreamResults: true` and `MaxConcurrentDownloads` (default 1)                                                                                                                    | Streamed results can be partial on failure and repeat enumeration downloads again; retained Runner output remains unbounded by this setting.                                                                                                               |
| Redis                          | Existing destructive single-item reads                                             | No new read batching in this preview                                                                                                                                              | Choose data structures/order deliberately. Idle `PollIntervalMs` is not a populated-queue throughput control.                                                                                                                                              |
| Socket                         | Raw received byte chunks                                                           | Reader endpoint assignment, non-spinning readiness wait and graceful EOF handling repaired                                                                                        | TCP chunks are not application messages; `SeperationChar` remains inactive.                                                                                                                                                                                |
| IBM MQ                         | One MQGET per read with channel-side identity                                      | Optional `Username` and `Password` supply MQCSP credentials; nullable `SslCipherSpec`, `SslKeyRepository` and `SslPeerName` configure TLS; queue closes before manager disconnect | Protect credentials; choose TLS settings and a certificate store supported by the MQ client platform and server channel. Omitted TLS options preserve existing connection properties. No new syncpoint or processing-acknowledgement guarantee is implied. |

### Kafka batched receipt commits

Add this fragment to an existing Kafka consumer:

```yaml
KafkaTopic:
  CommitMode: Batched
  CommitBatchSize: 1000
```

`CommitMode` defaults to `PerMessage`, preserving the previous explicit commit and `EnableAutoCommit` configuration. `Batched` disables the client's auto commit and auto offset store, accumulates the next offset separately for each partition, and commits at the batch count, when a read times out without a record, on orderly disconnect, or for partitions being revoked. It does not use a background timer: while a caller is idle and has not disconnected, a partial batch remains uncommitted. Lost partition ownership discards pending offsets for those partitions instead of committing after ownership has moved.

The generic QaaS reader has no downstream “processing complete” callback. These are **receipt commits**. A successful commit can precede assertions or downstream processing; a crash before committing can cause replay. This is not an exactly-once processing mode. Use a stable consumer group and a deliberate `AutoOffsetReset`; that setting only applies when no valid committed offset exists. A consumer does not delete Kafka topic data.

### RabbitMQ bounded subscription

```yaml
RabbitMq:
  UseSubscription: true
  PrefetchCount: 32
```

The fragment supplements an existing queue/exchange and connection configuration. The default `UseSubscription: false` keeps BasicGet polling. Subscription mode validates topology during connection, uses manual broker acknowledgements on receipt by `Read`, and bounds its in-memory delivery queue by `PrefetchCount` (1–65535). The bound counts messages, not bytes: select a much smaller prefetch for large payloads. Closing the channel returns unread unacknowledged deliveries to RabbitMQ; an action that has already returned a message cannot acknowledge its later assertion outcome. Channel shutdown is an action failure, not evidence that all expected messages were read.

For polling mode, `ValidateTopologyOnEveryOperation: false` removes the extra passive queue declaration per read; queue declaration still runs during `Connect`. Its default remains `true`. Preserve the existing `Durable`, `Exclusive`, `AutoDelete` and persistence choices when comparing performance.

### Projected and streaming SQL reads

This example is a fragment under an existing SQL consumer; the same fields are available for PostgreSQL, SQL Server, Oracle and Trino:

```yaml
PostgreSqlTable:
  ColumnsToRead:
  - payload
  - created_at
  InsertionTimeField: created_at
  StreamResults: true
```

`ColumnsToRead` defaults to `null`, preserving SELECT \*. Supply stored column names with their exact case; QaaS quotes each name as one identifier, not as a SQL expression. The insertion-time column is added automatically if needed for timestamps. `ColumnsToIgnore` remains client-side filtering and does not reduce the server projection. Do not ignore a field needed for timestamps.

`StreamResults` defaults to `false`, preserving eager materialization and repeatable results. With `true`, row acquisition is deferred until enumeration, later failures can follow earlier rows, and another enumeration executes another query. Dispose the enumerator before disconnecting or reusing the connection. Early enumeration disposal closes the reader and connection. The inactivity wait still happens before acquisition; it is not a total query/download deadline. Runner continues retaining output for assertions, so streaming alone does not cap total session memory.

The Trino timeout adapter is specific to the pinned NH.Trino.Client 2025.11.15.6 dependency, which compares stopwatch ticks with time-span ticks. Users should configure the desired seconds directly; do not carry the benchmark-only Linux multiplier workaround into this version. Revalidate the adapter when upgrading the provider. `ReadBufferSizeBytes` is optional and affects provider result buffering, not total Runner retention.

For S3's download windows, repeat enumeration, memory costs and early stopping, see [incremental S3 reads](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/s3-headers-and-key-selection/#read-large-object-sets-incrementally). For rate, batching and publisher controls, see [publisher throughput guidance](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/publishers/#throughput-and-compatibility).

## See also

- [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
