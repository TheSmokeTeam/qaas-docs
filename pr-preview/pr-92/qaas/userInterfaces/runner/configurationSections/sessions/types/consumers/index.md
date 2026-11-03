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

Kafka consumers can advance the offset for future runs. If you want to clear a topic for later consumers, run an earlier consumer with `AutoOffsetReset` set to `earliest`, then keep the later consumer on `latest`.

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

## See also

- [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
