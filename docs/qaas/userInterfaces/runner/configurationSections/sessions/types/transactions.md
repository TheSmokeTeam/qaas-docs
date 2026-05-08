# Transactions

Transactions are communication actions that both send and receive data from the system. Every transaction creates both an `Input` and an `Output` in `SessionData` with its own name.

Transactions are designed to model synchronous request/response interactions. The core logic of a transaction involves two distinct phases: transmission and reception. First, the transaction connects to the specified endpoint and transmits a serialized payload, effectively acting like a publisher. Once the data is sent, the transaction immediately transitions into a waiting state, holding the connection open until the target system processes the request and sends back a response. Upon receiving the response, the transaction acts like a consumer, extracting the returned payload, status codes, and metadata, and finally closing the exchange. The system strictly monitors these operations against configured timeouts, ensuring that unresponsive endpoints do not cause tests to hang indefinitely. This dual nature allows the Runner to rigorously assert that a system not only accepts a specific input but also correctly formulates and returns the expected synchronous output.

**Table Property Path** - `Sessions[].Transactions[]`

## Http

Sends an HTTP request and stores the HTTP response when one arrives. The core logic handles the intricacies of the HTTP protocol, managing the entire lifecycle of a standard web request. It takes the provided data, determines the appropriate HTTP method, and constructs a well-formed HTTP message complete with URI parameters, request headers, and the serialized body. The transaction then opens a connection to the target server and transmits the request. As it waits for the server to reply, it monitors the connection for any latency or disruption. When the server responds, the transaction's logic dissects the incoming HTTP response, extracting the specific HTTP status code, the reason phrase, and any headers or trailing headers returned by the server. All of this contextual metadata, along with the raw response body, is packaged into the transaction's Output, providing a comprehensive footprint of the web interaction for subsequent validation.

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

Invokes a gRPC remote procedure call method over an HTTP/2 connection. Unlike standard REST HTTP calls, the core logic of the gRPC transaction is highly specialized for binary serialization and strict interface contracts. The transaction takes the input data and utilizes Protobuf serialization to convert it into a highly optimized binary format. It then establishes an HTTP/2 connection to the gRPC server and invokes the specifically configured service and RPC method. The transaction's logic manages the underlying gRPC framing and handles the complexities of receiving the Protobuf-encoded response. It intercepts and captures the returned Protobuf message, carefully preserving any associated gRPC metadata and trailers that the server might append to the response. This enables the Runner to test complex microservice architectures that rely on strongly typed, high-performance RPC communications.

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
