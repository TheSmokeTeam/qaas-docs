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

Checks for delay between an input source to an output source by subtracting the average timestamp of all inputs from the average timestamp of all the outputs.

## What it does

Checks for delay between an input source to an output source by subtracting the average timestamp of all inputs from the average timestamp of all the outputs. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DelayByAverageSession
    Assertions:
      - Name: DelayByAverageStep
        Assertion: DelayByAverage
        AssertionConfiguration:
        OutputName:
        InputName:
        InputsAreOutputs:
        MaximumDelayMs:
        MaximumNegativeDelayBufferMs:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | assertions |
| **YAML key** | `DelayByAverage` |
| **Schema** | [`assertions.schema.json`](../../../_generated/schemas/assertions.md) |
| **Source** | `QaaS.Common.Assertions\QaaS.Common.Assertions\Delay\DelayByAverage.cs` |

## See also

- [assertions index](../../index.md)
- [Custom assertion authoring guide](../../custom-authoring-guide.md)
