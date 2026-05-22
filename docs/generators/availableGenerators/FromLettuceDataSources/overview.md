---
id: generators.available.fromlettucedatasources.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromLettuceDataSources, GeneratorConfiguration]
summary: "Generates data from the enumerable of data sources it receives that is in `Lettuce` file format, presumes all items in the enumerable are deserialized into <see cref=\"SerializationType.Json\"/>"
---
<!-- Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromDataSourcesGenerators\FromLettuceDataSources.cs -->

# FromLettuceDataSources

Generates data from the enumerable of data sources it receives that is in `Lettuce` file format, presumes all items in the enumerable are deserialized into <see cref="SerializationType.Json"/>

## What it does

Generates data from the enumerable of data sources it receives that is in `Lettuce` file format, presumes all items in the enumerable are deserialized into <see cref="SerializationType.Json"/> See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: FromLettuceDataSourcesSession
    Generators:
      - Name: FromLettuceDataSourcesStep
        DataSource: FromLettuceDataSources
        GeneratorConfiguration:
        Count:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | generators |
| **YAML key** | `FromLettuceDataSources` |
| **Schema** | [`generators.schema.json`](../../../_generated/schemas/generators.md) |
| **Source** | `QaaS.Common.Generators\QaaS.Common.Generators\FromDataSourcesGenerators\FromLettuceDataSources.cs` |

## See also

- [generators index](../../index.md)
- [Custom generator authoring guide](../../custom-authoring-guide.md)
