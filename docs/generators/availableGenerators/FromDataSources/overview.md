---
id: generators.available.fromdatasources.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromDataSources, GeneratorConfiguration]
summary: "Generates data from the enumerable of data sources it receives"
---
<!-- Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromDataSourcesGenerators\FromDataSources.cs -->

# FromDataSources

Generates data from the enumerable of data sources it receives

## What it does

Generates data from the enumerable of data sources it receives See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: FromDataSourcesSession
    Generators:
      - Name: FromDataSourcesStep
        DataSource: FromDataSources
        GeneratorConfiguration:
        Count:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | generators |
| **YAML key** | `FromDataSources` |
| **Schema** | [`generators.schema.json`](../../../_generated/schemas/generators.md) |
| **Source** | `QaaS.Common.Generators\QaaS.Common.Generators\FromDataSourcesGenerators\FromDataSources.cs` |

## See also

- [generators index](../../index.md)
- [Custom generator authoring guide](../../custom-authoring-guide.md)
