# Server

QaaS.Mocker can start one server through `Server` or multiple servers concurrently through `Servers`. Each server configuration must set `Type` to `Http`, `Grpc`, or `Socket`.

Do not configure both `Server` and `Servers` in the same file.

## Single Server

Use `Server` when you need one runtime:

```yaml
Server:
  Type: Http
  Http: {}
```

## Multiple Servers

Use `Servers` when you want one process to host several runtimes:

```yaml
Servers:
  - Type: Http
    Http: {}
  - Type: Socket
    Socket: {}
```

When `Servers` is used, action names must be unique across all configured servers. For gRPC actions, if `Actions[].Name` is omitted, the effective name used for uniqueness is `<ServiceName>.<RpcName>`.

## HTTP / HTTPS

`Http` hosts path-based endpoints and maps each HTTP method to a transaction stub.

- `IsSecuredSchema: true` requires `CertificatePath`
- relative certificate paths are resolved from the current working directory
- endpoint paths support literal segments and path parameters such as `/orders/{id}`
- endpoint paths are validated and conflicting path patterns are rejected
- action names must be unique within the HTTP server
- unknown routes fall back to `NotFoundTransactionStubName` or the built-in `DefaultNotFoundTransaction`
- processor failures fall back to `InternalErrorTransactionStubName` or the built-in `DefaultInternalErrorTransaction`

Example:

```yaml
Server:
  Type: Http
  Http:
    Port: 8080
    Endpoints:
      - Path: /health
        Actions:
          - Name: HealthAction
            Method: Get
            TransactionStubName: HealthStub
```

## gRPC / gRPCs

`Grpc` hosts gRPC services and binds each RPC method to a transaction stub.

- `IsSecuredSchema: true` requires `CertificatePath`
- relative certificate paths are resolved from the current working directory
- `ServiceName`, `ProtoNamespace`, and `AssemblyName` must point at generated gRPC types that are available at runtime
- `Services[].Actions[].RpcName` values must be unique within the same service
- if you plan to target actions through the controller or Runner commands, give the actions explicit names
- unknown RPC calls fall back to `NotFoundTransactionStubName` or the built-in `DefaultNotFoundTransaction`
- processor failures fall back to `InternalErrorTransactionStubName` or the built-in `DefaultInternalErrorTransaction`

Example:

```yaml
Server:
  Type: Grpc
  Grpc:
    Port: 50051
    Services:
      - ServiceName: EchoService
        ProtoNamespace: MyCompany.MyMock.Grpc
        AssemblyName: MyCompany.MyMock
        Actions:
          - Name: EchoAction
            RpcName: Echo
            TransactionStubName: EchoStub
```

## Socket

`Socket` hosts TCP or UDP endpoints and binds each endpoint to a socket action.

- the supported protocol and socket-type pairs are `Tcp` + `Stream` and `Udp` + `Dgram`
- `Broadcast` is not supported over UDP
- `Action.DataSourceName` is required when `Action.Method` is `Broadcast`
- `Collect` actions are enabled by default
- `Broadcast` actions stay disabled until they are triggered through the controller
- `TransactionStubName` is optional for socket actions; when omitted, the payload passes through unchanged

Example:

```yaml
Server:
  Type: Socket
  Socket:
    BindingIpAddress: 127.0.0.1
    Endpoints:
      - Port: 7001
        ProtocolType: Tcp
        SocketType: Stream
        TimeoutMs: 1000
        BufferSizeBytes: 2048
        Action:
          Name: SocketCollectAction
          Method: Collect
          TransactionStubName: ExampleStub
```
