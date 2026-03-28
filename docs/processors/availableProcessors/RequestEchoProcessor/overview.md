# RequestEchoProcessor

Returns a JSON response that echoes the incoming request body and optional request metadata.

> Logical group: Request-derived responses / Echo request

## What It Does

Returns a JSON echo of the incoming request body and can optionally include the request URI, headers, and path parameters.

For byte-array request bodies it also includes base64, text, and length information so binary payloads can still be inspected easily.

## YAML Example

```yaml
Stubs:
  - Name: RequestEchoProcessorStub
    Processor: RequestEchoProcessor

    ProcessorConfiguration:
      ContentType: application/json
      StatusCode: 200
      IncludePathParameters: true
      IncludeRequestHeaders: true
      IncludeUri: true

Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /health
          Actions:
            - Name: HealthAction
              Method: Get
              TransactionStubName: RequestEchoProcessorStub
```

## What This Configuration Does

This stub responds with a JSON document that mirrors the incoming request body and includes the request URI, path parameters, and request headers.

It returns HTTP `200` as a diagnostic echo response.
