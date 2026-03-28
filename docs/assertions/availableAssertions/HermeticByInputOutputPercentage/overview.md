# HermeticByInputOutputPercentage

Performs a hermetic test by comparing the the count of a specified input with multiplied by given percentage modifier to the count of a specified output

> Logical group: Hermeticity / Exact input/output percentage

> Logical group: Hermeticity / Exact input/output percentage

## What It Does

Sums the configured input counts and output counts, converts the relationship into a percentage, and then checks whether the output total equals the rounded expected percentage of the input total.

The calculation supports multiple input names and multiple output names. When there are zero inputs and zero outputs the effective percentage is treated as zero; when there are zero inputs but some outputs, the comparison fails instead of dividing by zero. `InputsAreOutputs` lets you compare one output stream against another when the "input" side is itself stored as output data.

## YAML Example

```yaml
Sessions:
  - Name: SampleSession

Assertions:
  - Name: HermeticByInputOutputPercentageAssertion
    Assertion: HermeticByInputOutputPercentage
    SessionNames:
      - SampleSession

    AssertionConfiguration:
      InputNames:
        - Published
      OutputNames:
        - Delivered
      ExpectedPercentage: 50
      MidpointRounding: AwayFromZero
```

## What This Configuration Does

This configuration says that `Delivered` should contain exactly half as many items as `Published` in `SampleSession`.

The assertion computes the expected output count as 50 percent of the total input count, rounds it with `AwayFromZero`, and passes only if the real output count matches that rounded number exactly.
