# QaaS.Framework

`QaaS.Framework` is a solution of shared runtime packages used by the QaaS applications and hook implementations. It is not a single executable application. In `QaaS.Framework.sln`, the code is split into eight runtime projects and seven companion test projects so that configuration, execution flow, protocols, hook discovery, policies, and serialization can evolve independently.

This section documents the current contents of those projects as they exist in the solution today.

## Runtime projects

| Project | What it contains | Companion test project |
| --- | --- | --- |
| [QaaS.Framework.SDK](./projects/sdk.md) | Core runtime contracts and object model: contexts, execution data, session and communication objects, data sources, hook interfaces and base classes, metadata, filters, and helper extensions. | `QaaS.Framework.SDK.Tests` |
| [QaaS.Framework.Configurations](./projects/configuration.md) | Configuration loading pipeline: YAML ingestion, HTTP YAML sources, placeholder resolution, `<<` collapse handling, reference expansion, recursive binding, recursive validation, and partial-update helpers. | `QaaS.Framework.Configurations.Tests` |
| [QaaS.Framework.Executions](./projects/executions.md) | Shared execution infrastructure: `IRunner`, `BaseExecution`, `BaseExecutionBuilder`, loader and logging support, CLI parser builders, and help-text generation. | `QaaS.Framework.Executions.Tests` |
| [QaaS.Framework.Infrastructure](./projects/infrastructure.md) | Small shared utility package containing date and time helpers, filesystem-safe naming, and `IDomainBuilder<T>`. | No dedicated test project in the solution |
| [QaaS.Framework.Policies](./projects/policies.md) | Policy chain implementation for count, timeout, and load-control behavior, including staged and increasing load-balance policies plus their configuration objects. | `QaaS.Framework.Policies.Tests` |
| [QaaS.Framework.Protocols](./projects/protocols.md) | Protocol contracts, protocol-specific configuration objects, factories, and concrete integrations for HTTP, gRPC, RabbitMQ, Kafka, Redis, S3, SFTP, SQL, Elastic, Prometheus, IBM MQ, MongoDB, and sockets. | `QaaS.Framework.Protocols.Tests` |
| [QaaS.Framework.Providers](./projects/providers.md) | Hook discovery and instantiation layer: assembly scanning, type resolution, object creation, validation-aware loading, and Autofac registration. | `QaaS.Framework.Providers.Tests` |
| [QaaS.Framework.Serialization](./projects/serialization.md) | Serializer and deserializer selection, format-specific implementations, factory classes, and runtime type resolution helpers. | `QaaS.Framework.Serialization.Tests` |

## Companion test projects

The solution also includes one sibling test project for every runtime package except Infrastructure:

- `QaaS.Framework.Configurations.Tests` exercises the configuration pipeline, including placeholders, collapse parsing, reference expansion, recursive validation, update helpers, and HTTP YAML loading.
- `QaaS.Framework.Executions.Tests` covers loader validation, parser behavior, help-text output, logging configuration, elastic-sink warnings, and the base execution contracts.
- `QaaS.Framework.SDK.Tests` covers context building, binding, data and session helpers, data-source behavior, hook configuration loading, and session serialization.
- `QaaS.Framework.Serialization.Tests` verifies factory dispatch, round-trip serialization, type-resolution behavior, and guarded deserialization paths.
- `QaaS.Framework.Providers.Tests` validates hook discovery, name resolution, ambiguity handling, context injection, validation error enrichment, and Autofac registration.
- `QaaS.Framework.Protocols.Tests` covers protocol configuration objects, factory dispatch, protocol-specific behavior, SQL helpers, HTTP and S3 flows, and Prometheus parsing.
- `QaaS.Framework.Policies.Tests` covers policy ordering, stop behavior, builder mapping, timeout and count limits, and staged or increasing load progression.

Use the project pages in this section for the package-level detail. Each page focuses on what the current source tree contains and how the sibling tests describe the intended behavior.
