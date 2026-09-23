---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.transactions
type: reference
status: stable
since: 2.0.0
last_verified: 2026-09-23
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Transactions are communication actions that both send and receive data from the system. Every transaction creates both an Input and an Output in SessionData with its own name."
---
# Transactions

> TL;DR — Transactions are communication actions that both send and receive data from the system. Every transaction creates both an Input and an Output in SessionData with its own name.

Transactions are communication actions that both send and receive data from the system. Every transaction creates both an `Input` and an `Output` in `SessionData` with its own name.

Transactions represent request/response actions. At runtime a transaction resolves configured data sources, serializes each input item when needed, calls the selected transactor, records the sent item as session `Input`, and records a response as session `Output` when the transactor returns one. Input and output items receive matching indexes so assertions can correlate a request with its response. Transactions can run in fixed iterations or loop mode, sleep between iterations, and stop early when the policy chain returns false.

Use this page for behavior and YAML shape. The same action can be built in C# with the [TransactionBuilder API](../../../../../../qaas/functions/builders/transactions.md); that page is the function reference for the code-first surface.

**Table Property Path** - `Sessions[].Transactions[]`

## Input selection and empty GET requests {: #input-selection-and-empty-get-requests}

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

## Http {: #http}

Sends an HTTP request and stores the HTTP response when one arrives. The protocol builds a fresh `HttpRequestMessage` for each retry, uses item metadata to override the configured URI or headers when present, captures the response body, status code, reason phrase, HTTP version, content headers, response headers, and trailing headers, and returns no output when the final attempt times out or fails with an HTTP transport exception.

**Table Property Path** - `Sessions[].Transactions[].Http`

```yaml
Http: {}
```

### Released metadata contract {: #released-http-metadata}

Verified against Framework 1.6.4 and Runner 4.8.2. Item metadata is returned by a generator as `Data<object>.MetaData.Http`; it is not a set of extra properties under YAML `Sessions[].Transactions[].Http`. Configuration schemas describe the action configuration, not the SDK data record.

| SDK field | Outgoing Runner request | Captured Runner response |
| --- | --- | --- |
| `Uri` | Absolute destination override, including path and query | Not populated in 1.6.4 |
| `Headers` | Content headers; non-null replaces the configured content-header dictionary | Response content headers |
| `RequestHeaders` | Request headers; non-null replaces the configured request-header dictionary | Not populated |
| `ResponseHeaders` | Not a request option | Response headers other than content headers |
| `StatusCode` | Not a request option | Response status |
| `ReasonPhrase` | Not a request option | Response reason phrase |
| `Version` | Not a request version selector | Observed response version |
| `TrailingHeaders` | Not sent as request trailers | Response trailers, after reading the body |
| `PathParameters` | Ignored in 1.6.4 | Not populated; Mocker uses it for incoming route captures |

A null header dictionary inherits configuration; an empty dictionary removes that category's configured defaults. This does not remove client-level JWT authentication; explicitly supply `Authorization` to override it. Place `Content-Type` in `Headers`, not `RequestHeaders`. Invalid header names, values, or categories fail validation in the HTTP client rather than being silently moved. Header values are captured as comma-joined strings; this representation is not a lossless multivalue-header round trip.

The previously documented per-item `Method` did **not** exist in Framework 1.6.4. That release also has no item `Route` or `QueryParameters`. Use an absolute `Uri` per message for both generated path values and dynamic routes:

```csharp
var baseUri = new Uri("http://service.example:8080/");
var http = new Http
{
    Uri = new Uri(baseUri, $"users/{Uri.EscapeDataString(userId)}")
};
// Or select a whole route: new Uri(baseUri, "orders")
```

Use a trailing slash on `baseUri`; a leading slash on the relative route replaces the base path. Encode parameter values, not the entire route. For query values, build the query with a URI/query builder and put the resulting absolute URI in `Http.Uri`.

### Native metadata support (unreleased) {: #native-http-metadata}

The HTTP metadata contract change adds the following behavior. It requires the updated **SDK and Protocols together**, followed by a Runner dependency update/release. Existing published packages and schema downloads do not gain these capabilities by editing YAML.

```csharp
new Http
{
    Route = "users/{id}",
    PathParameters = new Dictionary<string, string> { ["id"] = userId },
    QueryParameters = new Dictionary<string, string> { ["page"] = "2" },
    Method = "PATCH"
};
```

- Destination precedence: `Uri` wins over item `Route`, which wins over configured `Route`. An explicit URI bypasses path substitution, including when replaying captured metadata. Relative `Uri` values resolve against the configured base **directory** using normal URI resolution.
- Routes append to the configured base path with one boundary slash. An absolute or authority-relative route is rejected; use `Uri` when changing the destination authority. An explicit configured port overrides the base URI's port; `Port: null` preserves it. The configured default remains 8080.
- `{name}` placeholders are substituted only in the path. Values are unescaped strings and are encoded as individual segments. Missing/null values and literal `.` or `..` segments fail before network I/O; extra dictionary keys are allowed. Query text is not a path template.
- `QueryParameters` are encoded and appended to the selected destination, including an explicit `Uri`. Existing pairs are retained, including duplicate keys. Null/empty dictionaries add nothing; empty string values are allowed, null values are rejected. The dictionary cannot itself represent repeated keys.
- Null `Method` inherits the action method. Other values must be valid HTTP method tokens. Each retry resolves metadata into a fresh request without changing shared configuration or the metadata dictionary. Configured `Head`, `Patch`, and `Options` are supported in addition to the existing methods.
- Response metadata also captures the effective request `Uri` and `Method`. `Version`, status and response header fields remain observations, not outgoing request controls.
- `Retries` counts total attempts, including the first. HTTP error statuses are returned as responses; only transport exceptions and timeouts trigger retries. Invalid metadata fails before sending.

## Grpc {: #grpc}

Invokes a gRPC method with Protobuf message input and output. The protocol loads the configured assembly, resolves the generated service client and RPC method, calls it with a deadline based on the action timeout, stores the returned `IMessage` as output, and returns no output when the call deadline is exceeded.

**Table Property Path** - `Sessions[].Transactions[].Grpc`

```yaml
Grpc: {}
```

???- info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <Google.Protobuf.IMessage>
        ```
    === ":octicons-file-code-16: `Output`"
        ```yaml
        Body: <Google.Protobuf.IMessage>
        ```

## See also {: #see-also}

- [Sessions](../overview.md)
