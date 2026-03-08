# Processors

Processors are Mocker hooks that handle incoming stub requests and produce responses. They implement `ITransactionProcessor` / `BaseTransactionProcessor<TConfig>` and are referenced by class name in the mocker YAML.

## Installation

```xml
<PackageReference Include="QaaS.Common.Processors" Version="x.x.x" />
```

## Available Processors

| Processor | Config | Description |
|---|---|---|
| `ExampleProcessor` | — | Returns a static UTF-8 body with HTTP 200 |
| `DummyTransactionProcessor` | `DummyKey`, `DummyValue` | Base64-encodes the request, injects configured key/value, returns JSON |
| `GrpcEchoProcessor` | — | Auto-resolves paired `*Request`/`*Response` protobuf types, echoes the `Message` field |
| `StatusCodeTransactionProcessor` | `StatusCode` | Returns an empty body with the configured HTTP status code |

## YAML Example

```yaml
Stubs:
  - Name: HealthCheck
    Processor: StatusCodeTransactionProcessor
    ProcessorConfiguration:
      StatusCode: 200

  - Name: DataEndpoint
    Processor: TransactionFromDataSources
    DataSourceNames: [ ServerData ]
```

The `TransactionFromDataSources` processor (from `QaaS.Common.Processors`) serves items from a named data source sequentially — commonly paired with a `FromFileSystem` generator.

## Writing Custom Processors

See [Write Hooks](../qaas/quickStart/writeHooks.md#processor-mocker) for the pattern.
