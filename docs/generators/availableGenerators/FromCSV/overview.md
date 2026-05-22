---
id: generators.available.fromcsv.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromCSV, GeneratorConfiguration]
summary: "Reads CSV files from the configured file-system path and turns each row into generated data items."
---
<!-- Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromExternalSourceGenerators\FromCSV.cs -->

# FromCSV

Reads CSV files from the configured file-system path and turns each row into generated data items.

## What it does

Reads CSV files from the configured file-system path and turns each row into generated data items. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: FromCSVSession
    Generators:
      - Name: FromCSVStep
        DataSource: FromCSV
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


## Where it lives

| | |
|--|--|
| **Plugin family** | generators |
| **YAML key** | `FromCSV` |
| **Schema** | [`generators.schema.json`](../../../_generated/schemas/generators.md) |
| **Source** | `QaaS.Common.Generators\QaaS.Common.Generators\FromExternalSourceGenerators\FromCSV.cs` |

## See also

- [generators index](../../index.md)
- [Custom generator authoring guide](../../custom-authoring-guide.md)
