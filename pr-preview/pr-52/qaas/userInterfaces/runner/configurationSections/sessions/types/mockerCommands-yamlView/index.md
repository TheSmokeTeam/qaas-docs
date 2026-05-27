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

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
