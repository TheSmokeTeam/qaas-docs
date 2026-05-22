---
id: assertions.available.validatehermeticmetricsbyinputoutputpercentage.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, ValidateHermeticMetricsByInputOutputPercentage, AssertionConfiguration]
summary: "Compares the hermetic percentage calculated from configured inputs and outputs with the hermetic percentage reported by the metrics output."
---
<!-- Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\ValidateHermeticMetricsByInputOutputPercentage.cs -->

# ValidateHermeticMetricsByInputOutputPercentage

Compares the hermetic percentage calculated from configured inputs and outputs with the hermetic percentage reported by the metrics output.

## What it does

Compares the hermetic percentage calculated from configured inputs and outputs with the hermetic percentage reported by the metrics output. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: ValidateHermeticMetricsByInputOutputPercentageSession
    Assertions:
      - Name: ValidateHermeticMetricsByInputOutputPercentageStep
        Assertion: ValidateHermeticMetricsByInputOutputPercentage
        AssertionConfiguration:
        OutputNames: []
        InputNames: []
        InputsAreOutputs:
        MetricOutputSourceName:
        Tolerance:
        InputMetricName:
        OutputMetricName:
        ProcessMetricName:
        CombineMetricName:
        FilteredMetricName:
        SplitMetricName:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | assertions |
| **YAML key** | `ValidateHermeticMetricsByInputOutputPercentage` |
| **Schema** | [`assertions.schema.json`](../../../_generated/schemas/assertions.md) |
| **Source** | `QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\ValidateHermeticMetricsByInputOutputPercentage.cs` |

## See also

- [assertions index](../../index.md)
- [Custom assertion authoring guide](../../custom-authoring-guide.md)
