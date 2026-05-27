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

# OutputContentByExpectedCsvResults Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  | Checks for all json items in a configured output that their content is valid according to a csv results file.The results file contains the expected value of fields in each json item and is provided from the configured DataSources.Expects the output items to be deserialized to any type of C# object that can be converted to Json.`DataSources`: Used for loading the csv results file.`Session Support`: Only supports a single session assertion. |
| `AssertionConfiguration.ColumnNameToFieldPathMap` | `object or string` | &#10004 |  | The mapping for each column's name in the outputs results and its matchig field's path in the output json. |
| `AssertionConfiguration.OutputName` | `string` | &#10004 |  | The name of the output to validate its items' content |
| `AssertionConfiguration.CompareRowsNotInOrder` | `string or true/false` | &#10006 | `False` | If true, rows can match expected results in any order instead of by their index |
| `AssertionConfiguration.DataSourceName` | `string or null` | &#10006 |  | The name of the dataSource of the results item. If no name was provided, takes the first DataSource supplied |
| `AssertionConfiguration.JsonConverterType` | `one of [Json / Xml / Object]` | &#10006 |  | The type of json converter to use for converting the output items |
| `AssertionConfiguration.ResultsMetaDataStorageKey` | `string or null` | &#10006 |  | The storage key of the dataSource item of the results. If no key was provided, takes the first item of from the DataSource |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
