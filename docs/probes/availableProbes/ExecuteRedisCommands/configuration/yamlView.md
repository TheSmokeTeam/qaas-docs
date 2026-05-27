---
id: probes.available.executerediscommands.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, ExecuteRedisCommands, yaml, scaffold]
summary: "Minimal YAML scaffold for ExecuteRedisCommands ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---

# ExecuteRedisCommands Configurations Yaml View

```yaml
ProbeConfiguration:
  AbortOnConnectFail:
  AsyncTimeout:
  ClientName:
  ConnectRetry:
  KeepAlive:
  Password:
  RedisDataBase:
  Ssl:
  SslHost:
  UseGlobalDict:
  Username:
  Commands:
    - Command:
      StoreResultAs:
      Arguments: []
  HostNames: []
  RepeatUntil:
    ExpectedValue:
    ResultPath:
    MaxIterations:
```
