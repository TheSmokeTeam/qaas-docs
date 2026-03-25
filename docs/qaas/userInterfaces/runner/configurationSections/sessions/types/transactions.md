# Transactions

Transactions are communication actions that both send and receive data from the system. Every transaction creates both an `Input` and an `Output` in `SessionData` with its own name.

Transactions work in a request/response manner. Each request expects a matching response before the timeout expires.

**Table Property Path** - `Sessions[].Transactions[]`

## Http

Sends an HTTP request and stores the HTTP response when one arrives.

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

## Grpc

Invokes a gRPC method.

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
