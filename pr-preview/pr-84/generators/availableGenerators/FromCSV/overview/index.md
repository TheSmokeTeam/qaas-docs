# FromCSV

> TL;DR — Reads CSV files from the configured file-system path and turns each row into generated data items.

## When to use

Reads rows from one or more CSV files in a local directory and emits one generated item per row.

It can use the file header row, or configured column names when the files are headerless. Empty rows can be skipped, surrounding whitespace can be trimmed, and the generator can stop after a fixed number of rows. When storage metadata is enabled, each generated item keeps track of where it came from in the file set.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

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

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/FromCSV/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/FromCSV/configuration/yamlView/index.md)
- [Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md)
