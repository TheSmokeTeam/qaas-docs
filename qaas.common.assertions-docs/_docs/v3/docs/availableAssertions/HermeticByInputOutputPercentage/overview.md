# HermeticByInputOutputPercentage

Checks for IO hermetics by comparing the count of multiple outputs in a given session with certain names to a given percentage of the count of multiple inputs in a given session with certain names.

## Assertion Parameters

* **Assertion Name** - `HermeticByInputOutputPercentage`.
* **DataSources** - Not Used.
* **SessionData** - Single Session Support.

## Result Mapping

### Passed

* The sum of the counts of the outputs in `OutputNames` is equal to the given `ExpectedPercentage` percentage of the sum of the counts of the inputs in `InputNames`.

### Failed

* The sum of the counts of the outputs in `OutputNames` is not equal to the given `ExpectedPercentage` percentage of the sum of the counts of the inputs in `InputNames`.

### Broken

* One or more of the outputs in `OutputNames` do not exist within the given session.
* One or more of the outputs in `OutputNames` are exist more than once within the given session.
* One or more of the inputs in `InputNames` do not exist within the given session.
* One or more of the inputs in `InputNames` are exist more than once within the given session.
* More than 1 session was passed to the assertion.
