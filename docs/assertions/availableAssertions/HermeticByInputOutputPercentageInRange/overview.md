---
id: assertions.available.hermeticbyinputoutputpercentageinrange.overview
slug: hermeticbyinputoutputpercentageinrange
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [assertions, HermeticByInputOutputPercentageInRange, AssertionConfiguration]
ai_summary: "Checks whether the percentage between configured inputs and outputs stays within the expected minimum and maximum range."
tags: [assertions]
canonical_url: /assertions/availableAssertions/HermeticByInputOutputPercentageInRange/overview/
# Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\HermeticByInputOutputPercentageInRange.cs
---

# HermeticByInputOutputPercentageInRange

Checks whether the percentage between configured inputs and outputs stays within the expected minimum and maximum range.

## What it does

Checks whether the percentage between configured inputs and outputs stays within the expected minimum and maximum range. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: HermeticByInputOutputPercentageInRangeSession
    Assertions:
      - Name: HermeticByInputOutputPercentageInRangeStep
        Assertion: HermeticByInputOutputPercentageInRange
        AssertionConfiguration:
        OutputNames: []
        InputNames: []
        ExpectedMinimumPercentage:
        ExpectedMaximumPercentage:
        InputsAreOutputs:
        MidpointRounding:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | assertions |
| **YAML key** | `HermeticByInputOutputPercentageInRange` |
| **Schema** | [`assertions.schema.json`](../../../_generated/schemas/assertions.md) |
| **Source** | `QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\HermeticByInputOutputPercentageInRange.cs` |

## See also

- [assertions index](../../index.md)
- [Custom assertion authoring guide](../../custom-authoring-guide.md)
