# DelayByAverage

Checks for delay between an input source to an output source by subtracting the average timestamp of all inputs from the average timestamp of all the outputs.

> Logical group: Latency / Average latency

## What It Does

Measures latency by taking every timestamp in the named input list, every timestamp in the named output list, calculating the average time for each side, and comparing the difference against `MaximumDelayMs`.

If the output list is empty it passes immediately because there is no observed delay to measure. If the input list is empty, or any required timestamp is missing, the assertion raises an error because the delay calculation is no longer meaningful. A small negative result can be tolerated through `MaximumNegativeDelayBufferMs`; anything more negative is treated as bad timing data and throws.

## YAML Example

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

## What This Configuration Does

This snippet compares the average timestamp of `PublishedMessages` with the average timestamp of `ConsumedMessages` for `SampleSession`.

The assertion passes when the average output delay is 250 ms or less. If the calculated delay is slightly negative but still inside the 25 ms buffer, it is treated as clock jitter and effectively clamped to zero; a larger negative value is treated as invalid timing data and fails by exception.
