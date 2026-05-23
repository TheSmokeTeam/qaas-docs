---
id: processors.available.statuscodetransactionprocessor.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, StatusCodeTransactionProcessor, ProcessorConfiguration]
summary: "Skim Transaction Processor which returns empty-bodied data objects with Status Code configuration."
---
<!-- Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\StatusCodeTransactionProcessor.cs -->

# StatusCodeTransactionProcessor

> TL;DR — Skim Transaction Processor which returns empty-bodied data objects with Status Code configuration.

## When to use {: #when-to-use}

Returns an HTTP response whose main purpose is the configured status code and does not require a response body.

This is useful for endpoints such as health checks, accepted commands, or no-content acknowledgements where only the status code matters.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

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

## Realistic example {: #realistic-example}

This stub returns an HTTP `204` response and does not need to construct a response body.

It is a minimal way to represent endpoints that acknowledge the request successfully but intentionally return no content.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Processors](../../index.md)
