# Servers Configurations YAML View

```yaml
Servers:
  - Http:
      Port:
      Endpoints:
        - Path:
          Actions:
            - Name:
              Method:
              TransactionStubName:
      IsSecuredSchema: false
      CertificatePath:
      CertificatePassword:
      IsLocalhost: false
      NotFoundTransactionStubName:
      InternalErrorTransactionStubName:
      ConnectionAcceptanceValue: 128

  - Grpc:
      Port:
      Services:
        - ServiceName:
          ProtoNamespace:
          AssemblyName:
          Actions:
            - Name:
              RpcName:
              TransactionStubName:
      IsSecuredSchema: false
      CertificatePath:
      CertificatePassword:
      IsLocalhost: false
      NotFoundTransactionStubName:
      InternalErrorTransactionStubName:

  - Socket:
      BindingIpAddress: 0.0.0.0
      ConnectionAcceptanceValue: 8
      Endpoints:
        - Port:
          ProtocolType:
          SocketType: Stream
          AddressFamily: InterNetwork
          BufferSizeBytes: 65536
          NagleAlgorithm: false
          LingerTimeSeconds:
          TimeoutMs:
          Action:
            Name:
            Method:
            DataSourceName:
            TransactionStubName:
```
