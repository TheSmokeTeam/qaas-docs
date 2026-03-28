# StaticResponseProcessor

Returns a fixed UTF-8 response body with the configured status code, content type, and headers.

> Logical group: Static responses / Fixed body

> Logical group: Static responses / Fixed body

## What It Does

Returns a fixed UTF-8 response body together with the configured HTTP status code, content type, and headers.

This is the simplest processor for serving a known canned response from a stubbed endpoint.

## YAML Example

```yaml
Stubs:
  - Name: StaticResponseProcessorStub
    Processor: StaticResponseProcessor

    ProcessorConfiguration:
      Body: stub is healthy
      StatusCode: 200
      ContentType: text/plain; charset=utf-8

Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /health
          Actions:
            - Name: HealthAction
              Method: Get
              TransactionStubName: StaticResponseProcessorStub
```

## What This Configuration Does

This configuration makes the endpoint always return the text `stub is healthy` as a UTF-8 body.

The response status is `200` and the content type is `text/plain; charset=utf-8`.
