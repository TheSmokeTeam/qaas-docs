# Architecture and Data Flow

## Workspace Layout

The workspace is split by concern, not by deployment unit.

| Repo | Primary job | Used directly by |
| --- | --- | --- |
| [QaaS.Runner]([[repo:runner]]) | CLI entrypoint, execution loading, reporting, storage, session orchestration | Test projects |
| [QaaS.Framework]([[repo:framework]]) | Shared SDK contracts, configuration loading, protocol adapters, policies, serialization | Runner, mocker, hook libraries |
| [QaaS.Mocker]([[repo:mocker]]) | Mock runtime for HTTP, gRPC, and socket protocols | Tests that need controllable downstreams |
| [QaaS.Common.Assertions]([[repo:assertions]]) | Off-the-shelf assertion hooks | Runner test projects |
| [QaaS.Common.Generators]([[repo:generators]]) | Data generators and test data loaders | Runner test projects |
| [QaaS.Common.Probes]([[repo:probes]]) | Side-effect hooks for setup, teardown, and platform control | Runner test projects |
| [QaaS.Common.Processors]([[repo:processors]]) | Reusable transaction processors for mock stubs | Mocker |
| [QaaS.Mocker.CommunicationObjects]([[repo:mocker-communication-objects]]) | Redis command contracts between runner and mocker | Runner, mocker |

## Runner-Centric Flow

```text
test.qaas.yaml or C# builders
  -> ContextBuilder loads base config
  -> overwrite files merge in order
  -> case file merges before or after references
  -> command-line overwrite arguments apply
  -> references are expanded into root lists
  -> environment variables optionally override the final configuration
  -> ExecutionBuilder binds DataSources, Sessions, Storages, Assertions, Links, MetaData
  -> QaaS.Runner builds protocol actions and hook instances
  -> sessions produce session data
  -> assertions evaluate that data
  -> reporters write Allure output
  -> storages optionally persist session data for act/assert workflows
```

## Where Each Piece Fits

### Test authors

You mostly touch:

- `test.qaas.yaml`
- `Variables/*.yaml`
- `Cases/*.yaml`
- custom hook classes in your test project
- `Program.cs` only when you want configuration as code

### Runner internals

The core user-facing types are:

- `Bootstrap` for CLI or embedded startup
- `RunLoader` and `ExecuteLoader` for turning CLI input into executions
- `ExecutionBuilder` for the full test model
- `SessionBuilder`, `PublisherBuilder`, `ConsumerBuilder`, `TransactionBuilder`, `ProbeBuilder`, `CollectorBuilder`, and `MockerCommandBuilder`

### Optional mock path

If the system under test depends on services you do not want to call for real:

1. Start `QaaS.Mocker` with `mocker.qaas.yaml`.
2. Define transaction stubs backed by processors.
3. Point your test session at the mock endpoints.
4. Use runner mocker commands when the stub behavior has to change mid-test.

## Design Consequences

- QaaS is configuration-heavy on purpose. Most changes should stay in YAML and hook classes, not in runner internals.
- Protocol configuration is explicit. A publisher, consumer, transaction, storage, or link can have only one active block at a time.
- Hooks are late-bound by name. If the configured hook name and the compiled class name drift apart, builds succeed but execution fails at runtime.
- Cases are first-class. They are not test data files; they are configuration overlays that fan one base test out into many runnable variants.
