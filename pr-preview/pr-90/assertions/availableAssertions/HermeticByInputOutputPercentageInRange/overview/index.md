# HermeticByInputOutputPercentageInRange

> TL;DR — Checks whether the percentage between configured inputs and outputs stays within the expected minimum and maximum range.

## When to use

Sums the configured input and output counts, calculates the real output-to-input percentage, and checks whether that real percentage stays within the configured inclusive minimum and maximum range.

Unlike the exact-percentage variant, this assertion compares the calculated percentage directly instead of converting the input count into one exact expected output count. It still supports `InputsAreOutputs` for output-to-output comparisons.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: SampleSession

Assertions:
  - Name: HermeticByInputOutputPercentageInRangeAssertion
    Assertion: HermeticByInputOutputPercentageInRange
    SessionNames:
      - SampleSession

    AssertionConfiguration:
      InputNames:
        - Published
      OutputNames:
        - Delivered
      ExpectedMinimumPercentage: 45
      ExpectedMaximumPercentage: 55
```

## Realistic example

This snippet checks whether `Delivered` stays near a 1:2 ratio with `Published`.

The assertion passes when the actual output percentage is between 45 and 55 percent inclusive. It is useful when the flow is allowed to vary slightly but should stay close to a target ratio.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/HermeticByInputOutputPercentageInRange/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/HermeticByInputOutputPercentageInRange/configuration/yamlView/index.md)
- [Assertions](https://TheSmokeTeam.github.io/qaas-docs/assertions/index.md)
