---
id: generators.available.json.overview
slug: json
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [generators, Json, GeneratorConfiguration]
ai_summary: "Generates JSON data from a configured prototype document."
tags: [generators]
canonical_url: /generators/availableGenerators/Json/overview/
# Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\JsonGenerators\Json.cs
---

# Json

Generates JSON data from a configured prototype document.

## What it does

Generates JSON data from a configured prototype document. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: JsonSession
    Generators:
      - Name: JsonStep
        DataSource: Json
        GeneratorConfiguration:
        Count:
        JsonFieldReplacements: []
        OutputObjectType:
        OutputObjectTypeConfiguration:
          AssemblyName:
          TypeFullName:
        JsonDataSourceName:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | generators |
| **YAML key** | `Json` |
| **Schema** | [`generators.schema.json`](../../../_generated/schemas/generators.md) |
| **Source** | `QaaS.Common.Generators\QaaS.Common.Generators\JsonGenerators\Json.cs` |

## See also

- [generators index](../../index.md)
- [Custom generator authoring guide](../../custom-authoring-guide.md)
