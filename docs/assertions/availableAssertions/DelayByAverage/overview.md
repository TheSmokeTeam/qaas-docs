---
id: assertions.available.delaybyaverage.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, DelayByAverage, AssertionConfiguration]
summary: "Checks for delay between an input source to an output source by subtracting the average timestamp of all inputs from the average timestamp of all the outputs."
---
<!-- Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\Delay\DelayByAverage.cs -->

# DelayByAverage

> TL;DR — Checks for delay between an input source to an output source by subtracting the average timestamp of all inputs from the average timestamp of all the outputs.

## When to use {: #when-to-use}

Measures latency by taking every timestamp in the named input list, every timestamp in the named output list, calculating the average time for each side, and comparing the difference against `MaximumDelayMs`.

If the output list is empty it passes immediately because there is no observed delay to measure. If the input list is empty, or any required timestamp is missing, the assertion raises an error because the delay calculation is no longer meaningful. A small negative result can be tolerated through `MaximumNegativeDelayBufferMs`; anything more negative is treated as bad timing data and throws.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
Sessions:
  - Name: SampleSession

Assertions:
  - Name: DelayByAverageAssertion
    Assertion: DelayByAverage
    SessionNames:
      - SampleSession

    AssertionConfiguration:
      InputName: PublishedMessages
      OutputName: ConsumedMessages
      MaximumDelayMs: 250
      MaximumNegativeDelayBufferMs: 25
```

## Realistic example {: #realistic-example}

This snippet compares the average timestamp of `PublishedMessages` with the average timestamp of `ConsumedMessages` for `SampleSession`.

The assertion passes when the average output delay is 250 ms or less. If the calculated delay is slightly negative but still inside the 25 ms buffer, it is treated as clock jitter and effectively clamped to zero; a larger negative value is treated as invalid timing data and fails by exception.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Assertions](../../index.md)
