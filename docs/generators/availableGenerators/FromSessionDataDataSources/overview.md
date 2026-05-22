---
id: generators.available.fromsessiondatadatasources.overview
slug: fromsessiondatadatasources
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [generators, FromSessionDataDataSources, GeneratorConfiguration]
ai_summary: "Generates data from the enumerable of data sources it receives, presumes all items in the enumerable are serialized and can be treated as a byte array"
tags: [generators]
canonical_url: /generators/availableGenerators/FromSessionDataDataSources/overview/
# Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromDataSourcesGenerators\FromSessionDataDataSources.cs
---

# FromSessionDataDataSources

Generates data from the enumerable of data sources it receives, presumes all items in the enumerable are serialized and can be treated as a byte array

## What it does

Generates data from the enumerable of data sources it receives, presumes all items in the enumerable are serialized and can be treated as a byte array See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: FromSessionDataDataSourcesSession
    Generators:
      - Name: FromSessionDataDataSourcesStep
        DataSource: FromSessionDataDataSources
        GeneratorConfiguration:

```


## Where it lives

| | |
|--|--|
| **Plugin family** | generators |
| **YAML key** | `FromSessionDataDataSources` |
| **Schema** | [`generators.schema.json`](../../../_generated/schemas/generators.md) |
| **Source** | `QaaS.Common.Generators\QaaS.Common.Generators\FromDataSourcesGenerators\FromSessionDataDataSources.cs` |

## See also

- [generators index](../../index.md)
- [Custom generator authoring guide](../../custom-authoring-guide.md)
