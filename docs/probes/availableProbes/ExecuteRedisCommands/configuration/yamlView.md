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
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# ExecuteRedisCommands Configurations Yaml View

> TL;DR: Minimal YAML scaffold for ExecuteRedisCommands ProbeConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example

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

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
