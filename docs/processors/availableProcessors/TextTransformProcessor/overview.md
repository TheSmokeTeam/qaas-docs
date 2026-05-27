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

> TL;DR: Reads the incoming payload as text, applies the configured text transformation, and returns the transformed response.

Reads the incoming payload as text, applies the configured text transformation, and returns the transformed response.

## What It Does {: #what-it-does}

Reads the incoming request body as text, optionally trims it, replaces matched text, and then adds a prefix and suffix before returning the transformed result.

If the original body is not already text, the processor serializes it first. This makes it useful for lightweight normalization, templating, or diagnostics without writing custom code.

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

For an input containing `hello world` with surrounding spaces, the response body becomes `[hi world]`. The response is returned as HTTP `202`.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
