# TextTransformProcessor

Reads the incoming payload as text, applies the configured text transformation, and returns the transformed response.

> Logical group: Transformations / Text transformation

## What It Does

Reads the incoming request body as text, optionally trims it, replaces matched text, and then adds a prefix and suffix before returning the transformed result.

If the original body is not already text, the processor serializes it first. This makes it useful for lightweight normalization, templating, or diagnostics without writing custom code.

## YAML Example

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

## What This Configuration Does

This example trims the incoming body, replaces `hello` with `hi`, then wraps the result in square brackets.

For an input like `  hello world  `, the response body becomes `[hi world]`. The response is returned as HTTP `202`.
