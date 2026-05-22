---
id: generators.available.jsonschemadraft4.overview
slug: jsonschemadraft4
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [generators, JsonSchemaDraft4, GeneratorConfiguration]
ai_summary: "Generates JSON data that conforms to a configured JSON Schema Draft 4 document."
tags: [generators]
canonical_url: /generators/availableGenerators/JsonSchemaDraft4/overview/
# Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\JsonGenerators\JsonSchemaDraft4.cs
---

# JsonSchemaDraft4

Generates JSON data that conforms to a configured JSON Schema Draft 4 document.

## What it does

Generates JSON data that conforms to a configured JSON Schema Draft 4 document. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: JsonSchemaDraft4Session
    Generators:
      - Name: JsonSchemaDraft4Step
        DataSource: JsonSchemaDraft4
        GeneratorConfiguration:
        Count:
        JsonFieldReplacements: []
        OutputObjectType:
        OutputObjectTypeConfiguration:
          AssemblyName:
          TypeFullName:
        JsonDataSourceName:
        Seed:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | generators |
| **YAML key** | `JsonSchemaDraft4` |
| **Schema** | [`generators.schema.json`](../../../_generated/schemas/generators.md) |
| **Source** | `QaaS.Common.Generators\QaaS.Common.Generators\JsonGenerators\JsonSchemaDraft4.cs` |

## See also

- [generators index](../../index.md)
- [Custom generator authoring guide](../../custom-authoring-guide.md)
