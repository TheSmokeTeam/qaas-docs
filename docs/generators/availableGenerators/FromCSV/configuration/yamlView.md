---
id: generators.available.fromcsv.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: [generators/availableGenerators/FromCSV/overview.md]
code_langs: [yaml]
keywords: [generators, FromCSV, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for FromCSV GeneratorConfiguration — copy, fill the blanks, drop into a Session step."
tags: [generators]
canonical_url: /generators/availableGenerators/FromCSV/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json
---

# FromCSV — Configuration (YAML scaffold)

Drop this into the `GeneratorConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
GeneratorConfiguration:
  FileSystem:
    Path:
    SearchPattern:
  DataArrangeOrder:
  Count:
  DataUuidRegexExpression:
  StorageMetaData:
  Delimiter:
  HasHeaderRecord:
  ColumnNames: []
  SkipEmptyRows:
  TrimWhiteSpace:
```
