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

> TL;DR: Reads CSV files from the configured file-system path and turns each row into generated data items.

Reads CSV files from the configured file-system path and turns each row into generated data items.

## What It Does

Reads rows from one or more CSV files in a local directory and emits one generated item per row.

It can use the file header row, or configured column names when the files are headerless. Empty rows can be skipped, surrounding whitespace can be trimmed, and the generator can stop after a fixed number of rows. When storage metadata is enabled, each generated item keeps track of where it came from in the file set.

## Minimal example

```yaml
DataSources:
  - Name: OrdersCsvRows
    Generator: FromCSV
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      Delimiter: ','
      HasHeaderRecord: false
      SkipEmptyRows: true
      TrimWhiteSpace: true
      ColumnNames:
        - orderId
        - total
      FileSystem:
        Path: sample-data/csv
        SearchPattern: '*.csv'
      StorageMetaData: ItemName
```

## Realistic example

This example reads every `*.csv` file under `sample-data/csv`, orders the files alphabetically, treats each line as a two-column record, and emits one generated item per row.

Because `HasHeaderRecord` is `false`, the first and second columns are exposed as `orderId` and `total`. Empty rows are ignored, whitespace is trimmed, and each emitted item keeps the source file name in its storage metadata.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
