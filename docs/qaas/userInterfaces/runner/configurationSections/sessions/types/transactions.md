---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.transactions
type: reference
status: stable
since: 2.0.0
last_verified: 2026-11-04
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Transactions are communication actions that both send and receive data from the system. Every transaction creates both an Input and an Output in SessionData with its own name."
---
# Transactions

> TL;DR — Transactions are communication actions that both send and receive data from the system. Every transaction creates both an Input and an Output in SessionData with its own name.

Transactions are communication actions that both send and receive data from the system. Every transaction creates both an `Input` and an `Output` in `SessionData` with its own name.

Transactions represent request/response actions. At runtime a transaction resolves configured data sources, serializes each input item when needed, calls the selected transactor, records the sent item as session `Input`, and records a response as session `Output` when the transactor returns one. Input and output items receive matching indexes within each source pass. Transactions can run in fixed iterations or loop mode, sleep between iterations, and stop early when the policy chain returns false.

Use this page for behavior and YAML shape. The same action can be built in C# with the [TransactionBuilder API](../../../../../../qaas/functions/builders/transactions.md); that page is the function reference for the code-first surface.

**Table Property Path** - `Sessions[].Transactions[]`

## Parallel requests and stress workloads {: #parallel-requests}

Transactions support `Parallel.Parallelism` in YAML and `.WithParallelism(n)` in code. Omit `Parallel` for sequential execution. A positive value bounds concurrent request/response operations within one transaction action; each worker uses the same transactor instance. Separate transaction actions have separate limits and clients. Input order, start order and completion order can differ. IO match indexes identify pairs within one source pass and restart on each iteration; for looping or multi-iteration workloads, use an application correlation ID to identify requests across passes. Do not pair retained input and output by list position when responses can be absent.

Parallel transactions materialize the selected input for each pass before executing requests. Use finite data-source sequences; an infinite generator cannot finish that preparation. `Iterations` counts passes through the selected input, `Loop: true` repeats passes until a policy stops, and `SleepTimeMs` pauses between passes. `SendEmptyRequest: true` supplies one bodyless GET per pass, so raising the worker count does not multiply those requests. For concurrent GET load, use a finite multi-item source or multiple independently named empty-request actions.

This session fragment posts a reusable, nonempty `Requests` source containing byte-array request bodies. It permits up to eight request/response operations, targets 100 requests/s across the action, and stops through a 60-second policy:

```yaml
Sessions:
  - Name: HttpStress
    Transactions:
      - Name: PostRequests
        Stage: 0
        DataSourceNames: [Requests]
        TimeoutMs: 5000
        Loop: true
        Parallel:
          Parallelism: 8
        Policies:
          - LoadBalance:
              Rate: 100
              TimeIntervalMs: 1000
          - Timeout:
              TimeoutMs: 60000
        Http:
          Method: Post
          BaseAddress: https://api.example.com
          Port: 443
          Route: /events
          Retries: 1
          Headers:
            Content-Type: application/json
```

```csharp
using System.Collections.Generic;
using QaaS.Framework.Policies;
using QaaS.Framework.Policies.ConfigurationObjects;
using QaaS.Framework.Protocols.ConfigurationObjects.Http;
using QaaS.Runner.Sessions.Actions.Transactions.Builders;
using QaaS.Runner.Sessions.Session.Builders;

static SessionBuilder CreateHttpStressSession(string dataSourceName, string baseAddress)
{
    var transaction = new TransactionBuilder()
        .Named("PostRequests").AtStage(0)
        .AddDataSource(dataSourceName)
        .WithTimeout(5000).InLoops().WithParallelism(8)
        .AddPolicy(new PolicyBuilder().WithLoadBalance(
            new LoadBalancePolicyConfig { Rate = 100, TimeIntervalMs = 1000 }))
        .AddPolicy(new PolicyBuilder().WithTimeout(
            new TimeoutPolicyConfig { TimeoutMs = 60000 }))
        .Configure(new HttpTransactorConfig
        {
            Method = HttpMethods.Post, BaseAddress = baseAddress,
            Port = 443, Route = "/events", Retries = 1,
            Headers = new Dictionary<string, string> { ["Content-Type"] = "application/json" }
        });
    return new SessionBuilder().Named("HttpStress").AddTransaction(transaction);
}
```

The example requires the configured data source and a compatible HTTP endpoint; replace the address and authentication as needed. For gRPC, configure its generated client/method and Protobuf input instead of HTTP, with the same action-level parallelism and policies.

Policy evaluation is serialized across workers. `Rate` is an aggregate operation target for this action, not a per-worker target. Count and rate policies count request/response operations, including operations that return no response. HTTP retries can issue multiple network attempts for one operation. An empty loop input performs no requests and does not reach policy evaluation. The timeout policy is checked after operations and does not cancel requests already in flight; `TimeoutMs` and protocol retry settings govern those calls. Operations in progress can finish after a stop condition fires.

