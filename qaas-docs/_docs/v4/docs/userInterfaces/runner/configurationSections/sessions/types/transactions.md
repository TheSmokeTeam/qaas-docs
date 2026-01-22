# Transactions

Transactions are communication actions that both send and receive data from the system. Every transaction will create both an `Input` by its name and an `Output` by its name in the `SessionData`.

Transactions work in a request/response manner where for every request there must be a matching response, If a request doesn't get a response in time it assumed that response will not arrive and does not save anything to the `Output` for that request.

**Table Property Path** - `Sessions[].Transactions[]`

## HttpPost

Sends an http post request.

**Table Property Path** - `Sessions[].Transactions[].HttpPost`

```yaml
HttpPost: {}
```

???- info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <byte[]>
        ```
    === ":octicons-file-code-16: `Output`"
        ```yaml
        Body: <byte[]>
        MetaData:
            Http:
                StatusCode: <int> # The status code of the HTTP response.
                ReasonPhrase: <string> # The reason phrase sent by the server.
                Version: <string> # The HTTP message version. The default is 1.1.
                Headers: <IDictionary<string, string>> # The collection of HTTP response headers.
                TrailingHeaders: <IDictionary<string, string>> # The collection of trailing headers in the HTTP response.
        ```

## HttpPut

Sends an http put request.

**Table Property Path** - `Sessions[].Transactions[].HttpPut`

```yaml
HttpPut: {}
```

???- info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <byte[]>
        ```
    === ":octicons-file-code-16: `Output`"
        ```yaml
        Body: <byte[]>
        MetaData:
            Http:
                StatusCode: <int> # The status code of the HTTP response.
                ReasonPhrase: <string> # The reason phrase sent by the server.
                Version: <string> # The HTTP message version. The default is 1.1.
                Headers: <IDictionary<string, string>> # The collection of HTTP response headers.
                TrailingHeaders: <IDictionary<string, string>> # The collection of trailing headers in the HTTP response.
        ```

## HttpGet

Sends an http get request.

**Table Property Path** - `Sessions[].Transactions[].HttpGet`

```yaml
HttpGet: {}
```

???- info "Data Structure"
    === ":octicons-file-code-16: `Input`"
        ```yaml
        Body: <byte[]>
        ```
    === ":octicons-file-code-16: `Output`"
        ```yaml
        Body: <byte[]>
        MetaData:
            Http:
                StatusCode: <int> # The status code of the HTTP response.
                ReasonPhrase: <string> # The reason phrase sent by the server.
                Version: <string> # The HTTP message version. The default is 1.1.
                Headers: <IDictionary<string, string>> # The collection of HTTP response headers.
                TrailingHeaders: <IDictionary<string, string>> # The collection of trailing headers in the HTTP response.
        ```

## Grpc

Invokes a Grpc Method.

**Table Property Path** - Sessions[].Transactions[].Grpc`

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
