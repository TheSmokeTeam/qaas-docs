# HermeticByExpectedOutputCountInRange

Performs a hermetic test by comparing the count of a given output in a session to a given expected minimum and maximum

> Logical group: Hermeticity / Output count range

> Logical group: Hermeticity / Output count range

## What It Does

Adds up the number of items in the configured output names across the selected sessions and checks whether the total falls between a minimum and a maximum inclusive boundary.

This is the range-based form of the exact-count hermetic check. It is useful when a flow is allowed to produce some controlled variation but still must stay inside a defined envelope.

## YAML Example

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

## What This Configuration Does

This snippet counts how many items were saved under `Reply` for `SampleSession`.

The assertion passes when the count is between 2 and 4 inclusive. Counts below 2 or above 4 fail the assertion.
