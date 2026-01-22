# OutputContentByExpectedCsvResults

Checks for all json items in a configured output that their content is valid according to a csv results file.
The results file contains the expected value of fields in each json item and is provided from the configured DataSources.
Expects the output items to be deserialized to any type of C# object that can be converted to Json.

## Assertion Parameters

* **Assertion Name** - `OutputContentByExpectedCsvResults`.
* **DataSources** - Used for loading the csv results file.
* **SessionData** - Only supports a single session assertion.

## Result Mapping

### Passed

* The content of all output items in output `OutputName` matched the expected results.
* No items arrived in output `OutputName`.

### Failed

* Empty and / or invalid output items arrived in output `OutputName`.

### Broken

* No data source was provided.
* No data source contains items.
* An item in output `OutputName` could not be converted into json.
* The output `OutputName` does not exist within the given session.
* The output `OutputName` exists more than once within the given session.
* More than 1 session was passed to the assertion.
* The storage key of the data source item that contains the results, does not exist.
* The amount of items in `OutputName` does not match the amount of results in the results file.
* `ColumnNameToFieldPathMap` contains column name that does not exist in the csv file.
* `ColumnNameToFieldPathMap` contains a field's path that is not found in Json of the output item.
* The error range that supplied in `ErrorRange` field validation configuration, could not be cast to double.
