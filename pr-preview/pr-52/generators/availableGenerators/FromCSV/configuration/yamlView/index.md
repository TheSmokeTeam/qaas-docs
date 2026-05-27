# FromCSV Configurations Yaml View

> TL;DR: Minimal YAML scaffold for FromCSV GeneratorConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example

```yaml
GeneratorConfiguration:
  Delimiter: ","
  Count: "${value}"
  DataArrangeOrder: "AsciiAsc"
  DataUuidRegexExpression: ".*"
  HasHeaderRecord: "${value}"
  SkipEmptyRows: "${value}"
  StorageMetaData: "FullPath"
  TrimWhiteSpace: "${value}"
  ColumnNames:
    - "value"
  FileSystem:
    Path: "value"
    SearchPattern: ""
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
