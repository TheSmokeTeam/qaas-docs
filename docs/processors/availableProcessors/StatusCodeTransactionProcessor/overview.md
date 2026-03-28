# StatusCodeTransactionProcessor

Skim Transaction Processor which returns empty-bodied data objects with Status Code configuration.

> Logical group: Static responses / Status code only

> Logical group: Static responses / Status code only

## What It Does

Returns an HTTP response whose main purpose is the configured status code and does not require a response body.

This is useful for endpoints such as health checks, accepted commands, or no-content acknowledgements where only the status code matters.

## YAML Example

```yaml
Stubs:
  - Name: StatusCodeTransactionProcessorStub
    Processor: StatusCodeTransactionProcessor

    ProcessorConfiguration:
      StatusCode: 204

Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /health
          Actions:
            - Name: HealthAction
              Method: Get
              TransactionStubName: StatusCodeTransactionProcessorStub
```

## What This Configuration Does

This stub returns an HTTP `204` response and does not need to construct a response body.

It is a minimal way to model endpoints that acknowledge the request successfully but intentionally return no content.
