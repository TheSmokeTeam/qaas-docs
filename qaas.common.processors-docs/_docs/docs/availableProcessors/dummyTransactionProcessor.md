# DummyTransactionProcessor

## Purpose

`DummyTransactionProcessor` is a simple debugging processor. It expects the request body to be `byte[]`, encodes it as Base64, injects configured key/value pairs, and returns a JSON response with HTTP status code `200`.

## Configuration Fields

| Field | Required | Description |
|---|---|---|
| `DummyKey` | yes | JSON property name to include in the response body. |
| `DummyValue` | yes | Value to assign to `DummyKey`. |

## Returned Response Shape

The response body includes:

- the configured `DummyKey` / `DummyValue`
- `EncodedResponseBody` containing the Base64 request body
- `Parameters` copied from HTTP path parameters when present

Use this processor when you want a predictable echo-style response that still proves request data reached the mock correctly.
