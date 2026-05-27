---
id: processors.available.conditionalresponseprocessor.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, ConditionalResponseProcessor, ProcessorConfiguration]
summary: "Returns the first configured response whose rule matches the incoming request metadata, or the configured default response when no rule matches."
---
<!-- Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\ConditionalResponseProcessor.cs -->

# ConditionalResponseProcessor

> TL;DR — Returns the first configured response whose rule matches the incoming request metadata, or the configured default response when no rule matches.

## When to use {: #when-to-use}

Evaluates the configured rules in order and returns the response from the first rule whose request-header or path-parameter condition matches the incoming request.

If no rule matches, it falls back to the configured default response. This makes it useful for lightweight branching behavior without writing custom processor code.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
Stubs:
  - Name: ConditionalResponseProcessorStub
    Processor: ConditionalResponseProcessor

    ProcessorConfiguration:
      DefaultContentType: text/plain; charset=utf-8
      DefaultStatusCode: 404
      DefaultBody: route not found
      Rules:
        - RequestHeaderName: X-Mode
          ExpectedValue: advanced
          ContentType: text/plain; charset=utf-8
          StatusCode: 202
          ResponseBody: advanced mode enabled

Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /health
          Actions:
            - Name: HealthAction
              Method: Get
              TransactionStubName: ConditionalResponseProcessorStub
```

## Realistic example {: #realistic-example}

This stub checks the incoming `X-Mode` request header first. If the header value is `advanced`, it returns `202` and the text body `advanced mode enabled`.

If the header is missing or has a different value, the rule does not match and the processor falls back to the default `404` response with the body `route not found`.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Processors](../../index.md)
