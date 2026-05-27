# Servers Configurations Yaml View

```yaml
Servers:
  - Grpc:
    Port:
    CertificatePassword:
    CertificatePath:
    InternalErrorTransactionStubName:
    IsLocalhost:
    IsSecuredSchema:
    NotFoundTransactionStubName:
    Services:
      - AssemblyName:
        ProtoNamespace:
        ServiceName:
        Actions:
          - RpcName:
            TransactionStubName:
            Name:
    Http:
      Port:
      CertificatePassword:
      CertificatePath:
      ConnectionAcceptanceValue:
      InternalErrorTransactionStubName:
      IsLocalhost:
      IsSecuredSchema:
      NotFoundTransactionStubName:
      Endpoints:
        - Path:
          FixedPath:
          Actions:
            - Method:
              TransactionStubName:
              Name:
    Socket:
      BindingIpAddress:
      ConnectionAcceptanceValue:
      Endpoints:
        - Port:
          ProtocolType:
          TimeoutMs:
          AddressFamily:
          BufferSizeBytes:
          LingerTimeSeconds:
          NagleAlgorithm:
          SocketType:
          Action:
            Method:
            DataSourceName:
            Name:
            TransactionStubName:
```
