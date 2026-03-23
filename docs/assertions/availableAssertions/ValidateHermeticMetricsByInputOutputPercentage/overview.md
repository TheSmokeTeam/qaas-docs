# ValidateHermeticMetricsByInputOutputPercentage

Checks that hermetic percentage calculated by given input and outputs is equal to hermetic percentage calculated by the `Metrics Hermetics Formula`.

## Assertion Parameters

* **Assertion Name** - `ValidateHermeticMetricsByInputOutputPercentage`.
* **DataBindings** - Not Used.
* **SessionData** - Single Session Support.

## Result Mapping

### Passed

* The percentage of the inputs in `InputNames` from the outputs in `OutputNames` is equal to the hermetic percentage calculated by the `Metrics Hermetics Formula` within the given tolerance.

### Failed

* The percentage of the inputs in `InputNames` from the outputs in `OutputNames` does not equal the hermetic percentage calculated by the `Metrics Hermetics Formula` within the given tolerance.

### Broken

* `MetricOutputSourceName` does not contain valid metrics' format.
* One or more of the outputs in `OutputNames` do not exist within the given session.
* One or more of the outputs in `OutputNames` are exist more than once within the given session.
* One or more of the inputs in `InputNames` do not exist within the given session.
* One or more of the inputs in `InputNames` are exist more than once within the given session.
* More than 1 session was passed to the assertion.
