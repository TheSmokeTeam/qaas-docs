---
id: assertions.available.hermeticbyexpectedoutputcount.overview
slug: hermeticbyexpectedoutputcount
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [assertions, HermeticByExpectedOutputCount, AssertionConfiguration]
ai_summary: "Performs a hermetic test by comparing the count of a given output in a session to a given expected count"
tags: [assertions]
canonical_url: /assertions/availableAssertions/HermeticByExpectedOutputCount/overview/
# Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\HermeticByExpectedOutputCount.cs
---

# HermeticByExpectedOutputCount

Performs a hermetic test by comparing the count of a given output in a session to a given expected count

## What it does

Performs a hermetic test by comparing the count of a given output in a session to a given expected count See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: HermeticByExpectedOutputCountSession
    Assertions:
      - Name: HermeticByExpectedOutputCountStep
        Assertion: HermeticByExpectedOutputCount
        AssertionConfiguration:
        OutputNames: []
        ExpectedCount:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | assertions |
| **YAML key** | `HermeticByExpectedOutputCount` |
| **Schema** | [`assertions.schema.json`](../../../_generated/schemas/assertions.md) |
| **Source** | `QaaS.Common.Assertions\QaaS.Common.Assertions\Hermetic\HermeticByExpectedOutputCount.cs` |

## See also

- [assertions index](../../index.md)
- [Custom assertion authoring guide](../../custom-authoring-guide.md)
