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

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use {: #when-to-use}

Use this page when you need the generated YAML shape for this configuration section and want every emitted field in one block.

## YAML configuration {: #yaml-configuration}

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example {: #minimal-example}

```yaml
Servers:
  -
    Grpc:
      Port: 0
      CertificatePassword: 'value'
      CertificatePath: 'value'
      InternalErrorTransactionStubName: 'value'
      IsLocalhost: False
      IsSecuredSchema: False
      NotFoundTransactionStubName: 'value'
      Services:
        -
          AssemblyName: 'value'
          ProtoNamespace: 'value'
          ServiceName: 'value'
          Actions:
            -
              RpcName: 'value'
              TransactionStubName: 'value'
              Name: 'value'
    Http:
      Port: 0
      CertificatePassword: 'value'
      CertificatePath: 'value'
      ConnectionAcceptanceValue: 128
      InternalErrorTransactionStubName: 'value'
      IsLocalhost: False
      IsSecuredSchema: False
      NotFoundTransactionStubName: 'value'
      Endpoints:
        -
          Path: 'value'
          FixedPath: 'value'
          Actions:
            -
              Method: 'Get'
              TransactionStubName: 'value'
              Name: 'value'
    Socket:
      BindingIpAddress: '0.0.0.0'
      ConnectionAcceptanceValue: 8
      Endpoints:
        -
          Port: 0
          ProtocolType: 'IP'
          TimeoutMs: 0
          AddressFamily: 'Unspecified'
          BufferSizeBytes: 65536
          LingerTimeSeconds: 0
          NagleAlgorithm: False
          SocketType: 'Stream'
          Action:
            Method: 'Collect'
            DataSourceName: 'value'
            Name: 'value'
            TransactionStubName: 'value'
```

## Realistic example {: #realistic-example}

Start with the minimal scaffold, replace placeholder values with project values, and keep only the optional branches that this configuration needs.

## Edge cases {: #edge-cases}

- Optional arrays are emitted as `[]`; add entries only when the section needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also {: #see-also}

- [Configuration table](tableView.md)
- [Overview](../overview.md)
