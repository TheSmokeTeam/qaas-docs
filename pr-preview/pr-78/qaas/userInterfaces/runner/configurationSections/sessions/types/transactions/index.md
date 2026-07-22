# Transactions

> TL;DR — Transactions are communication actions that both send and receive data from the system. Every transaction creates both an Input and an Output in SessionData with its own name.

Transactions are communication actions that both send and receive data from the system. Every transaction creates both an `Input` and an `Output` in `SessionData` with its own name.

Transactions represent request/response actions. At runtime a transaction resolves configured data sources, serializes each input item when needed, calls the selected transactor, records the sent item as session `Input`, and records a response as session `Output` when the transactor returns one. Input and output items receive matching indexes so assertions can correlate a request with its response. Transactions can run in fixed iterations or loop mode, sleep between iterations, and stop early when the policy chain returns false.

Use this page for behavior and YAML shape. The same action can be built in C# with the [TransactionBuilder API](https://TheSmokeTeam.github.io/qaas-docs/qaas/functions/builders/transactions/index.md); that page is the function reference for the code-first surface.

**Table Property Path** - `Sessions[].Transactions[]`

## Input selection and empty GET requests

Transactions are data-driven by default. `DataSourceNames` and `DataSourcePatterns` select the input items, and the transaction sends one request for each selected item during each `Iterations` cycle. A selector that matches no runtime data sends no requests; multiple selected items each produce a request in every cycle.

When `SendEmptyRequest` is false, which is the default, at least one selector property must be present. Omitting both selector properties, setting both to `null`, or configuring only empty YAML sequences such as `DataSourceNames: []` fails validation. Empty YAML sequences are treated as absent during configuration binding, so use `SendEmptyRequest: true` when the transaction should send a request without input data. Code-first builders retain the legacy behavior in which a non-null empty selector array is accepted but produces no requests; it does not opt into a bodyless GET.

Set `SendEmptyRequest: true` to opt into one request with no entity body per `Iterations` cycle. Loop mode likewise sends one empty request per loop cycle, independently of available data sources. Empty-request mode has these constraints:

- The transaction must use `Http.Method: Get`; other HTTP methods and gRPC are rejected.
- `DataSourceNames` and `DataSourcePatterns` must be omitted, `null`, or empty. Any selector entry is rejected.
- `InputSerialize` must be omitted because there is no input body to serialize.

```yaml
Transactions:
  - Name: ReadHealth
    TimeoutMs: 5000
    Iterations: 2
    SendEmptyRequest: true
    Http:
      Method: Get
      BaseAddress: http://service.example
      Port: 8080
      Route: /health
```

The example sends exactly two bodyless `GET /health` requests. In code-first configuration, call `TransactionBuilder.WithEmptyRequest()` for the same behavior.

## Http

Sends an HTTP request and stores the HTTP response when one arrives. The protocol builds a fresh `HttpRequestMessage` for each retry, uses item metadata to override the configured URI or headers when present, captures the response body, status code, reason phrase, HTTP version, content headers, response headers, and trailing headers, and returns no output when the final attempt times out or fails with an HTTP transport exception.

**Table Property Path** - `Sessions[].Transactions[].Http`

```yaml
Http: {}
```

Data Structure

```yaml
Body: <byte[]>
MetaData:
  Http:
    Method: <string>
    Uri: <string>
```

```yaml
Body: <byte[]>
MetaData:
  Http:
    StatusCode: <int>
    ReasonPhrase: <string>
    Version: <string>
    Headers: <IDictionary<string, string>>
    TrailingHeaders: <IDictionary<string, string>>
```

## Grpc

Invokes a gRPC method with Protobuf message input and output. The protocol loads the configured assembly, resolves the generated service client and RPC method, calls it with a deadline based on the action timeout, stores the returned `IMessage` as output, and returns no output when the call deadline is exceeded.

**Table Property Path** - `Sessions[].Transactions[].Grpc`

```yaml
Grpc: {}
```

Data Structure

```yaml
Body: <Google.Protobuf.IMessage>
```

```yaml
Body: <Google.Protobuf.IMessage>
```

## See also

- [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
