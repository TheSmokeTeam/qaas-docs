---
id: assertions.available.hermeticbyinputoutputpercentage.overview
slug: hermeticbyinputoutputpercentage
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [assertions, HermeticByInputOutputPercentage, AssertionConfiguration]
ai_summary: "Performs a hermetic test by comparing the the count of a specified input with multiplied by given percentage modifier to the count of a specified output"
tags: [assertions]
canonical_url: /assertions/availableAssertions/HermeticByInputOutputPercentage/overview/
# Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\HermeticByInputOutputPercentage.cs
---

# HermeticByInputOutputPercentage

Performs a hermetic test by comparing the the count of a specified input with multiplied by given percentage modifier to the count of a specified output

## What it does

Performs a hermetic test by comparing the the count of a specified input with multiplied by given percentage modifier to the count of a specified output See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: HermeticByInputOutputPercentageSession
    Assertions:
      - Name: HermeticByInputOutputPercentageStep
        Assertion: HermeticByInputOutputPercentage
        AssertionConfiguration:
        OutputNames: []
        InputNames: []
        ExpectedPercentage:
        InputsAreOutputs:
        MidpointRounding:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | assertions |
| **YAML key** | `HermeticByInputOutputPercentage` |
| **Schema** | [`assertions.schema.json`](../../../_generated/schemas/assertions.md) |
| **Source** | `QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\HermeticByInputOutputPercentage.cs` |

## See also

- [assertions index](../../index.md)
- [Custom assertion authoring guide](../../custom-authoring-guide.md)
