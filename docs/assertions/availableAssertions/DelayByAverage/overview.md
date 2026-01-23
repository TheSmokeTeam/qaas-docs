# DelayByAverage

Delay checks the time interval between the inputs and outputs is not bigger than a configured number by subtracting the average timestamp of all inputs from the average timestamp of all the outputs.

## Assertion Parameters

* **Assertion Name** - `DelayByAverage`.
* **DataSources** - Not Used.
* **SessionData** - Single Session Support.

## Result Mapping

### Passed

* The average delay of all items in output `OutputName` minus average delay of all items in input `InputName` is higher than `MaximumNegativeDelayBufferMs` and lower than `MaximumDelayMs`.
* No items arrived in output `OutputName`.

### Failed

* The average delay of all items in output `OutputName` minus average delay of all items in input `InputName` is higher than `MaximumDelayMs`.

### Broken

* The input `InputName` contains no items.
* The average delay between the output `OutputName`'s items and input `InputName`'s items is negative and lower than the lower than `MaximumNegativeDelayBufferMs`.
* The output `OutputName` does not exist within the given session.
* The output `OutputName` exists more than once within the given session.
* The input `InputName` does not exist within the given session.
* The input `InputName` exists more than once within the given session.
* More than 1 session was passed to the assertion.
