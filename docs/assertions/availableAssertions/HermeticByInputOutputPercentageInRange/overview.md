---
id: assertions.available.hermeticbyinputoutputpercentageinrange.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, HermeticByInputOutputPercentageInRange, AssertionConfiguration]
summary: "Checks whether the percentage between configured inputs and outputs stays within the expected minimum and maximum range."
---
<!-- Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\HermeticByInputOutputPercentageInRange.cs -->

# HermeticByInputOutputPercentageInRange

> TL;DR: Checks whether the percentage between configured inputs and outputs stays within the expected minimum and maximum range.

Checks whether the percentage between configured inputs and outputs stays within the expected minimum and maximum range.

## What It Does

Sums the configured input and output counts, calculates the real output-to-input percentage, and checks whether that real percentage stays within the configured inclusive minimum and maximum range.

Unlike the exact-percentage variant, this assertion compares the calculated percentage directly instead of converting the input count into one exact expected output count. It still supports `InputsAreOutputs` for output-to-output comparisons.

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

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
