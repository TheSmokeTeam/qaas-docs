---
id: mocker.userinterfaces.mocker.configurationsections.server.configurations.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, userinterfaces, configurationsections, server, configurations, yamlview]
summary: "Server configuration YAML example."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\schema.json -->

# Servers Configurations Yaml View

> TL;DR: Server configuration YAML example.

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

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
