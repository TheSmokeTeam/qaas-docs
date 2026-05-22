---
id: generators.available.fromfilesystem.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: [generators/availableGenerators/FromFileSystem/overview.md]
code_langs: [yaml]
keywords: [generators, FromFileSystem, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for FromFileSystem GeneratorConfiguration — copy, fill the blanks, drop into a Session step."
tags: [generators]
canonical_url: /generators/availableGenerators/FromFileSystem/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json
---

# FromFileSystem — Configuration (YAML scaffold)

Drop this into the `GeneratorConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
GeneratorConfiguration:
  DataArrangeOrder:
  Count:
  DataUuidRegexExpression:
  StorageMetaData:
  FileSystem:
    Path:
    SearchPattern:
```
