# Processors Reference

## Configuration Types

- `DummyStubConfig`
  - `DummyKey`
  - `DummyValue`
- `NoConfiguration`
  - empty marker config for processors that do not need extra fields

## Processor Selection Notes

- `ExampleProcessor`: no extra configuration.
- `DummyTransactionProcessor`: requires `DummyStubConfig`.
- `GrpcEchoProcessor`: no extra configuration, but expects compatible request and response types.
- `StatusCodeTransactionProcessor`: uses the framework `StatusCodeConfiguration`.
