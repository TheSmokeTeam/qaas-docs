# HttpStatus

Checks that all configured output's http status code is equal to a certain number.

## Assertion Parameters

* **Assertion Name** - `HttpStatus`.
* **DataSources** - Not Used.
* **SessionData** - Single Session Support.

## Result Mapping

### Passed

* All items in all outputs in `OutputNames` have an http status code equal to `StatusCode`.

### Failed

* Any item in any output in `OutputNames` has an http status code not equal to `StatusCode`.

### Broken

* Any item in any output in `OutputNames` does not have an http status code at all.
* One or more of the outputs in `OutputNames` do not exist within the given session.
* One or more of the outputs in `OutputNames` are exist more than once within the given session.
* More than 1 session was passed to the assertion.
