# TextTransformProcessor

> TL;DR — Reads the incoming payload as text, applies the configured text transformation, and returns the transformed response.

## When to use

Reads the incoming request body as text, optionally trims it, replaces matched text, and then adds a prefix and suffix before returning the transformed result.

If the original body is not already text, the processor serializes it first. This makes it useful for lightweight normalization, templating, or diagnostics without writing custom code.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

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

## Realistic example

This example trims the incoming body, replaces `hello` with `hi`, then wraps the result in square brackets.

For an input containing `hello world` with surrounding spaces, the response body becomes `[hi world]`. The response is returned as HTTP `202`.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/TextTransformProcessor/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/TextTransformProcessor/configuration/yamlView/index.md)
- [Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md)
