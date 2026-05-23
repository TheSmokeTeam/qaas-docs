---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.transactions
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
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

## Http {: #http}

Sends an HTTP request and stores the HTTP response when one arrives. The protocol builds a fresh `HttpRequestMessage` for each retry, uses item metadata to override the configured URI or headers when present, captures the response body, status code, reason phrase, HTTP version, content headers, response headers, and trailing headers, and returns no output when the final attempt times out or fails with an HTTP transport exception.

**Table Property Path** - `Sessions[].Transactions[].Http`

```yaml
Http: {}
```

???- info "Data Structure"
    === ":octicons-file-code-16: `Input`"
    ```yaml
    Body: <byte[]>
    MetaData:
        Http:
            Method: <string>
            Uri: <string>
    ```
    === ":octicons-file-code-16: `Output`"
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
