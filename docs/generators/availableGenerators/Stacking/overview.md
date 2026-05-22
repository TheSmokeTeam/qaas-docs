---
id: generators.available.stacking.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, Stacking, GeneratorConfiguration]
summary: "Combines multiple data sources by taking a configured number of items from each source in turn."
---
<!-- Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromDataSourcesGenerators\Stacking.cs -->

# Stacking

Combines multiple data sources by taking a configured number of items from each source in turn.

## What it does

Combines multiple data sources by taking a configured number of items from each source in turn. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: StackingSession
    Generators:
      - Name: StackingStep
        DataSource: Stacking
        GeneratorConfiguration:
        Count:
        ItemsPerGenerator: []
        LoopFinishedGenerators:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | generators |
| **YAML key** | `Stacking` |
| **Schema** | [`generators.schema.json`](../../../_generated/schemas/generators.md) |
| **Source** | `QaaS.Common.Generators\QaaS.Common.Generators\FromDataSourcesGenerators\Stacking.cs` |

## See also

- [generators index](../../index.md)
- [Custom generator authoring guide](../../custom-authoring-guide.md)