For an unpaced capacity test, omit `LoadBalance` and retain a finite input/iteration count or stopping policy. Start with a small worker count, measure response latency and errors, and increase gradually. Multiple simultaneous actions multiply the total offered load. Runner retains inputs/outputs for assertions, so bound run duration and payload size as well as workers.

## Input selection and empty GET requests {: #input-selection-and-empty-get-requests}

Transactions are data-driven by default. `DataSourceNames` and `DataSourcePatterns` select the input items, and the transaction sends one request for each selected item during each `Iterations` cycle. A selector that matches no runtime data sends no requests; multiple selected items each produce a request in every cycle.

When `SendEmptyRequest` is false, which is the default, at least one selector property must be present. Omitting both selector properties, setting both to `null`, or configuring only empty YAML sequences such as `DataSourceNames: []` fails validation. Empty YAML sequences are treated as absent during configuration binding, so use `SendEmptyRequest: true` when the transaction should send a request without input data. A code-first builder accepts a non-null empty selector array, which produces no requests; it does not select a bodyless GET.

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

### Supported HTTP methods {: #supported-http-methods}

Set `Http.Method` to one of the configuration values below.

| HTTP method | `Http.Method` value |
| --- | --- |
| GET | `Get` |
| POST | `Post` |
| PUT | `Put` |
| DELETE | `Delete` |
| HEAD | `Head` |
| PATCH | `Patch` |
| OPTIONS | `Options` |

### HTTP metadata {: #released-http-metadata}

Per-item metadata is supplied by a generator as `Data<object>.MetaData.Http`; it is not a set of extra properties under YAML `Sessions[].Transactions[].Http`. Use package versions and matching schemas that expose the configured fields.

| SDK field | Outgoing Runner request | Captured Runner response |
| --- | --- | --- |
| `Uri` | Destination override, including path and query | Effective request URI |
| `Route` | Route override when `Uri` is absent | Not populated |
| `Method` | HTTP method token override | Effective request method |
| `Headers` | Content headers; non-null replaces the configured dictionary | Response content headers |
| `RequestHeaders` | Request headers; non-null replaces the configured dictionary | Not populated |
| `ResponseHeaders` | Not a request option | Response headers other than content headers |
| `StatusCode` | Not a request option | Response status |
| `ReasonPhrase` | Not a request option | Response reason phrase |
| `Version` | Not a request version selector | Observed response version |
| `TrailingHeaders` | Not sent as request trailers | Response trailers after reading the body |
| `PathParameters` | Values for route placeholders | Not populated |
| `QueryParameters` | Encoded query pairs appended to the destination | Not populated |

A null header dictionary inherits configuration; an empty dictionary removes that category's configured defaults. Client-level JWT authentication is separate; explicitly supply `Authorization` to override it. Place `Content-Type` in `Headers`, not `RequestHeaders`. Invalid header names, values or categories fail validation in the HTTP client. Captured comma-joined header strings do not represent a lossless multivalue-header round trip.

### Destination and method selection {: #native-http-metadata}

A generator can select the destination, method and parameter values for each item:

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
- Routes append to the configured base path with one boundary slash. An absolute or authority-relative route is rejected; use `Uri` when changing the destination authority. An explicit configured port overrides the base URI's port; `Port: null` uses the port from `BaseAddress`. The configured default is 8080.
- `{name}` placeholders are substituted only in the path. Values are unescaped strings and are encoded as individual segments. Missing/null values and path-parameter values exactly equal to `.` or `..` fail before network I/O; extra dictionary keys are allowed. This check applies to substituted `PathParameters` values. Literal dot segments in `Route` are not rejected and may be normalized by URI resolution, so validate dynamic routes separately when they must stay under the configured base path. Query text is not a path template.
- `QueryParameters` are encoded and appended to the selected destination, including an explicit `Uri`. Existing pairs are retained, including duplicate keys. Null/empty dictionaries add nothing; empty string values are allowed, null values are rejected. The dictionary cannot itself represent repeated keys.
- Null `Method` inherits the action method. Other values must be valid HTTP method tokens. Each retry resolves metadata into a fresh request without changing shared configuration or the metadata dictionary. The configured method applies when item `Method` is null.
- Response metadata also captures the effective request `Uri` and `Method`. `Version`, status and response header fields remain observations, not outgoing request controls.
- `Retries` counts total attempts, including the first. HTTP error statuses are returned as responses; only transport exceptions and timeouts trigger retries. Invalid metadata fails before sending.

### HTTP PATCH {: #http-patch}

Configure an HTTP PATCH transaction with the content type required by the endpoint:

```yaml
Http:
  Method: Patch
  BaseAddress: https://api.example.com
  Port: 443
  Route: /items/42
  Headers:
    Content-Type: application/merge-patch+json
```

Supply the patch document through the transaction's selected data source and
input serializer. The request sends that payload with the configured content
headers and request headers, and captures the response body and status metadata.
Use `application/json-patch+json` when the API expects a JSON Patch operations
array instead of a Merge Patch document. The per-message metadata override
`MetaData.Http.Method = "PATCH"` selects PATCH for an individual item. Retry
settings behave as described above for the HTTP transactor.

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
