---
id: generators.available.fromdatalake.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: [generators/availableGenerators/FromDataLake/overview.md]
code_langs: [yaml]
keywords: [generators, FromDataLake, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for FromDataLake GeneratorConfiguration — copy, fill the blanks, drop into a Session step."
tags: [generators]
canonical_url: /generators/availableGenerators/FromDataLake/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json
---

# FromDataLake — Configuration (YAML scaffold)

Drop this into the `GeneratorConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
GeneratorConfiguration:
  TrinoServerUri:
  Username:
  Password:
  ClientTag:
  Catalog:
  Query:
  ColumnsToIgnore: []
```
