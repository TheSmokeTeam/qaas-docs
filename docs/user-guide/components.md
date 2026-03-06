# Workspace Components

This is the shortest path to understanding what each repository is for and when you should touch it.

## Test Authoring Stack

| Repo or package | Use it for | Typical touch points |
| --- | --- | --- |
| [QaaS.Runner]([[repo:runner]]) / [NuGet]([[nuget:QaaS.Runner]]) | Running tests, loading config, reports, storages | `test.qaas.yaml`, `Program.cs`, CLI |
| [QaaS.Common.Assertions]([[repo:assertions]]) / [NuGet]([[nuget:QaaS.Common.Assertions]]) | Reusable assertions such as hermeticity, delay, output schema, HTTP status | `Assertions:` |
| [QaaS.Common.Generators]([[repo:generators]]) / [NuGet]([[nuget:QaaS.Common.Generators]]) | Reusable data loaders and generators such as file system, S3, session-derived, JSON generation | `DataSources:` |
| [QaaS.Common.Probes]([[repo:probes]]) / [NuGet]([[nuget:QaaS.Common.Probes]]) | Reusable probes for Kubernetes/OpenShift, RabbitMQ, Redis, S3, SQL side effects | `Probes:` |

## Runtime and Extension Stack

| Repo or package | Use it for | Typical touch points |
| --- | --- | --- |
| [QaaS.Framework]([[repo:framework]]) | Shared SDK, policies, config loading, protocols, serialization | Custom hooks, runner internals, mocker internals |
| [QaaS.Mocker]([[repo:mocker]]) / [NuGet]([[nuget:QaaS.Mocker]]) | HTTP, gRPC, and socket mock runtime | `mocker.qaas.yaml`, stub processors |
| [QaaS.Common.Processors]([[repo:processors]]) / [NuGet]([[nuget:QaaS.Common.Processors]]) | Reusable mocker transaction processors | `Stubs:` in mocker config |
| [QaaS.Mocker.CommunicationObjects]([[repo:mocker-communication-objects]]) / [NuGet]([[nuget:QaaS.Mocker.CommunicationObjects]]) | Shared runner-mocker command contracts | Only when extending mocker commands |

## What Is Inside QaaS.Framework

| Package | Why it matters |
| --- | --- |
| `QaaS.Framework.Configurations` | YAML loading, placeholders, overwrite handling, references, validation |
| `QaaS.Framework.Executions` | Shared execution and logger option infrastructure |
| `QaaS.Framework.SDK` | Hook contracts, context objects, data source objects, session data model |
| `QaaS.Framework.Protocols` | RabbitMQ, Kafka, HTTP, gRPC, Redis, S3, SQL, socket and other protocol config/runtime adapters |
| `QaaS.Framework.Policies` | Count, timeout, load-balance, advanced staged load control |
| `QaaS.Framework.Serialization` | Serializer and deserializer selection |
| `QaaS.Framework.Providers` | Hook discovery and Autofac wiring |

## Common Hook Inventory

### Assertions

The reusable assertion package currently centers on:

- hermeticity assertions
- delay assertions
- output-deserializable checks
- output JSON schema validation
- HTTP status validation
- expected-results comparisons

### Generators

The reusable generator package currently includes:

- file system and S3 loaders
- session-data-derived generators
- JSON and schema-driven JSON generation
- stacking and lettuce-based combinators

### Probes

The reusable probe package currently includes:

- OpenShift and Kubernetes actions
- RabbitMQ object manipulation
- Redis cleanup
- S3 cleanup
- SQL table truncation

### Processors

The reusable mocker processor package currently includes:

- example and dummy processors
- HTTP status-code-oriented processors
- gRPC echo behavior

## Third-Party Dependencies You Will Actually Notice

| Dependency | Why it shows up |
| --- | --- |
| [CommandLineParser]([[ext:commandlineparser]]) | Runner and mocker CLI parsing |
| [Autofac]([[ext:autofac]]) | Hook discovery and runtime object graph assembly |
| [Serilog]([[ext:serilog]]) | Logging |
| [YamlDotNet]([[ext:yamldotnet]]) | YAML parsing and emission |
| [RabbitMQ .NET client]([[ext:rabbitmq-dotnet]]) | RabbitMQ protocols |
| [StackExchange.Redis]([[ext:redis]]) | Mocker controller and Redis protocol work |
| [Kubernetes C# client]([[ext:kubernetes-client]]) | Common probes against cluster resources |
| [AWS SDK for .NET]([[ext:aws-sdk-dotnet]]) | S3 protocol and probe support |

## Decision Guide

- Need to author a test: start with `QaaS.Runner` plus common hooks.
- Need a new reusable check: add an assertion hook.
- Need a new reusable input source: add a generator hook.
- Need environment setup or cleanup: add a probe hook.
- Need fake downstream behavior: use `QaaS.Mocker` and a processor.
- Need a new wire protocol or lower-level execution behavior: that belongs in `QaaS.Framework`.
