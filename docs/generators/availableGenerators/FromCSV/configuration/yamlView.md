---
id: generators.available.fromcsv.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromCSV, yaml, scaffold]
summary: "Minimal YAML scaffold for FromCSV GeneratorConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json -->

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
