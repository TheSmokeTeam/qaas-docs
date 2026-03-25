# QaaS.Framework.Protocols

`QaaS.Framework.Protocols` is the Framework solution's integration package for external I/O. It combines protocol contracts, protocol-specific configuration objects, concrete implementations, factories, and supporting utilities. The project consumes the shared session and data model from [QaaS.Framework.SDK](./sdk.md) and turns those objects into real reads, sends, fetches, and request-response interactions.

## What this project contains

### Protocol contracts

The core contracts live directly under the `Protocols` folder:

- `IReader.cs`
- `ISender.cs`
- `IChunkReader.cs`
- `IChunkSender.cs`
- `IFetcher.cs`
- `ITransactor.cs`
- `IConnectable.cs`

These interfaces divide the integration surface into single-item reads and sends, chunk-based reads and sends, fetch-style reads, and request-response transactions.

### Configuration-object families

The `ConfigurationObjects` folder is a major part of the package. It contains both the common protocol interfaces and the protocol-specific configuration families:

- common interfaces such as `IReaderConfig`, `ISenderConfig`, `IFetcherConfig`, `ITransactorConfig`, and object-naming configuration
- `Elastic/`
- `Grpc/`
- `Http/`
- `IbmMq/`
- `Kafka/`
- `MongoDb/`
- `Prometheus/`
- `RabbitMq/`
- `Redis/`
- `S3/`
- `Sftp/`
- `Socket/`
- `Sql/`

The factories switch on these concrete configuration types. In practice, this package is not using a generic registry for protocols. The configuration type is what determines which runtime class gets created.

### Concrete protocol implementations

The `Protocols` folder contains the package's concrete integrations, including:

- `HttpProtocol.cs`
- `GrpcProtocol.cs`
- `RabbitMqProtocol.cs`
- `KafkaTopicProtocol.cs`
- `RedisProtocol.cs`
- `RedisReaderProtocol.cs`
- `S3Protocol.cs`
- `SftpProtocol.cs`
- `SocketProtocol.cs`
- `IbmMqProtocol.cs`
- `MongoDbProtocol.cs`
- `ElasticProtocol.cs`
- `PrometheusProtocol.cs`
- `PostgreSqlProtocol.cs`
- `MsSqlProtocol.cs`
- `OracleSqlProtocol.cs`
- `TrinoSqlProtocol.cs`
- `BaseSqlProtocol.cs`

These implementations use SDK types such as `DataFilter`, `Data<T>`, `DetailedData<T>`, `CommunicationData<T>`, and protocol metadata. Those types belong to the SDK package; Protocols uses them but does not define them.

### Factories

The `Protocols/Factories` folder contains the dispatch layer:

- `ReaderFactory.cs`
- `SenderFactory.cs`
- `FetcherFactory.cs`
- `TransactorFactory.cs`

This is where the package turns configuration objects into concrete protocol instances.

### Utilities and extensions

The package also contains supporting code under:

- `Utils/ObjectNameGenerator.cs`
- `Utils/S3Utils/`
- `Extentions/HttpExtentions.cs`
- `Extentions/S3Extentions.cs`

These files support naming strategies, S3 client behavior, and protocol-specific helpers.

## Current behavior

The current source tree supports the following dispatch and behavior:

- `ReaderFactory` creates singular readers for RabbitMQ, Kafka, Socket, IBM MQ, and Redis.
- `ReaderFactory` creates chunk readers for PostgreSQL, Oracle, MS SQL, Trino, Elastic, and S3.
- `SenderFactory` chooses a singular or chunk sender by configuration type and by the explicit `isChunkable` flag.
- `SenderFactory` supports chunk sends for Redis, MS SQL, MongoDB, Elastic, and PostgreSQL.
- `SenderFactory` supports singular sends for RabbitMQ, Kafka, SFTP, Socket, S3, Oracle, and PostgreSQL.
- `TransactorFactory` currently supports HTTP and gRPC.
- `FetcherFactory` currently supports Prometheus.
- `DataFilter` is applied where large-payload filtering matters, especially in S3 and Elastic flows.
- `HttpProtocol` implements HTTP request-response behavior including headers, authentication, JWT support, retries, and response metadata handling.
- `GrpcProtocol` performs gRPC invocation through the package's reflection-driven flow.
- `S3Protocol` handles object naming, retry-oriented reads, and bucket/object management behavior.
- `ObjectNameGenerator` supports the package's naming strategies such as random GUIDs and growing numerical series.

## Main source areas

The highest-signal areas to read are:

- `ConfigurationObjects/`
- `Protocols/`
- `Protocols/Factories/`
- `Utils/ObjectNameGenerator.cs`
- `Utils/S3Utils/`

If you want the fastest route through the package, start with the relevant configuration type, then the factory, then the protocol implementation that factory returns.

## Companion tests

`QaaS.Framework.Protocols.Tests` is the sibling test project for this package.

The current tests cover:

- protocol-configuration validation
- factory dispatch and unsupported-configuration failures
- SQL helper behavior
- HTTP request-response paths
- gRPC invocation behavior
- S3 retry and bucket-read behavior
- Prometheus matrix parsing and error handling
- Redis send and read behavior
- additional integration and edge-case coverage across the protocol families

Representative test files include:

- `ProtocolBehaviorTests.cs`
- `ProtocolAdvancedBehaviorTests.cs`
- `BaseSqlTests.cs`
- `ProtocolConfigurationObjectsTests.cs`
- `ProtocolCoverageEdgeCaseTests.cs`
- `ProtocolIntegrationCoverageTests.cs`
