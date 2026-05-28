---
id: probes.available.executerediscommand.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, ExecuteRedisCommand, yaml, scaffold]
summary: "Minimal YAML scaffold for ExecuteRedisCommand ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# ExecuteRedisCommand Configurations Yaml View

> TL;DR: Minimal YAML scaffold for ExecuteRedisCommand ProbeConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example {: #minimal-example}

```yaml
ProbeConfiguration:
  Command: "value"
  AbortOnConnectFail: "${value}"
  AsyncTimeout: "${value}"
  ClientName: "value"
  ConnectRetry: "${value}"
  KeepAlive: "${value}"
  Password: "value"
  RedisDataBase: "${value}"
  Ssl: "${value}"
  SslHost: "value"
  StoreResultAs: "value"
  UseGlobalDict: "${value}"
  Username: "value"
  HostNames:
    - "value"
  Arguments:
    - "value"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
