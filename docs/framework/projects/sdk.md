# QaaS.Framework.SDK

`QaaS.Framework.SDK` is the main runtime-contract package in the Framework solution. It defines the object model that the rest of QaaS works with: contexts, execution data, sessions, communications, data sources, hook contracts, hook base classes, metadata, and helper extensions. Any hook package that integrates with the Framework depends on this package because it is the shared vocabulary for the runtime.

## What this project contains

### Context and execution state

The context layer lives under `ContextObjects` and `ExecutionObjects`:

- `BaseContext.cs`
- `Context.cs`
- `InternalContext.cs`
- `ContextBuilder.cs`
- `Bind.cs`
- `ExecutionData.cs`
- `ExecutionType.cs`
- `IExecutionData.cs`
- `MetaDataConfig.cs`

`ContextBuilder` is the package's composition point for runtime configuration. It layers the base configuration file, overwrite files, overwrite folders, command-line overwrite arguments, optional case configuration, reference resolution, optional environment-variable resolution, execution id, logger, and running-session state into a final `InternalContext`.

`Bind.cs` is the bridge back from configuration to typed objects. It binds from `context.RootConfiguration`, reapplies default values into the configuration tree when needed, and validates the bound object before handing it back to the caller.

### Data sources

The `DataSourceObjects` folder contains:

- `DataSource.cs`
- `DataSourceBuilder.cs`

`DataSource` is the runtime object used when the framework needs to retrieve or reuse data. `DataSourceBuilder` is the configuration and fluent-builder shape for constructing those sources. It supports serializer and deserializer metadata, dependency selection by name or regex, and YAML-friendly configuration output.

### Session, communication, and metadata model

The `Session` folder contains the runtime data model that most hooks and protocols work with:

- `DataObjects/`
- `CommunicationDataObjects/`
- `SessionDataObjects/`
- `MetaDataObjects/`
- `DataFilter.cs`
- `SessionDataSerialization.cs`

Key runtime types in this area include:

- `Data<T>`
- `DetailedData<T>`
- `CommunicationData<T>`
- `RunningCommunicationData<T>`
- `SessionData`
- `RunningSessionData`
- `RunningSessions`
- `MetaData` and protocol-specific metadata records such as HTTP, Kafka, RabbitMQ, Redis, and storage metadata

`ExecutionData.cs` is the package's execution-state container. It currently holds `DataSources`, `SessionDatas`, and `AssertionResults`.

### Hooks

The hook system lives under `Hooks`:

- `IHook.cs`
- `Assertion/`
- `Generator/`
- `Probe/`
- `Processor/`
- `BaseHooks/StatusCodeTransactionProcessor.cs`

The current hook families are:

- `IAssertion` and `BaseAssertion<TConfiguration>`
- `IGenerator` and `BaseGenerator<TConfiguration>`
- `IProbe` and `BaseProbe<TConfiguration>`
- `IProcessor`
- `ITransactionProcessor` and `BaseTransactionProcessor<TConfiguration>`

The transaction-processor path is important. The current SDK does not expose the old `BaseProcessor<TConfiguration>` shape that some stale docs referenced. The built-in `StatusCodeTransactionProcessor` is also part of the package and provides a ready-made processor for status-code-oriented responses.

### Filters and extensions

The package contains supporting helpers under:

- `ConfigurationObjectFilters/NameFilters.cs`
- `ConfigurationObjectFilters/RegexFilters.cs`
- `Extensions/`

These files provide common filtering and lookup helpers for sessions, communications, data sources, and context objects, plus logging helpers that enrich log messages with runtime metadata.

## Current behavior

The current implementation provides the following runtime behavior:

- `ContextBuilder` layers configuration in a deterministic order and can optionally resolve environment-variable placeholders as part of the final build.
- `ContextBuilder` also resolves configuration references before the context is finalized.
- `InternalContext` exposes internal-only state such as the running-session registry and the global dictionary access used inside the framework.
- `ExecutionType` currently includes `Run`, `Template`, `Act`, and `Assert`.
- `DataSourceBuilder` supports configuration CRUD aliases, named or regex-based source dependencies, serializer and deserializer configuration, and YAML serialization of the builder state.
- `DataSource` supports cached and lazy retrieval behavior depending on how it is configured.
- The hook base classes load their configuration from the root configuration and validate it through the shared configuration package.
- `SessionDataSerialization` serializes and deserializes session and communication payloads by using the Serialization package's factories and `SpecificTypeConfig`.
- The extension methods cover casting, filtering, lookup, metadata-path access, and logging enrichment across the runtime data model.

## Main source areas

The highest-signal areas to read are:

- `ContextObjects/`
- `ExecutionObjects/`
- `DataSourceObjects/`
- `Hooks/`
- `Session/`
- `ConfigurationObjectFilters/`
- `Extensions/`
- `MetaDataConfig.cs`

## Companion tests

`QaaS.Framework.SDK.Tests` is the sibling test project for this package.

The current tests cover:

- context-builder overwrite and environment-resolution paths
- binding and validation behavior
- data and communication casting helpers
- data filtering and lookup helpers
- running-session access and global dictionary behavior
- data-source lazy versus cached behavior
- serializer and deserializer guardrails for session data
- raw and typed session serialization paths
- `DataSourceBuilder` configuration CRUD aliases and dependency wiring
- the built-in `StatusCodeTransactionProcessor`

Representative test files include:

- `SDKBehaviorTests.cs`
- `SDKCoverageEdgeCaseTests.cs`
- `SDKSerializationCoverageTests.cs`
- `BuildersTests/DataSourceBuilderTests.cs`
