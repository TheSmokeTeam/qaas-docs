# QaaS.Framework.Protocols

`QaaS.Framework.Protocols` is a library within the QaaS framework designed to abstract and simplify
communication with a wide variety of data sources, sinks, and services. It provides a consistent, type-safe, and highly
configurable interface for reading, writing, and transacting data across diverse protocols, enabling seamless
integration into data pipelines, ETL processes, and real-time data applications.

## Core Philosophy

The library is built around the principle of **protocol abstraction**. Instead of writing custom, brittle code for each
data system (e.g., connecting to Kafka, querying PostgreSQL, sending to S3), developers interact with a unified set of
interfaces. This promotes:

* **Reusability:** A single `Data<object>` object can be sent to Kafka, S3, or a database with minimal configuration
  changes.
* **Maintainability:** Protocol-specific logic is encapsulated within dedicated classes, making the codebase easier to
  understand and update.
* **Flexibility:** The framework supports a vast array of protocols, allowing it to adapt to almost any data integration
  need.

## Key Components

### **Interfaces: The Contract**

The library defines a set of core interfaces that all protocol implementations must adhere to. These interfaces
establish a consistent contract for data flow.

* `IReader`: For consuming data from a source (e.g., Kafka, S3, SQL table). It defines the `Read` method.
* `ISender`: For sending data to a destination (e.g., SFTP, HTTP, Redis). It defines the `Send` method.
* `IChunkReader` / `IChunkSender`: For handling data in batches (chunks), which is crucial for performance with large
  datasets (e.g., S3, ElasticSearch).
* `IFetcher`: For pulling data from a source at a specific time (e.g., Prometheus metrics).
* `ITransactor`: For performing a request-response interaction, where a request is sent and a response is received (
  e.g., HTTP, gRPC).

### **Protocol Implementations: The Workhorses**

The library ships with numerous concrete implementations for popular data protocols. Each implementation is a class that
inherits from one or more of the core interfaces and handles the specific details of that protocol.

| Protocol                                                         | Use Case                                              | Key Features                                                                                                                                                                        |
|:-----------------------------------------------------------------|:------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **SocketProtocol**                                               | Low-level TCP/UDP communication                       | Configurable address family, socket type, and protocol. Supports timeouts and buffer sizes.                                                                                         |
| **TrinoSqlProtocol**                                             | Querying data from Trino                              | Uses the Trino ADO.NET driver. Supports complex SQL queries with filtering and time-based queries.                                                                                  |
| **SftpProtocol**                                                 | Secure file transfer via SFTP                         | Uploads files to a remote server.                                                                                                                                                   |
| **S3Protocol**                                                   | Interacting with Amazon S3 (or S3-compatible) storage | Reads and writes objects to S3 buckets. Includes sophisticated retry mechanisms and a `WaitUntilConsumptionTimeoutIsReached` method to ensure data is fully written before reading. |
| **RedisProtocol**                                                | Sending data to Redis                                 | Supports multiple Redis data types (strings, lists, sets, hashes, sorted sets, geospatial). Uses transactions for atomic batch operations.                                          |
| **RabbitMqProtocol**                                             | Messaging with RabbitMQ                               | Implements both reading from and sending to queues/exchanges. Supports advanced features like message headers, expiration, and routing keys.                                        |
| **PrometheusProtocol**                                           | Fetching metrics from Prometheus                      | Uses the Prometheus `query_range` API to collect time-series data. Returns data in a structured format.                                                                             |
| **PostgreSqlProtocol**, **MsSqlProtocol**, **OracleSqlProtocol** | Connecting to relational databases                    | Extends `BaseSqlProtocol` for common SQL operations. Supports bulk inserts, custom queries, and time-based filtering.                                                               |
| **KafkaTopicProtocol**                                           | Messaging with Apache Kafka                           | Consumes and produces messages to Kafka topics. Supports SASL authentication, compression, and partitioning.                                                                        |
| **MongoDbProtocol**                                              | Interacting with MongoDB                              | Sends JSON data to a MongoDB collection. Uses the `BsonDocument` model for efficient serialization.                                                                                 |
| **IbmMqProtocol**                                                | Interacting with IBM MQ                               | Uses the IBM.WMQ library to read messages from a queue.                                                                                                                             |
| **HttpProtocol**                                                 | Making HTTP requests                                  | A full-featured transactor for HTTP(S) calls. Supports JWT authentication, custom headers, and configurable retry logic.                                                            |
| **GrpcProtocol**                                                 | Calling gRPC services                                 | Transacts with gRPC servers using protobuf messages. Supports timeouts and error handling.                                                                                          |
| **ElasticProtocol**                                              | Interacting with Elasticsearch                        | Reads and writes data to Elasticsearch indices. Uses the `scroll` API for large data reads and includes a method to empty indices.                                                  |

### **Configuration Objects**

Each protocol is configured via a dedicated configuration class (e.g., `S3BucketSenderConfig`,
`KafkaTopicReaderConfig`). These classes are populated from
configuration files (like JSON or code). They encapsulate all the necessary connection
details (host, port, credentials) and protocol-specific settings (e.g., `Retries`, `TimeoutMs`, `CompressionType`).

### **Data Model: `Data<object>` and `DetailedData<object>`**

The library uses a standardized data model to represent information being transferred.

* `Data<object>`: The core data container. It holds the `Body` (the actual data, typically as `byte[]` or `JsonObject`),
  `MetaData` (protocol-specific context like `Http`, `Kafka`, `Redis`, `S3`), and `Timestamp`.
* `DetailedData<object>`: A richer version of `Data<object>` that includes a `Timestamp` and is used for return values
  from `Read` and `Send` operations.

### **Extensibility**

The framework is designed to be easily extended. Developers can:

1. **Create a new Protocol:** Implement one of the core interfaces (e.g., `IReader`) and inject it into the system.
2. **Extend Existing Protocols:** Inherit from an existing protocol class (like `BaseSqlProtocol`) to add custom
   behavior for a specific database.
3. **Add New Configuration Objects:** Define a new configuration class to manage the settings for a new protocol.
