---
id: generators.available.fromdatalake.overview
slug: fromdatalake
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [generators, FromDataLake, GeneratorConfiguration]
ai_summary: "Retrieves rows from the configured data lake query and exposes each row as a generated JSON object."
tags: [generators]
canonical_url: /generators/availableGenerators/FromDataLake/overview/
# Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromDataLakeGenerator\FromDataLake.cs
---

# FromDataLake

Retrieves rows from the configured data lake query and exposes each row as a generated JSON object.

## What it does

Retrieves rows from the configured data lake query and exposes each row as a generated JSON object. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: FromDataLakeSession
    Generators:
      - Name: FromDataLakeStep
        DataSource: FromDataLake
        GeneratorConfiguration:
        TrinoServerUri:
        Username:
        Password:
        ClientTag:
        Catalog:
        Query:
        ColumnsToIgnore: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | generators |
| **YAML key** | `FromDataLake` |
| **Schema** | [`generators.schema.json`](../../../_generated/schemas/generators.md) |
| **Source** | `QaaS.Common.Generators\QaaS.Common.Generators\FromDataLakeGenerator\FromDataLake.cs` |

## See also

- [generators index](../../index.md)
- [Custom generator authoring guide](../../custom-authoring-guide.md)
