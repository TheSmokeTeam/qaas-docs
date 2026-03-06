## QaaS.Common.Processors Zero-to-Hero

### Overview

[`QaaS.Common.Processors`](https://github.com/eldarush/QaaS.Common.Processors) provides transaction processors used by `QaaS.Mocker.Stubs`.

Built-in processors:

- `ExampleProcessor`
- `DummyTransactionProcessor`
- `GrpcEchoProcessor`
- `StatusCodeTransactionProcessor`

### Architecture & Connections

- Processors implement mocker transaction logic on top of framework execution abstractions.
- `QaaS.Mocker.Stubs.TransactionStubConfig` selects a processor by name and passes processor-specific configuration.
- The processor decides how request bytes, metadata, and optional data sources turn into a response payload.

### Quick Start

```bash
dotnet restore D:/QaaS/QaaS.Common.Processors/QaaS.Common.Processors.sln
dotnet build D:/QaaS/QaaS.Common.Processors/QaaS.Common.Processors.sln -c Release --no-restore
dotnet test D:/QaaS/QaaS.Common.Processors/QaaS.Common.Processors.sln -c Release --no-build
dotnet add package QaaS.Common.Processors
```

### Technical Reference

- `ExampleProcessor` returns a static UTF-8 response with HTTP status `200`.
- `DummyTransactionProcessor` builds a JSON response using the incoming request plus `DummyStubConfig`.
- `GrpcEchoProcessor` reflects paired request and response types and echoes the `Message` field.
- `StatusCodeTransactionProcessor` emits an empty body with a configured status code.

### Troubleshooting & Links

- If a processor is selected but the response is empty, verify the processor-specific configuration type is actually bound.
- `GrpcEchoProcessor` depends on request and response type naming conventions. Check the generated proto types before debugging the processor itself.

- Source: [eldarush/QaaS.Common.Processors](https://github.com/eldarush/QaaS.Common.Processors)
- NuGet: [QaaS.Common.Processors](https://www.nuget.org/packages/QaaS.Common.Processors/)
