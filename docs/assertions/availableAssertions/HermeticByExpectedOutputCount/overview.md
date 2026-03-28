# HermeticByExpectedOutputCount

Performs a hermetic test by comparing the count of a given output in a session to a given expected count

> Logical group: Hermeticity / Exact output count

## What It Does

Adds up the number of items found in the configured output names across every session given to the assertion and compares that total with one exact expected count.

Missing output names simply contribute zero instead of throwing. That makes the assertion useful when you want a strict "exactly N outputs were produced" check over one session or over a filtered group of sessions.

## YAML Example

```yaml
Sessions:
  - Name: SampleSession

Assertions:
  - Name: HermeticByExpectedOutputCountAssertion
    Assertion: HermeticByExpectedOutputCount
    SessionNames:
      - SampleSession

    AssertionConfiguration:
      OutputNames:
        - Reply
        - RetryReply
      ExpectedCount: 3
```

## What This Configuration Does

This assertion totals the number of saved items in `Reply` and `RetryReply` for `SampleSession` and expects the combined count to be exactly 3.

If one of those outputs is missing entirely it contributes zero. The assertion passes only when the final summed count equals 3.
