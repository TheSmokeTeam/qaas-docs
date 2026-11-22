# ProblemDetailsProcessor

> TL;DR — Returns an RFC 7807 style problem-details JSON response using the configured status and fields.

## When to use

Builds a problem-details style JSON response with a title, type, detail, instance, status code, and optional extension fields.

It is useful for returning standardized error payloads without custom code, especially when you want failures to look like HTTP API validation or domain errors.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Stubs:
  - Name: ProblemDetailsProcessorStub
    Processor: ProblemDetailsProcessor

    ProcessorConfiguration:
      ContentType: application/problem+json
      StatusCode: 422
      Title: Validation failed
      Type: https://docs.example.com/problems/validation
      Detail: orderId is required
      UseRequestUriAsInstance: true

Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /health
          Actions:
            - Name: HealthAction
              Method: Get
              TransactionStubName: ProblemDetailsProcessorStub
```

## Realistic example

This example returns an RFC 7807-style response describing a validation error. The processor sets the problem type, title, detail, and status code.

Because `UseRequestUriAsInstance` is enabled, the request URI is copied into the problem `instance` field automatically.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/ProblemDetailsProcessor/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/processors/availableProcessors/ProblemDetailsProcessor/configuration/yamlView/index.md)
- [Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md)
