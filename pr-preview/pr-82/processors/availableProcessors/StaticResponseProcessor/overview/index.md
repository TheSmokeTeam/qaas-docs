# StaticResponseProcessor

> TL;DR — Returns a fixed UTF-8 response body with the configured status code, content type, and headers.

## When to use

Returns a fixed UTF-8 response body together with the configured HTTP status code, content type, and headers.

This is the simplest processor for serving a known canned response from a stubbed endpoint.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Stubs:
  - Name: StaticResponseProcessorStub
    Processor: StaticResponseProcessor

    ProcessorConfiguration:
      Body: stub is healthy
      StatusCode: 200
      ContentType: text/plain; charset=utf-8

Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /health
          Actions:
            - Name: HealthAction
              Method: Get
              TransactionStubName: StaticResponseProcessorStub
```

## Realistic example

This configuration makes the endpoint always return the text `stub is healthy` as a UTF-8 body.

The response status is `200` and the content type is `text/plain; charset=utf-8`.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/StaticResponseProcessor/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/StaticResponseProcessor/configuration/yamlView/index.md)
- [Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md)
