# HermeticByExpectedOutputCountInRange

Checks for IO hermetics by comparing the count of multiple outputs in a given session with certain names to be between a given expected maximum limit and minimum limit.

## Assertion Parameters

* **Assertion Name** - `HermeticByExpectedOutputCountInRange`.
* **DataSources** - Not Used.
* **SessionData** - Single Session Support.

## Result Mapping

### Passed

* The sum of the counts of the outputs in `OutputNames` is bigger or equal to e `ExpectedMinimumCount` and lower or equal to `ExpectedMaximumCount`.

### Failed

* The sum of the counts of the outputs in `OutputNames` is not bigger or equal to  `ExpectedMinimumCount` or not and lower or equal to `ExpectedMaximumCount`.

### Broken

* One or more of the outputs in `OutputNames` do not exist within the given session.
* One or more of the outputs in `OutputNames` are exist more than once within the given session.
* More than 1 session was passed to the assertion.
