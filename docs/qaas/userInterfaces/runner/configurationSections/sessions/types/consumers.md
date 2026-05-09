# Consumers

Consumers are communication actions that receive data from the system. Every consumer creates an `Output` in `SessionData` with its own name.

Consumers are responsible for actively monitoring, polling, or subscribing to target systems in order to pull data back into the Runner for subsequent processing, validation, or storage. The core logic of a consumer is to establish a connection to an external endpoint, continuously or periodically check for new data, and convert that incoming data stream into structured `Output` items. Consumers are often utilized in asynchronous testing scenarios where the Runner must wait for a system under test to process an event and emit a corresponding message or database row. They handle the complexities of connection management, message acknowledgment, and data deserialization seamlessly.

**Table Property Path** - `Sessions[].Consumers[]`

## RabbitMq

Consumes messages from a RabbitMQ exchange or queue. The underlying mechanism involves establishing a persistent connection to the RabbitMQ broker using the AMQP protocol. The consumer logic subscribes to a specific queue and waits for the broker to push messages to it. Upon receiving a message, the consumer extracts the raw payload along with all associated AMQP headers, routing keys, and metadata properties. It then acknowledges the message (if configured to do so) and translates the entire package into a structured `Output` item in the session data, making the metadata fully accessible for assertions.

**Table Property Path** - `Sessions[].Consumers[].RabbitMq`

```yaml
RabbitMq: {}
```

## KafkaTopic

Consumes messages from a Kafka topic. The core logic relies on the Kafka consumer protocol to connect to a cluster of brokers, join a consumer group, and subscribe to one or more topics. The consumer continuously polls the brokers for new message batches. It leverages the consumer group's `AutoOffsetReset` configuration to determine where to begin reading—either from the earliest available message or only new messages arriving after the connection is established. It handles the intricacies of partition assignment and offset management under the hood, ensuring that messages are reliably fetched and transformed into session outputs.

**Table Property Path** - `Sessions[].Consumers[].KafkaTopic`

```yaml
KafkaTopic: {}
```

!!! Tip "Using Kafka consumer to empty a topic"
    Kafka consumers can advance the offset for future runs. If you want to clear a topic for later consumers, run an earlier consumer with `AutoOffsetReset` set to `earliest`, then keep the later consumer on `latest`.

## OracleSqlTable

Consumes data from an Oracle SQL database table. The consumer's logic focuses on retrieving relational data through executing queries against the specified table. Instead of subscribing to an event stream, it establishes a database connection and pulls existing rows matching the configuration. This is particularly useful for verifying that an application has successfully persisted the correct state into the database. The consumer handles translating the relational row sets into distinct data objects that the Runner can analyze.

**Table Property Path** - `Sessions[].Consumers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

## MsSqlTable

Consumes rows from a Microsoft SQL Server database table. The underlying logic involves connecting to the SQL Server using native drivers, issuing query commands, and streaming the result sets back to the Runner. The consumer abstracts away the complexities of dealing with database cursors and data type conversions, reading the queried rows and representing them as structured outputs. This allows tests to easily assert against the final state of the database after a workflow has completed.

**Table Property Path** - `Sessions[].Consumers[].MsSqlTable`

```yaml
MsSqlTable: {}
```

## PostgreSqlTable

Consumes data from a PostgreSQL database table. The core logic centers on executing read operations against a PostgreSQL instance. The consumer manages the connection lifecycle, sends the query request, and iteratively processes the returned records. It ensures that PostgreSQL-specific data types are accurately mapped into the Runner's internal format, allowing for precise validation of the data that an application has written to the database.

**Table Property Path** - `Sessions[].Consumers[].PostgreSqlTable`

```yaml
PostgreSqlTable: {}
```

## TrinoSqlTable

Consumes data using the Trino distributed SQL query engine. Rather than connecting to a single, monolithic database, this consumer's logic interacts with the Trino coordinator. It allows the Runner to execute federated queries across multiple underlying data sources (like Hive, Cassandra, or relational databases) as if they were a single system. The consumer submits the query, waits for Trino's distributed workers to gather the data, and accumulates the unified result set into session outputs.

**Table Property Path** - `Sessions[].Consumers[].TrinoSqlTable`

```yaml
TrinoSqlTable: {}
```

## S3Bucket

Consumes messages and files from an Amazon S3 bucket. The underlying mechanism interacts with object storage APIs rather than streaming protocols. The consumer logic queries the specified S3 bucket for objects matching a certain prefix or pattern. Once identified, it retrieves the objects, downloading their payloads directly into the Runner. This is vital for testing workflows that culminate in file generation, allowing the Runner to ingest the generated files and assert on their contents or metadata.

**Table Property Path** - `Sessions[].Consumers[].S3Bucket`

```yaml
S3Bucket: {}
```

## ElasticIndices

Consumes documents from Elasticsearch indices using an index pattern. The core logic relies on the Elasticsearch Search API to scan and retrieve JSON documents from the cluster. The consumer connects to the Elasticsearch nodes and executes queries based on specific matches or keyword searches. It handles pagination and scrolling under the hood if large datasets are returned, converting the retrieved Elasticsearch hits into standard output documents for the session.

**Table Property Path** - `Sessions[].Consumers[].ElasticIndices`

```yaml
ElasticIndices: {}
```

!!! warning "ElasticSearch server timeout"
    When sending requests to the Elasticsearch server, remember that it can enforce its own request timeout. If increasing `RequestTimeoutMilliseconds` does not help, the server-side timeout may still be the limiting factor.

!!! warning "Elastic keywords"
    When using keywords in Elasticsearch queries, capitalize them. Lowercase keywords can be rejected or misread by the consumer.

## Socket

Consumes messages using a raw TCP or UDP socket from a remote host. The consumer's logic operates at the network transport layer, binding to a local port or connecting to a remote endpoint and continuously listening for incoming byte streams. It does not impose any application-level framing (like HTTP or AMQP) on the data. Instead, it reads raw chunks of bytes as they arrive on the socket and converts them into output items. This is ideal for testing custom protocols or capturing low-level network emissions from the system under test.

**Table Property Path** - `Sessions[].Consumers[].Socket`

```yaml
Socket: {}
```

## IbmMqQueue

Consumes messages from an IBM MQ queue. The underlying logic handles the specialized authentication and connection requirements of IBM MQ servers. The consumer connects to the queue manager, opens the target queue, and continuously polls or waits for new messages to arrive. It retrieves the message payload along with IBM MQ specific headers and properties, making them available in the session data for rigorous validation of legacy or enterprise messaging architectures.

**Table Property Path** - `Sessions[].Consumers[].IbmMqQueue`

```yaml
IbmMqQueue: {}
```
