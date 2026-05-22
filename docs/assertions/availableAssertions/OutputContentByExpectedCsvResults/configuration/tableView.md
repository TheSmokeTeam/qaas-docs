---
id: assertions.available.outputcontentbyexpectedcsvresults.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, OutputContentByExpectedCsvResults, configuration, reference]
summary: "Field-by-field reference for OutputContentByExpectedCsvResults AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json -->

# OutputContentByExpectedCsvResults — Configuration (table view)

Generated from `assertions.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  |  |
| `AssertionConfiguration.OutputName` | `string` | &#10004 |  | The name of the output to validate its items' content |
| `AssertionConfiguration.ResultsMetaDataStorageKey` | `null or string` | &#10006 |  | The storage key of the dataSource item of the results. If no key was provided, takes the first item of from the DataSource |
| `AssertionConfiguration.DataSourceName` | `null or string` | &#10006 |  | The name of the dataSource of the results item. If no name was provided, takes the first DataSource supplied |
| `AssertionConfiguration.ColumnNameToFieldPathMap` | `object or string` | &#10004 |  | The mapping for each column's name in the outputs results and its matchig field's path in the output json. |
| `AssertionConfiguration.JsonConverterType` | `integer or string` | &#10006 | Json | The type of json converter to use for converting the output items |
| `AssertionConfiguration.CompareRowsNotInOrder` | `boolean or string` | &#10006 | false | If true, rows can match expected results in any order instead of by their index |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
