# Stubs

Stubs are the units of mock behavior executed by server actions. Each stub binds a unique name to an `ITransactionProcessor` hook and can optionally consume one or more configured data sources.

A server action references a stub by `TransactionStubName`. The processor then decides how the incoming request data is transformed into the mock response or collected output.

## What a Stub Can Configure

- `Processor` identifies the processor hook to load
- `DataSourceNames` passes named data sources into the processor
- `RequestBodyDeserialization` converts incoming payloads before they reach the processor
- `ResponseBodySerialization` converts the processor response after it returns
- `ProcessorSpecificConfiguration` is bound into the processor's configuration object

`Processor` can be a full type name or, when the processor name is unique among loaded `ITransactionProcessor` implementations, just the class name.

## Built-in Fallback Stubs

The runtime always appends two fallback stubs:

- `DefaultNotFoundTransaction`, which returns HTTP `404`
- `DefaultInternalErrorTransaction`, which returns HTTP `500`

HTTP and gRPC server sections use those defaults automatically unless you override `NotFoundTransactionStubName` or `InternalErrorTransactionStubName` with your own stub names.
