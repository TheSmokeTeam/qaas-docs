# Processors

Processors are **hooks** that handle incoming mocker stub requests and produce responses. They implement `ITransactionProcessor` / `BaseTransactionProcessor<TConfig>` and are referenced by class name in the mocker YAML.

The **QaaS.Common.Processors** NuGet package ships the built-in processor library. You can author custom processors by implementing `BaseTransactionProcessor<TConfig>` from [QaaS.Framework.SDK](../framework/projects/sdk.md).

|                |                                                                          |
|----------------|--------------------------------------------------------------------------|
| **Package**    | `QaaS.Common.Processors`                                                 |
| **Source**     | [Repository - QaaS.Common.Processors]({{ links.repository_processors }}) |
| **Depends on** | [QaaS.Framework.SDK](../framework/projects/sdk.md)                       |

## Installation

```xml
<PackageReference Include="QaaS.Common.Processors" Version="x.x.x" />
```

## Available Processors

| Processor                                                                                        | Category    | Purpose                                                                                |
|--------------------------------------------------------------------------------------------------|-------------|----------------------------------------------------------------------------------------|
| [ExampleProcessor](availableProcessors/ExampleProcessor/overview.md)                             | Utility     | Returns a static UTF-8 body with HTTP 200                                              |
| [DummyTransactionProcessor](availableProcessors/DummyTransactionProcessor/overview.md)           | Utility     | Base64-encodes the request, injects configured key/value, returns JSON                 |
| [GrpcEchoProcessor](availableProcessors/GrpcEchoProcessor/overview.md)                           | gRPC        | Auto-resolves paired `*Request`/`*Response` protobuf types, echoes the `Message` field |
| [StatusCodeTransactionProcessor](availableProcessors/StatusCodeTransactionProcessor/overview.md) | HTTP        | Returns an empty body with the configured HTTP status code                             |
| [TransactionFromDataSources](availableProcessors/TransactionFromDataSources/overview.md)         | Data source | Serves items from a named data source sequentially                                     |

## Writing Custom Processors

See [Write Hooks](../qaas/quickStart/writeHooks.md) for the pattern.

## Generated Docs Contract

The external hook automation is expected to emit one folder per processor under `availableProcessors/<ProcessorName>/` with:

* `overview.md`
* `configuration/tableView.md`
* `configuration/yamlView.md`
