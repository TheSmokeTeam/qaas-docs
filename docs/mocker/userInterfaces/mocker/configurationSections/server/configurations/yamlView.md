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
      Port: "${value}"
      CertificatePassword: "value"
      CertificatePath: "value"
      InternalErrorTransactionStubName: "value"
      IsLocalhost: "${value}"
      IsSecuredSchema: "${value}"
      NotFoundTransactionStubName: "value"
      Services:
        - AssemblyName: "value"
          ProtoNamespace: "value"
          ServiceName: "value"
          Actions:
            - RpcName: "value"
              TransactionStubName: "value"
              Name: "value"
    Http:
      Port: "${value}"
      CertificatePassword: "value"
      CertificatePath: "value"
      ConnectionAcceptanceValue: "${value}"
      InternalErrorTransactionStubName: "value"
      IsLocalhost: "${value}"
      IsSecuredSchema: "${value}"
      NotFoundTransactionStubName: "value"
      Endpoints:
        - Path: "value"
          FixedPath: "value"
          Actions:
            - Method: "Get"
              TransactionStubName: "value"
              Name: "value"
    Socket:
      BindingIpAddress: "0.0.0.0"
      ConnectionAcceptanceValue: "${value}"
      Endpoints:
        - Port: "${value}"
          ProtocolType: "IP"
          TimeoutMs: "${value}"
          AddressFamily: "Unspecified"
          BufferSizeBytes: "${value}"
          LingerTimeSeconds: "${value}"
          NagleAlgorithm: "${value}"
          SocketType: "Stream"
          Action:
            Method: "Collect"
            DataSourceName: "value"
            Name: "value"
            TransactionStubName: "value"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
