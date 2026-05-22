---
id: probes.available.emptyredisbychunks.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, EmptyRedisByChunks, yaml, scaffold]
summary: "Minimal YAML scaffold for EmptyRedisByChunks ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# EmptyRedisByChunks — Configuration (YAML scaffold)

Drop this into the `ProbeConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
ProbeConfiguration:
  RedisDataBase:
  HostNames: []
  Username:
  Password:
  AbortOnConnectFail:
  ConnectRetry:
  ClientName:
  AsyncTimeout:
  Ssl:
  SslHost:
  KeepAlive:
  BatchSize:
  KeyRegexPattern:
```
