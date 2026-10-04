# PassThroughProcessor

> TL;DR — Returns the incoming request payload unchanged while applying the configured response metadata.

## When to use

Returns the incoming request body unchanged and optionally preserves the request metadata from the original data item.

It is the simplest processor for echoing raw request content back to the caller while still letting you control response status, content type, and extra headers.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

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

## Realistic example

This configuration returns the request body exactly as it arrived and marks the response as `202`.

Because `PreserveMetaData` is enabled, request metadata already attached to the incoming item is preserved instead of being discarded.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/PassThroughProcessor/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/PassThroughProcessor/configuration/yamlView/index.md)
- [Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md)
