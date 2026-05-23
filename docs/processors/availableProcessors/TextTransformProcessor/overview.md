---
id: processors.available.texttransformprocessor.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [processors]
keywords: [processors, TextTransformProcessor, ProcessorConfiguration]
summary: "Reads the incoming payload as text, applies the configured text transformation, and returns the transformed response."
---
<!-- Verified-against: QaaS.Common.Processors\QaaS.Common.Processors\TextTransformProcessor.cs -->

# TextTransformProcessor

> TL;DR — Reads the incoming payload as text, applies the configured text transformation, and returns the transformed response.

## When to use {: #when-to-use}

Reads the incoming request body as text, optionally trims it, replaces matched text, and then adds a prefix and suffix before returning the transformed result.

If the original body is not already text, the processor serializes it first. This makes it useful for lightweight normalization, templating, or diagnostics without writing custom code.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
Stubs:
  - Name: TextTransformProcessorStub
    Processor: TextTransformProcessor

    ProcessorConfiguration:
      ContentType: text/plain; charset=utf-8
      StatusCode: 202
      Prefix: '['
      SearchText: hello
      ReplacementText: hi
      Suffix: ']'
      TrimWhitespace: true

Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /health
          Actions:
            - Name: HealthAction
              Method: Get
              TransactionStubName: TextTransformProcessorStub
```

## Realistic example {: #realistic-example}

This example trims the incoming body, replaces `hello` with `hi`, then wraps the result in square brackets.

For an input containing `hello world` with leading and trailing spaces, the response body becomes `[hi world]`. The response is returned as HTTP `202`.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Processors](../../index.md)
