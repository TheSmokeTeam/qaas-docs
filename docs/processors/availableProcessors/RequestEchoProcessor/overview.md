---
id: processors.available.requestechoprocessor.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, RequestEchoProcessor, ProcessorConfiguration]
summary: "Returns a JSON response that echoes the incoming request body and optional request metadata."
---
<!-- Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\RequestEchoProcessor.cs -->

# RequestEchoProcessor

> TL;DR: Returns a JSON response that echoes the incoming request body and optional request metadata.

Returns a JSON response that echoes the incoming request body and optional request metadata.

## What It Does

Returns a JSON echo of the incoming request body and can optionally include the request URI, headers, and path parameters.

For byte-array request bodies it also includes base64, text, and length information so binary payloads can still be inspected easily.

## Minimal example

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

## Realistic example

This stub responds with a JSON document that mirrors the incoming request body and includes the request URI, path parameters, and request headers.

It returns HTTP `200` as a diagnostic echo response.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
