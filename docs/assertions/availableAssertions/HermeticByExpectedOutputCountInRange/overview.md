---
id: assertions.available.hermeticbyexpectedoutputcountinrange.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, HermeticByExpectedOutputCountInRange, AssertionConfiguration]
summary: "Performs a hermetic test by comparing the count of a given output in a session to a given expected minimum and maximum"
---
<!-- Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\HermeticByExpectedOutputCountInRange.cs -->

# HermeticByExpectedOutputCountInRange

Performs a hermetic test by comparing the count of a given output in a session to a given expected minimum and maximum

## What it does

Performs a hermetic test by comparing the count of a given output in a session to a given expected minimum and maximum See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: HermeticByExpectedOutputCountInRangeSession
    Assertions:
      - Name: HermeticByExpectedOutputCountInRangeStep
        Assertion: HermeticByExpectedOutputCountInRange
        AssertionConfiguration:
        OutputNames: []
        ExpectedMinimumCount:
        ExpectedMaximumCount:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | assertions |
| **YAML key** | `HermeticByExpectedOutputCountInRange` |
| **Schema** | [`assertions.schema.json`](../../../_generated/schemas/assertions.md) |
| **Source** | `QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\HermeticByExpectedOutputCountInRange.cs` |

## See also

- [assertions index](../../index.md)
- [Custom assertion authoring guide](../../custom-authoring-guide.md)
