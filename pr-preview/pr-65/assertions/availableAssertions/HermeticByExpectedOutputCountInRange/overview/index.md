# HermeticByExpectedOutputCountInRange

> TL;DR — Performs a hermetic test by comparing the count of a given output in a session to a given expected minimum and maximum

## When to use

Adds up the number of items in the configured output names across the selected sessions and checks whether the total falls between a minimum and a maximum inclusive boundary.

This is the range-based form of the exact-count hermetic check. It is useful when a flow is allowed to produce some controlled variation but still must stay inside a defined envelope.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: SampleSession

Assertions:
  - Name: HermeticByExpectedOutputCountInRangeAssertion
    Assertion: HermeticByExpectedOutputCountInRange
    SessionNames:
      - SampleSession

    AssertionConfiguration:
      OutputNames:
        - Reply
      ExpectedMinimumCount: 2
      ExpectedMaximumCount: 4
```

## Realistic example

This snippet counts how many items were saved under `Reply` for `SampleSession`.

The assertion passes when the count is between 2 and 4 inclusive. Counts below 2 or above 4 fail the assertion.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/HermeticByExpectedOutputCountInRange/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/HermeticByExpectedOutputCountInRange/configuration/yamlView/index.md)
- [Assertions](https://TheSmokeTeam.github.io/qaas-docs/assertions/index.md)
