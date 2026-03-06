# HermeticByInputOutputPercentageInRange

Checks for IO hermetics by comparing the percentage of the count of multiple outputs in a given session with certain names to the count of multiple inputs in a given session with certain names, to expected maximum limit and expected minimum limit.

## Assertion Parameters

* **Assertion Name** - `HermeticByInputOutputPercentageInRange`.
* **DataSources** - Not Used.
* **SessionData** - Single Session Support.

## Result Mapping

### Passed

* The sum of the counts of the outputs in `OutputNames` devided by the sum of the counts of the inputs in `InputNames` is lower than the given `ExpectedMaximumPercentage` percentage and bigger than the given `ExpectedMinimumPercentage` percentage.

### Failed

* The sum of the counts of the outputs in `OutputNames` devided by the sum of the counts of the inputs in `InputNames` is not lower than the given `ExpectedMaximumPercentage` percentage or not bigger than the given `ExpectedMinimumPercentage` percentage.

### Broken

* One or more of the outputs in `OutputNames` do not exist within the given session.
* One or more of the outputs in `OutputNames` are exist more than once within the given session.
* One or more of the inputs in `InputNames` do not exist within the given session.
* One or more of the inputs in `InputNames` are exist more than once within the given session.
* More than 1 session was passed to the assertion.
