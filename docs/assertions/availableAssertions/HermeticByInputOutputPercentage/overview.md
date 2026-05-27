---
id: assertions.available.hermeticbyinputoutputpercentage.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, HermeticByInputOutputPercentage, AssertionConfiguration]
summary: "Performs a hermetic test by comparing the the count of a specified input with multiplied by given percentage modifier to the count of a specified output"
---
<!-- Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\HermeticByInputOutputPercentage.cs -->

# HermeticByInputOutputPercentage

> TL;DR: Performs a hermetic test by comparing the the count of a specified input with multiplied by given percentage modifier to the count of a specified output

Performs a hermetic test by comparing the the count of a specified input with multiplied by given percentage modifier to the count of a specified output

## What It Does {: #what-it-does}

Sums the configured input counts and output counts, converts the relationship into a percentage, and then checks whether the output total equals the rounded expected percentage of the input total.

The calculation supports multiple input names and multiple output names. When there are zero inputs and zero outputs the effective percentage is treated as zero; when there are zero inputs but some outputs, the comparison fails instead of dividing by zero. `InputsAreOutputs` lets you compare one output stream against another when the "input" side is itself stored as output data.

## Minimal example {: #minimal-example}

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

## Realistic example {: #realistic-example}

This configuration says that `Delivered` should contain exactly half as many items as `Published` in `SampleSession`.

The assertion computes the expected output count as 50 percent of the total input count, rounds it with `AwayFromZero`, and passes only if the real output count matches that rounded number exactly.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
