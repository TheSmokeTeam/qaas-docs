# Publishers

Publishers are communication actions that send data to the system. Every publisher creates an `Input` in `SessionData` with its own name.

Publishers are responsible for retrieving data from data sources and pushing them to target systems. The core logic of a publisher involves iterating over its assigned data sources, transforming or filtering the data as required, and executing the communication protocol to transmit the data. Publishers operate within the broader context of a session, meaning they can be configured to execute at specific stages, run sequentially or in parallel, and even operate continuously in loops. Additionally, they are governed by policies that can dictate the rate of publication, apply backpressure, or manage connection retries, ensuring the system remains stable even under high loads or when target endpoints are unstable.

**Table Property Path** - `Sessions[].Publishers[]`

## RabbitMq

Publishes messages to a RabbitMQ exchange or queue. The core logic involves establishing an AMQP connection and intelligently routing data based on the provided configuration. The publisher can either directly target a specific queue or route messages through an exchange, relying on routing keys to determine the message's final destination. Furthermore, the publisher evaluates each individual data item for embedded metadata—such as content types, expiration times, and custom headers. By reading these properties from the item's `MetaData`, the publisher dynamically adapts its message properties on a per-message basis, allowing for a highly flexible and varied message stream without altering the static connection parameters.

**Table Property Path** - `Sessions[].Publishers[].RabbitMq`

```yaml
RabbitMq: {}
```

## KafkaTopic

Publishes messages to a Kafka topic. The underlying mechanism focuses on high-throughput, sequential message appending. The publisher manages Kafka connections, partitions, and producer queues, optimizing data transmission through configurable batching and compression algorithms. It evaluates each data item's metadata to determine if a specific key should be used for partitioning, enabling strict ordering guarantees for messages belonging to the same key. The logic also incorporates retry mechanisms to gracefully handle temporary broker unavailability or network partitions.

**Table Property Path** - `Sessions[].Publishers[].KafkaTopic`

```yaml
KafkaTopic: {}
```

## Redis

Publishes messages to a Redis cache or datastore. Unlike message brokers that simply route or store streams of data, the Redis publisher interacts with specific data structures in the Redis ecosystem. Depending on the configured data type, the publisher's logic translates the provided data items into appropriate Redis commands, such as adding elements to a set, pushing items to a list, or setting string keys. It inherently supports batch operations to reduce network round trips and can be tuned with various command flags to optimize performance, such as preferring master nodes or operating in a fire-and-forget manner.

**Table Property Path** - `Sessions[].Publishers[].Redis`

```yaml
Redis: {}
```

!!! Notice "Batch Publishing"
    Redis publisher uses batch publishing by default. When `BatchSize` is `1`, it behaves like single-message publishing. When batch publishing is enabled, policies apply per batch rather than per message.

## OracleSqlTable

Publishes messages to an Oracle SQL database table. The core logic entails translating structured or semi-structured data items into relational database inserts. The publisher manages the lifecycle of the database connection, constructs the necessary SQL commands, and handles the execution against the Oracle instance. It is built to accommodate database-specific constraints and timeouts, ensuring that large data volumes or complex insertion operations do not indefinitely block the execution pipeline.

**Table Property Path** - `Sessions[].Publishers[].OracleSqlTable`

```yaml
OracleSqlTable: {}
```

## MsSqlTable

Publishes messages to a Microsoft SQL Server database table. The publisher functions by converting incoming data streams into relational records and performing insertions against the target table. Its internal logic is optimized to handle standard data types and can also manage complex User-Defined Types (UDT) if required by the schema. By leveraging connection pooling and configurable command timeouts, it provides a resilient pathway for moving large datasets into MS SQL environments while maintaining transactional integrity.

**Table Property Path** - `Sessions[].Publishers[].MsSqlTable`

```yaml
MsSqlTable: {}
```

## PostgreSqlTable

Publishes messages to a PostgreSQL database table. The publisher's logic centers around mapping JSON-like structures or objects directly into PostgreSQL's relational schema. It maintains the database connection and efficiently executes insert operations. It is designed to work seamlessly with PostgreSQL's data types, ensuring that fields in the source data accurately populate the corresponding columns in the target table, while also gracefully handling connection timeouts during high-load scenarios.

**Table Property Path** - `Sessions[].Publishers[].PostgreSqlTable`

```yaml
PostgreSqlTable: {}
```

## MongoDbCollection

Publishes documents to a MongoDB collection. The core logic involves taking structured data items and seamlessly mapping them into BSON documents, which are the native format for MongoDB. The publisher handles the complexities of connecting to the MongoDB cluster, selecting the appropriate database and collection, and executing the insertion commands. Because MongoDB is a NoSQL store, this publisher is particularly adept at handling varying data structures and complex nested objects without the need for strict schema definitions.

**Table Property Path** - `Sessions[].Publishers[].MongoDbCollection`

```yaml
MongoDbCollection: {}
```

## S3Bucket

Publishes messages to an Amazon S3 bucket. The underlying mechanism focuses on object storage rather than streaming messages or relational records. The publisher groups data or takes individual files and streams them securely into the configured S3 bucket. It manages the complexities of S3 addressing, region endpoints, and authentication. A key aspect of its logic is handling object naming—either through sequential numerical series or random GUIDs—and selecting the appropriate storage class to balance availability requirements with cost considerations.

**Table Property Path** - `Sessions[].Publishers[].S3Bucket`

```yaml
S3Bucket: {}
```

## ElasticIndex

Publishes documents to an Elasticsearch index. The publisher's logic is specifically tailored for high-speed document ingestion and indexing. It automatically formats the data items into the required JSON structure and typically leverages Elasticsearch's Bulk API to group multiple document updates into single network requests, drastically improving ingestion rates. The publisher also handles the complexities of index targeting, automatically creating indices if they do not exist, and managing the HTTP connections to the Elasticsearch cluster.

**Table Property Path** - `Sessions[].Publishers[].ElasticIndex`

```yaml
ElasticIndex: {}
```

!!! warning "ElasticSearch server timeout"
    When sending requests to the Elasticsearch server, remember that it can enforce its own request timeout. If increasing `RequestTimeoutMilliseconds` does not help, the server-side timeout may still be the limiting factor.

## Socket

Publishes messages directly over a TCP or UDP socket to a remote host. The core logic bypasses higher-level application protocols (like HTTP or AMQP) and works directly with the transport layer. The publisher serializes data into raw byte payloads and transmits them over the established socket connection. This provides maximum flexibility and lowest possible latency, giving the user direct control over network-level behaviors such as buffer sizes, the Nagle algorithm (for TCP), and socket lingering behavior.

**Table Property Path** - `Sessions[].Publishers[].Socket`

```yaml
Socket: {}
```

## Sftp

Publishes files to a remote server using the SFTP protocol. The publisher's logic involves establishing a secure, encrypted SSH connection to the target machine and navigating to the specified directory path. It then treats the incoming data as file content, securely transferring it over the network and creating new files on the remote filesystem. The publisher automates the file naming process, using configurable prefixes and generators (like numerical series or GUIDs) to ensure each uploaded file has a unique identity.

**Table Property Path** - `Sessions[].Publishers[].Sftp`

```yaml
Sftp: {}
```
