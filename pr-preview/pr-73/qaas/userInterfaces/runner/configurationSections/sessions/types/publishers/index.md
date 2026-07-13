# Publishers

> TL;DR — Publishers are communication actions that send data to the system. Every publisher creates an Input in SessionData with its own name.

Publishers are communication actions that send data to the system. Every publisher creates an `Input` in `SessionData` with its own name.

At runtime a publisher resolves the configured data source names and patterns, serializes each generated data item when a serializer is configured, sends the payload through the selected protocol, and records the original item as session `Input`. Publishers can run in a fixed number of iterations or loop mode, sleep between iterations, run supported sends in parallel, and stop early when the policy chain returns false.

Use this page for behavior and YAML shape. The same action can be built in C# with the [PublisherBuilder API](https://TheSmokeTeam.github.io/qaas-docs/qaas/functions/builders/publishers/index.md); that page is the function reference for the code-first surface.

**Table Property Path** - `Sessions[].Publishers[]`

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

Publishes chunks of byte payloads to Redis by creating a Redis transaction and adding one Redis command per item. The configured `RedisDataType` selects the command: string set, list left or right push, set add, hash set, sorted set add, or geo add. Item metadata supplies the key and any required hash field, sorted-set score, or geo coordinates.

**Table Property Path** - `Sessions[].Publishers[].Redis`

```yaml
Redis: {}
```

Batch Publishing

Redis publisher uses batch publishing by default. When `BatchSize` is `1`, it behaves like single-message publishing. When batch publishing is enabled, policies apply per batch rather than per message.

## OracleSqlTable

Publishes chunks of structured data to an Oracle SQL table. Each item body is converted to a row-shaped object, the protocol opens an Oracle connection, and the configured command timeout applies to insert execution.

**Table Property Path** - `Sessions[].Publishers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

## MsSqlTable

Publishes chunks of structured data to a Microsoft SQL Server table. Item bodies are converted into rows and inserted into the configured table with the SQL command timeout from the sender configuration. Values that look like SQL user-defined type literals are passed through instead of quoted as plain strings.

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

## MongoDbCollection

Publishes chunks of documents to a MongoDB collection. Each item body is serialized to JSON, parsed as a BSON document, and inserted with `InsertMany` into the configured database and collection.

**Table Property Path** - `Sessions[].Publishers[].MongoDbCollection`

```yaml
MongoDbCollection: {}
```

## S3Bucket

Publishes byte payloads as objects in an S3-compatible bucket. The object key comes from `MetaData.Storage.Key` when present; otherwise the configured object-name generator and prefix are used. Entries in `MetaData.Storage.Headers` are uploaded as S3 user-defined metadata for that object. There is no publisher-level default header setting. Uploads use the configured storage class and retry mechanism.

**Table Property Path** - `Sessions[].Publishers[].S3Bucket`

```yaml
S3Bucket: {}
```

See [S3 headers and key selection](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/s3-headers-and-key-selection/index.md) for a publisher and consumer example that carries per-object headers through S3 and exposes them to assertions.

## ElasticIndex

Publishes chunks of documents to the configured Elasticsearch index with the Bulk API. The protocol sends item bodies as the indexed documents and fails the action if Elasticsearch reports bulk errors or an unsuccessful API call.

**Table Property Path** - `Sessions[].Publishers[].ElasticIndex`

```yaml
ElasticIndex: {}
```

ElasticSearch server timeout

When sending requests to the Elasticsearch server, remember that it can enforce its own request timeout. If increasing `RequestTimeoutMilliseconds` does not help, the server-side timeout may still be the limiting factor.

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

## See also

- [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
