# QaaS.Framework

The `QaaS.Framework` is a comprehensive, modular C# ecosystem designed to standardize and streamline the development,
execution, and management of data-driven workflows, particularly in testing, integration, and automation scenarios. It
provides a consistent architecture for defining, configuring, and running complex execution pipelines with strong
support for configuration, dependency injection, logging, data handling, and extensibility.

The framework is composed of several interconnected projects, each serving a distinct purpose:

| Project                                                             | Description                                                                                                                                                                                                                                                       |
|---------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [**`QaaS.Framework.SDK`**](./projects/sdk.md)                       | The core package containing shared data structures (`Context`, `Data`,  `SessionData`, etc.) and the base classes for all hooks (`Assertion`, `Generator`, `Probe`, `Processor`). It's required by all plugins and serves as the foundation for interoperability. |
| [**`QaaS.Framework.Configuration`**](./projects/configuration.md)   | Handles loading and validating configuration from YAML files using `DataAnnotations`. It supports advanced features like YAML `<<` merge keys and provides utilities for robust configuration management.                                                         |
| [**`QaaS.Framework.Executions`**](./projects/executions.md)         | The core execution engine, responsible for orchestrating workflows. It defines the lifecycle via `IRunner`, `BaseExecution`, and `ILogic`, enabling composable, testable, and configurable execution logic with support for test and mock modes.                  |
| [**`QaaS.Framework.Infrastructure`**](./projects/infrastructure.md) | Provides essential utility extensions for `DateTime` (with timezone and daylight saving handling) and file system operations (e.g., creating valid directory names), used throughout the ecosystem.                                                               |
| [**`QaaS.Framework.Policies`**](./projects/policies.md)             | Defines a flexible policy system for controlling communication actions, such as `Timeout`, `LoadBalance`, `AdvancedLoadBalance`, and `IncreasingLoadBalance`, enabling sophisticated load and timing control.                                                     |
| [**`QaaS.Framework.Protocols`**](./projects/protocols.md)           | Offers a unified, type-safe abstraction for interacting with diverse data sources and services (e.g., Kafka, S3, PostgreSQL, HTTP, gRPC). It uses interfaces like `IReader`, `ISender`, and `ITransactor` to enable consistent data flow across protocols.        |
| [**`QaaS.Framework.Providers`**](./projects/providers.md)           | Enables dynamic loading and registration of hooks (e.g., `IAssertion`, `IGenerator`) from the main application and loaded plugins (DLLs), using Autofac for dependency injection and providing validation during load.                                            |
| [**`QaaS.Framework.Serialization`**](./projects/serialization.md)   | Provides a suite of serialization/deserialization capabilities (Binary, JSON, XML, MessagePack, YAML, Protobuf) used across the framework for data persistence and communication.                                                                                 |

> Together, these projects form a cohesive, extensible, and robust foundation for building scalable and maintainable data
integration and testing solutions.