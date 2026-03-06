# StatusCodeTransactionProcessor

## Purpose

`StatusCodeTransactionProcessor` returns an empty-bodied response with the configured HTTP status code. It is useful for negative-path and status-only endpoint behavior.

## Configuration Fields

| Field | Required | Description |
|---|---|---|
| `StatusCode` | yes | Response status code to return. |

## When To Use It

Use it when:

- the body does not matter and only the HTTP status matters
- you need predictable error-path responses such as `404`, `409`, or `500`
- a route should stay simple and declarative in YAML
