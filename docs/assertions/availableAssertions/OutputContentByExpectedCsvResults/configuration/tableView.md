<!-- generated hash:c646a69f8d33 sources:runner-family, OutputContentByExpectedCsvResults, table-view -->

# OutputContentByExpectedCsvResults Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  | Checks for all json items in a configured output that their content is valid according to a csv results file.The results file contains the expected value of fields in each json item and is provided from the configured DataSources.Expects the output items to be deserialized to any type of C# object that can be converted to Json.`DataSources`: Used for loading the csv results file.`Session Support`: Only supports a single session assertion. |
| `AssertionConfiguration.ColumnNameToFieldPathMap` | `object or string` | &#10004 |  | The mapping for each column's name in the outputs results and its matchig field's path in the output json. |
| `AssertionConfiguration.OutputName` | `string` | &#10004 |  | The name of the output to validate its items' content |
| `AssertionConfiguration.CompareRowsNotInOrder` | `string or true/false` | &#10006 | False | If true, rows can match expected results in any order instead of by their index |
| `AssertionConfiguration.DataSourceName` | `string or null` | &#10006 |  | The name of the dataSource of the results item. If no name was provided, takes the first DataSource supplied |
| `AssertionConfiguration.JsonConverterType` | `one of [Json / Xml / Object]` | &#10006 |  | The type of json converter to use for converting the output items |
| `AssertionConfiguration.ResultsMetaDataStorageKey` | `string or null` | &#10006 |  | The storage key of the dataSource item of the results. If no key was provided, takes the first item of from the DataSource |
