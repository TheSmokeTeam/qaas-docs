# Publishers

Publishers are communication actions that send data to the system. Every publisher creates an `Input` in `SessionData` with its own name.

Publishers are responsible for retrieving data from data sources and pushing them to target systems. They can operate in chunks or in parallel depending on the configuration. You can apply policies to control rate limits, backpressure, and connection behaviors.

**Table Property Path** - `Sessions[].Publishers[]`

## RabbitMq

Publishes messages to a RabbitMQ exchange or queue using the AMQP protocol. This publisher allows you to specify the target exchange and routing key, or directly target a queue. It supports sending custom headers, content types, and expiration metadata along with the message body. By defining these in the output metadata, the publisher dynamically adapts per-message without altering the base configuration.

**Table Property Path** - `Sessions[].Publishers[].RabbitMq`

```yaml
RabbitMq: {}
```

## KafkaTopic

Publishes messages to a Kafka topic. It efficiently serializes the message body and routes it to the designated topic. The publisher manages Kafka connections dynamically and allows configuring key mapping (via metadata), custom headers, and partitioning strategies. It also provides deep control over buffer configurations and compression levels for high-throughput environments.

**Table Property Path** - `Sessions[].Publishers[].KafkaTopic`

```yaml
KafkaTopic: {}
```

## Redis

Publishes messages to a Redis cache or datastore. This publisher supports various Redis commands, such as lists, sets, and direct key-value additions depending on the configured `RedisDataType`.

**Table Property Path** - `Sessions[].Publishers[].Redis`

```yaml
Redis: {}
```

!!! Notice "Batch Publishing"
    Redis publisher uses batch publishing by default. When `BatchSize` is `1`, it behaves like single-message publishing. When batch publishing is enabled, policies apply per batch rather than per message.

## OracleSqlTable

Publishes messages to an Oracle SQL database table. It uses the provided connection string and table name to map the structured data to the relational schema and performs fast insertions. It supports configurable command timeouts to handle large workloads gracefully.

**Table Property Path** - `Sessions[].Publishers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

## MsSqlTable

Publishes messages to an Microsoft SQL Server database table. It seamlessly translates data items into SQL insert statements or bulk copies, utilizing standard SQL driver mechanisms. Includes support for custom timeouts and optionally handling complex User-Defined Types (UDT).

**Table Property Path** - `Sessions[].Publishers[].MsSqlTable`

```yaml
MsSqlTable: {}
```

## PostgreSqlTable

Publishes messages to a PostgreSQL database table. It connects using standard Postgres connection strings and optimally performs inserts into the target table name. The publisher automatically maps JSON structure onto the relational table columns.

**Table Property Path** - `Sessions[].Publishers[].PostgreSqlTable`

```yaml
PostgreSqlTable: {}
```

## MongoDbCollection

Publishes documents to a MongoDB collection. It directly maps structured data into BSON documents, facilitating easy inserts into NoSQL collections. The publisher manages the MongoDB client connections under the hood and allows specifying the precise database and collection name to target.

**Table Property Path** - `Sessions[].Publishers[].MongoDbCollection`

```yaml
MongoDbCollection: {}
```

## S3Bucket

Publishes messages to an Amazon S3 bucket. It is capable of sending large files or structured data by creating objects in the specified bucket. The publisher handles chunking and file naming conventions either through random guids or sequential identifiers, and natively supports different S3 storage classes for optimal pricing/performance.

**Table Property Path** - `Sessions[].Publishers[].S3Bucket`

```yaml
S3Bucket: {}
```

## ElasticIndex

Publishes documents to an Elasticsearch index. It utilizes the Elasticsearch Bulk API by default to group multiple document updates or insertions, boosting ingestion speed. 

**Table Property Path** - `Sessions[].Publishers[].ElasticIndex`

```yaml
ElasticIndex: {}
```

!!! warning "ElasticSearch server timeout"
    When sending requests to the Elasticsearch server, remember that it can enforce its own request timeout. If increasing `RequestTimeoutMilliseconds` does not help, the server-side timeout may still be the limiting factor.

## Socket

Publishes messages directly over a TCP or UDP socket to a remote host. The publisher connects to the exact port and IP/hostname specified and transmits raw byte payloads. It gives you raw control over lingering, Nagle's algorithm (TCP NoDelay), and buffer size.

**Table Property Path** - `Sessions[].Publishers[].Socket`

```yaml
Socket: {}
```

## Sftp

Publishes files to a remote server using the SFTP protocol. It establishes a secure SSH connection and transmits data objects directly into a target file path, dynamically naming the uploaded files based on numerical increments or GUIDs.

**Table Property Path** - `Sessions[].Publishers[].Sftp`

```yaml
Sftp: {}
```
