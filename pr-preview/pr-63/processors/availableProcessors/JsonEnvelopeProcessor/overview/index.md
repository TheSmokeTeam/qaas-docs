# JsonEnvelopeProcessor

> TL;DR — Wraps the incoming request payload and optional request metadata in a JSON envelope response.

## When to use

Wraps the incoming request into a JSON object under a configurable body-property name and can optionally add request metadata such as headers, path parameters, URI, and the original body type.

This is useful when a downstream system expects a structured JSON envelope but the incoming request may be raw text, bytes, or another object type.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

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

## Realistic example

This stub returns a JSON document that places the incoming request body under the `request` property and also includes the request URI, headers, path parameters, and original body-type information.

The response comes back as HTTP `200` with `application/json`.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/JsonEnvelopeProcessor/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/JsonEnvelopeProcessor/configuration/yamlView/index.md)
- [Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md)
