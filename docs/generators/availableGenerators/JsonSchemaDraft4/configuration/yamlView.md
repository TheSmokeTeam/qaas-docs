---
id: generators.available.jsonschemadraft4.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: [generators/availableGenerators/JsonSchemaDraft4/overview.md]
code_langs: [yaml]
keywords: [generators, JsonSchemaDraft4, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for JsonSchemaDraft4 GeneratorConfiguration — copy, fill the blanks, drop into a Session step."
tags: [generators]
canonical_url: /generators/availableGenerators/JsonSchemaDraft4/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json
---

# JsonSchemaDraft4 — Configuration (YAML scaffold)

Drop this into the `GeneratorConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
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
