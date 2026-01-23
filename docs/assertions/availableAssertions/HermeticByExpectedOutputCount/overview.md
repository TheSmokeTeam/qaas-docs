# HermeticByExpectedOutputCount

Checks for IO hermetics by comparing the count of multiple outputs in a given session with certain names to a given expected count.

## Assertion Parameters

* **Assertion Name** - `HermeticByExpectedOutputCount`.
* **DataSources** - Not Used.
* **SessionData** - Single Session Support.

## Result Mapping

### Passed

* The sum of the counts of the outputs in `OutputNames` is equal to the `ExpectedCount`.

### Failed

* The sum of the counts of the outputs in `OutputNames` is not equal to the `ExpectedCount`.

### Broken

* One or more of the outputs in `OutputNames` do not exist within the given session.
* One or more of the outputs in `OutputNames` are exist more than once within the given session.
* More than 1 session was passed to the assertion.
