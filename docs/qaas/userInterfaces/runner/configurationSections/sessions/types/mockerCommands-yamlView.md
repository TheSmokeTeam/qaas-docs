---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.mockercommands-yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Mocker command YAML scaffold for controlling mocker servers during a Runner session."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Mocker Commands Configurations Yaml View

> TL;DR: Mocker command YAML scaffold for controlling mocker servers during a Runner session.

```yaml
MockerCommands:
  - Name: "value"
    ServerName: "value"
    RequestDurationMs: "${value}"
    RequestRetries: "${value}"
    Stage: "${value}"
    Command:
      ChangeActionStub:
        ActionName: "value"
        StubName: "value"
      Consume:
        TimeoutMs: "${value}"
        ActionName: "value"
        InputDataFilter:
          Body: "${value}"
          MetaData: "${value}"
          Timestamp: "${value}"
        InputDeserialize:
          Deserializer: "Binary"
          SpecificType:
            TypeFullName: "value"
            AssemblyName: "value"
        OutputDataFilter:
          Body: "${value}"
          MetaData: "${value}"
          Timestamp: "${value}"
        OutputDeserialize:
          Deserializer: "Binary"
          SpecificType:
            TypeFullName: "value"
            AssemblyName: "value"
      TriggerAction:
        ActionName: "value"
        TimeoutMs: "${value}"
    Redis:
      Host: "value"
      AbortOnConnectFail: "${value}"
      AsyncTimeoutMs: "${value}"
      ClientName: "value"
      ConnectRetry: "${value}"
      KeepAliveSeconds: "${value}"
      Password: "value"
      RedisDataBase: "${value}"
      Ssl: "${value}"
      SslHost: "value"
      Username: "value"
    Configuration:
      ChangeActionStub:
        ActionName: "value"
        StubName: "value"
      Consume:
        TimeoutMs: "${value}"
        ActionName: "value"
        InputDataFilter:
          Body: "${value}"
          MetaData: "${value}"
          Timestamp: "${value}"
        InputDeserialize:
          Deserializer: "Binary"
          SpecificType:
            TypeFullName: "value"
            AssemblyName: "value"
        OutputDataFilter:
          Body: "${value}"
          MetaData: "${value}"
          Timestamp: "${value}"
        OutputDeserialize:
          Deserializer: "Binary"
          SpecificType:
            TypeFullName: "value"
            AssemblyName: "value"
      TriggerAction:
        ActionName: "value"
        TimeoutMs: "${value}"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
