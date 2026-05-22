---
id: generators.available.fromcsv.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromCSV, configuration, reference]
summary: "Field-by-field reference for FromCSV GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json -->

# FromCSV — Configuration (table view)

Generated from `generators.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  |  |
| `GeneratorConfiguration.FileSystem` | `object or string` | &#10004 |  | File system directory configuration |
| `GeneratorConfiguration.FileSystem.Path` | `string` | &#10004 |  | The path of the directory containing the relevant files |
| `GeneratorConfiguration.FileSystem.SearchPattern` | `string` | &#10006 |  | The search string to match against the names of files in path. This parameter can contain a combination of valid literal path and wildcard (* and ?) characters, but it doesn't support regular expressions. |
| `GeneratorConfiguration.DataArrangeOrder` | `integer or string` | &#10004 |  | In which order to arrange the loaded data. Arranges data based of the key identifier of the item.  Options: [ `AsciiAsc` - orders by the ascii value ascending / `AsciiDesc` - orders by the ascii value descending / `FirstNumericalAsc` - orders by the first found numerical value in the string ascending /`FirstNumericalDesc` - orders by the first found numerical value in the string descending /'Unordered' - does not order the data ] |
| `GeneratorConfiguration.Count` | `integer or null or string` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |
| `GeneratorConfiguration.DataUuidRegexExpression` | `string` | &#10006 | .* | A regex expression to use for filtering data from the external source by their UUID, only items that match the regex will be taken |
| `GeneratorConfiguration.StorageMetaData` | `integer or string` | &#10006 | RelativePath | The way to store the name of the generated data as key in StorageMetaData. Options:[ `FullPath` - stores the full path of the item as the key / `RelativePath` - stores the relative path related to the prefix / `ItemName` - stores only the name of the item as the key / `None` - does not store the name of the item |
| `GeneratorConfiguration.Delimiter` | `string` | &#10004 | , | The delimiter used between columns in the CSV content. |
| `GeneratorConfiguration.HasHeaderRecord` | `boolean or string` | &#10006 | true | True when the first non-empty row contains the column names. |
| `GeneratorConfiguration.ColumnNames` | `array or null or string` | &#10006 |  | Column names to use when `HasHeaderRecord` is false. If omitted, names are auto-generated as `Column1`, `Column2`, and so on. |
| `GeneratorConfiguration.SkipEmptyRows` | `boolean or string` | &#10006 | true | True to skip rows whose fields are all empty or whitespace. |
| `GeneratorConfiguration.TrimWhiteSpace` | `boolean or string` | &#10006 | false | True to trim surrounding whitespace from parsed fields. |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
