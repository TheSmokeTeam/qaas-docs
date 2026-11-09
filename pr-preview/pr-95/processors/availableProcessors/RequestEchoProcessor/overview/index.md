# RequestEchoProcessor

> TL;DR — Returns a JSON response that echoes the incoming request body and optional request metadata.

## When to use

Returns a JSON echo of the incoming request body and can optionally include the request URI, headers, and path parameters.

For byte-array request bodies it also includes base64, text, and length information so binary payloads can still be inspected easily.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

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

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/RequestEchoProcessor/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/RequestEchoProcessor/configuration/yamlView/index.md)
- [Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md)
