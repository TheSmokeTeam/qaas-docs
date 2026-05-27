# FromCSV Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  | Retrieves CSV rows from files in a configured path in the file system. `DataSources`: Not used. `SessionData`: Not used. |
| `GeneratorConfiguration.Delimiter` | `string` | &#10004 | , | The delimiter used between columns in the CSV content. |
| `GeneratorConfiguration.Count` | `integer or string or null` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |
| `GeneratorConfiguration.DataArrangeOrder` | `one of [AsciiAsc / AsciiDesc / FirstNumericalAsc / FirstNumericalDesc / Unordered]` | &#10006 |  | In which order to arrange the loaded data. Arranges data based of the key identifier of the item.  Options: [ `AsciiAsc` - orders by the ascii value ascending / `AsciiDesc` - orders by the ascii value descending / `FirstNumericalAsc` - orders by the first found numerical value in the string ascending /`FirstNumericalDesc` - orders by the first found numerical value in the string descending /'Unordered' - does not order the data ] |
| `GeneratorConfiguration.DataUuidRegexExpression` | `string` | &#10006 | .* | A regex expression to use for filtering data from the external source by their UUID, only items that match the regex will be taken |
| `GeneratorConfiguration.HasHeaderRecord` | `string or true/false` | &#10006 | True | True when the first non-empty row contains the column names. |
| `GeneratorConfiguration.SkipEmptyRows` | `string or true/false` | &#10006 | True | True to skip rows whose fields are all empty or whitespace. |
| `GeneratorConfiguration.StorageMetaData` | `one of [FullPath / RelativePath / ItemName / None]` | &#10006 |  | The way to store the name of the generated data as key in StorageMetaData. Options:[ `FullPath` - stores the full path of the item as the key / `RelativePath` - stores the relative path related to the prefix / `ItemName` - stores only the name of the item as the key / `None` - does not store the name of the item |
| `GeneratorConfiguration.TrimWhiteSpace` | `string or true/false` | &#10006 | False | True to trim surrounding whitespace from parsed fields. |
| `GeneratorConfiguration.ColumnNames` | `list or string or null` | &#10006 |  | Column names to use when `HasHeaderRecord` is false. If omitted, names are auto-generated as `Column1`, `Column2`, and so on. |
| `GeneratorConfiguration.ColumnNames[]` | `string` | &#10006 |  |  |
| `GeneratorConfiguration.FileSystem` | `object or string` | &#10004 |  | File system directory configuration |
| `GeneratorConfiguration.FileSystem.Path` | `string` | &#10004 |  | The path of the directory containing the relevant files |
| `GeneratorConfiguration.FileSystem.SearchPattern` | `string` | &#10006 |  | The search string to match against the names of files in path. This parameter can contain a combination of valid literal path and wildcard (* and ?) characters, but it doesn't support regular expressions. |
