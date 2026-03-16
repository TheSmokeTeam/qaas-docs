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
- endpoint paths are validated and conflicting path patterns are rejected
- action names must be unique within the HTTP server

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
- `Services[].Actions[].RpcName` values must be unique within the same service
- if you plan to target actions through the controller or Runner commands, give the actions explicit names

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

- `Broadcast` is not supported over UDP
- socket type must match protocol (`Tcp` + `Stream`, `Udp` + `Dgram`)
- `Action.DataSourceName` is required when `Action.Method` is `Broadcast`

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
