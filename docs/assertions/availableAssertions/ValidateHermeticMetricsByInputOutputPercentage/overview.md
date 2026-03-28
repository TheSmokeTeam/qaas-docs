# ValidateHermeticMetricsByInputOutputPercentage

Compares the hermetic percentage calculated from configured inputs and outputs with the hermetic percentage reported by the metrics output.

> Logical group: Hermeticity / Metrics percentage validation

## What It Does

Calculates hermetic behavior in two different ways and compares the results: first from the real input/output counts in the selected communication data, and second from the latest metric values found in a metrics output.

The metrics side uses the built-in hermetic formula `(output + process + combine + filtered) / (input + split) * 100`, with any optional metric names contributing zero when omitted. The assertion passes when the absolute difference between the metrics-based percentage and the count-based percentage stays below `Tolerance`.

## YAML Example

```yaml
Sessions:
  - Name: SampleSession

Assertions:
  - Name: ValidateHermeticMetricsByInputOutputPercentageAssertion
    Assertion: ValidateHermeticMetricsByInputOutputPercentage
    SessionNames:
      - SampleSession

    AssertionConfiguration:
      InputNames:
        - Published
      OutputNames:
        - Delivered
      MetricOutputSourceName: Metrics
      InputMetricName: input_total
      OutputMetricName: output_total
      ProcessMetricName: process_total
      CombineMetricName: combine_total
      FilteredMetricName: filtered_total
      SplitMetricName: split_total
      Tolerance: 0.5
```

## What This Configuration Does

This snippet compares the observed `Published` to `Delivered` ratio with the ratio reported through the latest metric samples stored in the `Metrics` output.

The assertion looks up the latest sample for each configured metric name, computes the metrics hermetic percentage, and accepts the run only when that result stays within 0.5 percentage points of the real input/output percentage.
