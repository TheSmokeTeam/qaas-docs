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

# Mocker Commands Configurations Yaml View

```yaml
MockerCommands:
  - Name:
    ServerName:
    RequestDurationMs:
    RequestRetries:
    Stage:
    Command:
      ChangeActionStub:
        ActionName:
        StubName:
      Consume:
        TimeoutMs:
        ActionName:
        InputDataFilter:
          Body:
          MetaData:
          Timestamp:
        InputDeserialize:
          Deserializer:
          SpecificType:
            TypeFullName:
            AssemblyName:
        OutputDataFilter:
          Body:
          MetaData:
          Timestamp:
        OutputDeserialize:
          Deserializer:
          SpecificType:
            TypeFullName:
            AssemblyName:
      TriggerAction:
        ActionName:
        TimeoutMs:
    Redis:
      Host:
      AbortOnConnectFail:
      AsyncTimeoutMs:
      ClientName:
      ConnectRetry:
      KeepAliveSeconds:
      Password:
      RedisDataBase:
      Ssl:
      SslHost:
      Username:
    Configuration:
      ChangeActionStub:
        ActionName:
        StubName:
      Consume:
        TimeoutMs:
        ActionName:
        InputDataFilter:
          Body:
          MetaData:
          Timestamp:
        InputDeserialize:
          Deserializer:
          SpecificType:
            TypeFullName:
            AssemblyName:
        OutputDataFilter:
          Body:
          MetaData:
          Timestamp:
        OutputDeserialize:
          Deserializer:
          SpecificType:
            TypeFullName:
            AssemblyName:
      TriggerAction:
        ActionName:
        TimeoutMs:
```
