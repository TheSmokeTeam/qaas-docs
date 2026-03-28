# PassThroughProcessor

Returns the incoming request payload unchanged while applying the configured response metadata.

> Logical group: Request-derived responses / Pass-through payload

> Logical group: Request-derived responses / Pass-through payload

## What It Does

Returns the incoming request body unchanged and optionally preserves the request metadata from the original data item.

It is the simplest processor for echoing raw request content back to the caller while still letting you control response status, content type, and extra headers.

## YAML Example

```yaml
Stubs:
  - Name: PassThroughProcessorStub
    Processor: PassThroughProcessor

    ProcessorConfiguration:
      StatusCode: 202
      ContentType: application/octet-stream
      PreserveMetaData: true

Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /health
          Actions:
            - Name: HealthAction
              Method: Get
              TransactionStubName: PassThroughProcessorStub
```

## What This Configuration Does

This configuration returns the request body exactly as it arrived and marks the response as `202`.

Because `PreserveMetaData` is enabled, request metadata already attached to the incoming item is preserved instead of being discarded.
