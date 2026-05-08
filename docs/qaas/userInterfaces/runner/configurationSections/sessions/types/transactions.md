# Transactions

Transactions are communication actions that both send and receive data from the system. Every transaction creates both an `Input` and an `Output` in `SessionData` with its own name.

Transactions work in a synchronous request/response manner. Each request expects a matching response before the specified timeout expires. They manage serialization of the outbound data and deserialization of the inbound data, tracking headers, statuses, and performance latency.

**Table Property Path** - `Sessions[].Transactions[]`

## Http

Sends an HTTP request and stores the HTTP response when one arrives. It constructs the HTTP message including the method, URI, headers, and serialized body, and waits for the server to process it. The resulting HTTP status code, response phrase, and trailing headers are automatically extracted and recorded into the `Output` metadata for detailed assertions.

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

Invokes a gRPC remote procedure call method over HTTP/2. It serializes the input payload using Protobuf and communicates with the specified gRPC service using standard unary gRPC conventions. It intercepts and captures the returned Protobuf message as well as any associated gRPC metadata and trailers.

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
