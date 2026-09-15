# HttpStatus

> TL;DR — Performs a logic test on the http status of all selected outputs in a session by checking they all have the desired http status code

## When to use

Reads every saved item in the configured output lists of a single session and verifies that each item carries the expected HTTP status code in its metadata.

If any output item is missing HTTP status metadata entirely, the assertion throws instead of silently ignoring it. When status codes are present but some do not match, the assertion fails and records both the unexpected status codes and the outputs where they appeared.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: SampleSession

Assertions:
  - Name: HttpStatusAssertion
    Assertion: HttpStatus
    SessionNames:
      - SampleSession

    AssertionConfiguration:
      StatusCode: 200
      OutputNames:
        - Reply
```

## Realistic example

This assertion checks the `Reply` output of `SampleSession` and expects every saved item to have HTTP status `200`.

If all items report `200`, the assertion passes. If any item reports a different status it fails with a detailed trace, and if any item has no HTTP status metadata at all it fails by exception because the status check cannot be trusted.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/HttpStatus/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/HttpStatus/configuration/yamlView/index.md)
- [Assertions](https://TheSmokeTeam.github.io/qaas-docs/assertions/index.md)
