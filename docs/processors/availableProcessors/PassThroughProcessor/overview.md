---
id: processors.available.passthroughprocessor.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, PassThroughProcessor, ProcessorConfiguration]
summary: "Returns the incoming request payload unchanged while applying the configured response metadata."
---
<!-- Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\PassThroughProcessor.cs -->

# PassThroughProcessor

> TL;DR — Returns the incoming request payload unchanged while applying the configured response metadata.

## When to use {: #when-to-use}

Returns the incoming request body unchanged and optionally preserves the request metadata from the original data item.

It is the simplest processor for echoing raw request content back to the caller while still letting you control response status, content type, and extra headers.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

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

## Realistic example {: #realistic-example}

This configuration returns the request body exactly as it arrived and marks the response as `202`.

Because `PreserveMetaData` is enabled, request metadata already attached to the incoming item is preserved instead of being discarded.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Processors](../../index.md)
