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
    Redis publisher uses batch publishing by default. When `BatchSize` is `1`, it behaves like single-message publishing. When batch publishing is enabled, policies apply per batch rather than per message.

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
