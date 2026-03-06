# Code Configuration Reference

The code API mirrors the YAML model closely. If you know the builder names, the code surface is predictable.

## Entry Points

| Type | Use it for |
| --- | --- |
| `Bootstrap.New(args)` | Normal startup with CLI parsing and file loading |
| `ExecutionBuilder` | Root in-memory execution model |
| `Runner.ExecutionBuilders` | Add one or more executions before calling `Run()` |

## Root Builder

`ExecutionBuilder` exposes:

- `AddDataSource`
- `AddSession`
- `AddAssertion`
- `AddStorage`
- `AddLink`
- `WithMetadata`
- `SetCase`
- `SetExecutionId`
- `ExecutionType`

Use one `ExecutionBuilder` per logical run configuration.

## Data Sources

`DataSourceBuilder` maps directly to the YAML `DataSources` entries.

| Method | Effect |
| --- | --- |
| `Named` | Sets `Name` |
| `HookNamed` | Sets `Generator` |
| `Configure` | Sets `GeneratorConfiguration` |
| `AddDataSourceName` | Adds named upstream dependencies |
| `AddDataSourcePattern` | Adds regex-based upstream dependencies |
| `WithSerializer` | Sets `Serialize` |
| `WithDeserializer` | Sets `Deserialize` |
| `IsLazy` | Sets `Lazy = true` |

## Sessions and Actions

`SessionBuilder` is the coordination point.

| Method | Effect |
| --- | --- |
| `Named` | Sets `Name` |
| `WithTimeoutBefore` / `WithTimeoutAfter` | Session-level delays |
| `AtStage` | Sets the session stage and a default run-until boundary |
| `RunSessionUntilStage` | Limits stage execution |
| `DiscardData` | Sets `SaveData = false` |
| `WithinCategory` | Sets `Category` |
| `AddPublisher`, `AddConsumer`, `AddTransaction`, `AddProbe`, `AddCollector`, `AddMockerCommand` | Adds actions |
| `AddStage` | Adds per-stage timeout overrides |

### Publishers

`PublisherBuilder` supports naming, iterations, looping, sleep, data source selection, serializer selection, policy chaining, and one concrete protocol configuration.

### Consumers

`ConsumerBuilder` supports naming, timeout, deserializer selection, policy chaining, and one concrete protocol configuration.

### Transactions

`TransactionBuilder` adds two important concepts beyond publishers and consumers:

- `WithTimeout` for request/response timing
- separate `WithSerializer` and `WithDeserializer` for request and response bodies

### Probes

`ProbeBuilder` is intentionally small:

- `Named`
- `HookNamed`
- `AtStage`
- `AddDataSourceName`
- `AddDataSourcePattern`
- `Configure`

### Collectors

`CollectorBuilder` is used when the test also needs observability evidence:

- `Named`
- `FilterData`
- `CollectInRange`
- `Configure`

### Mocker commands

`MockerCommandBuilder` handles controlled runtime changes against `QaaS.Mocker`:

- `Named`
- `AtStage`
- `WithServerName`
- `WithRedis`
- `WithRequestDurationMs`
- `WithRequestRetries`
- `WithCommand`

## Assertions

`AssertionBuilder` maps to report-producing checks.

| Method | Effect |
| --- | --- |
| `Named` | Sets the report-visible assertion name |
| `HookNamed` | Sets the assertion hook type |
| `AddSessionName` / `AddSessionPattern` | Selects sessions |
| `AddDataSourceName` / `AddDataSourcePattern` | Selects extra data sources |
| `Configure` | Sets `AssertionConfiguration` |
| `WithCategory` | Sets `Category` |
| `WithSeverity` | Sets report severity |
| `WeatherToSaveSessionData` | Controls session data attachments |
| `WeatherToSaveAttachments` | Controls hook attachments |
| `WeatherToSaveConfigurationTemplate` | Controls rendered template attachment |
| `WeatherToDisplayTrace` | Controls assertion trace visibility |
| `ReportOnlyStatuses` | Filters which statuses are emitted |
| `AddLink` | Adds assertion-specific observability links |

## Storage and Links

`StorageBuilder` supports:

- `WithJsonStorageFormat`
- `Configure`

`LinkBuilder` supports:

- `Named`
- `Configure`

Each of those builders can only hold one active concrete configuration at a time.

## Code vs YAML

Prefer code when:

- the configuration is generated from other data
- you want reusable helper methods or domain-specific test factories
- the same test logic would otherwise require many large case overlays

Prefer YAML when:

- the test is mostly fixed configuration
- reviewers need to scan the test shape quickly
- environment overlays and case files are enough
