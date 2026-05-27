# HttpStatus

> TL;DR: Performs a logic test on the http status of all selected outputs in a session by checking they all have the desired http status code

Performs a logic test on the http status of all selected outputs in a session by checking they all have the desired http status code

## What It Does

Reads every saved item in the configured output lists of a single session and verifies that each item carries the expected HTTP status code in its metadata.

If any output item is missing HTTP status metadata entirely, the assertion throws instead of silently ignoring it. When status codes are present but some do not match, the assertion fails and records both the unexpected status codes and the outputs where they appeared.

## Minimal example

```yaml
Sessions:
  - Name: SampleSession

Assertions:
  - Name: HttpStatusAssertion
    Assertion: HttpStatus
    SessionNames:
      - SampleSession

    AssertionConfiguration:
      StatusCode: 200
      OutputNames:
        - Reply
```

## Realistic example

This assertion checks the `Reply` output of `SampleSession` and expects every saved item to have HTTP status `200`.

If all items report `200`, the assertion passes. If any item reports a different status it fails with a detailed trace, and if any item has no HTTP status metadata at all it fails by exception because the status check cannot be trusted.

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
