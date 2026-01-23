# DelayByChunks

Delay checks the time interval between the inputs and outputs is not bigger than a configured number by subtracting the timestamp of input chunks of a configured size from a timestamp of output chunks of a configured size, The timestamp of the chunks is calculated differently depending on the configuration. takes the chunks in ascending order (which will be the send/arrival order) from the configured input/output. `Warning`: This delay test only works on synchronous applications!

## Assertion Parameters

* **Assertion Name** - `DelayByChunks`.
* **DataSources** - Not Used.
* **SessionData** - Single Session Support.

## Result Mapping

### Passed

* The delay found in all chunks in output `OutputName` by subtracting the delay of their relevant chunk (the chunk in the same chronological order) from input `InputName` is higher than `MaximumNegativeDelayBufferMs` and lower than `MaximumDelayMs`.
* No items arrived in output `OutputName`.

### Failed

The delay found in any of the chunks in output `OutputName` by subtracting the delay of their relevant chunk (the chunk in the same chronological order) from input `InputName` is lower than `MaximumDelayMs`.

### Broken

* The input `InputName` contains no items.
* The delay between any of the output `OutputName`'s chunks and input `InputName`'s chunks is negative and lower than the lower than `MaximumNegativeDelayBufferMs`.
* The output `OutputName` does not exist within the given session.
* The output `OutputName` exists more than once within the given session.
* The input `InputName` does not exist within the given session.
* The input `InputName` exists more than once within the given session.
* More than 1 session was passed to the assertion.
