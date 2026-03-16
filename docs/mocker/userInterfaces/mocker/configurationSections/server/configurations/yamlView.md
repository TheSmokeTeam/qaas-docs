# Server Configurations Yaml View

Use either `Server` or `Servers`. Each item under `Servers` uses the same schema as `Server`.

```yaml
Server:
  Type:
  Http:
    Port:
    Endpoints:
      - Path:
        Actions:
          - Name:
            Method:
            TransactionStubName:
    IsSecuredSchema:
    CertificatePath:
    CertificatePassword:
    IsLocalhost:
    NotFoundTransactionStubName:
    InternalErrorTransactionStubName:
    ConnectionAcceptanceValue:
  Grpc:
    Port:
    Services:
      - ServiceName:
        ProtoNamespace:
        AssemblyName:
        Actions:
          - Name:
            RpcName:
            TransactionStubName:
    IsSecuredSchema:
    CertificatePath:
    CertificatePassword:
    IsLocalhost:
    NotFoundTransactionStubName:
    InternalErrorTransactionStubName:
  Socket:
    BindingIpAddress:
    ConnectionAcceptanceValue:
    Endpoints:
      - Port:
        ProtocolType:
        SocketType:
        AddressFamily:
        BufferSizeBytes:
        NagleAlgorithm:
        LingerTimeSeconds:
        TimeoutMs:
        Action:
          Name:
          Method:
          DataSourceName:
          TransactionStubName:

Servers:
  - Type:
    Http: {}
    Grpc: {}
    Socket: {}
```
