# JsonEnvelopeProcessor

Wraps the incoming request payload and optional request metadata in a JSON envelope response.

> Logical group: Transformations / JSON envelope

> Logical group: Transformations / JSON envelope

## What It Does

Wraps the incoming request into a JSON object under a configurable body-property name and can optionally add request metadata such as headers, path parameters, URI, and the original body type.

This is useful when a downstream system expects a structured JSON envelope but the incoming request may be raw text, bytes, or another object type.

## YAML Example

```yaml
Stubs:
  - Name: JsonEnvelopeProcessorStub
    Processor: JsonEnvelopeProcessor

    ProcessorConfiguration:
      BodyPropertyName: request
      ContentType: application/json
      StatusCode: 200
      IncludeBodyType: true
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
              TransactionStubName: JsonEnvelopeProcessorStub
```

## What This Configuration Does

This stub returns a JSON document that places the incoming request body under the `request` property and also includes the request URI, headers, path parameters, and original body-type information.

The response comes back as HTTP `200` with `application/json`.
