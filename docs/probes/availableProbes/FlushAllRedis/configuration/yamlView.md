---
id: probes.available.flushallredis.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: [probes/availableProbes/FlushAllRedis/overview.md]
code_langs: [yaml]
keywords: [probes, FlushAllRedis, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for FlushAllRedis ProbeConfiguration — copy, fill the blanks, drop into a Session step."
tags: [probes]
canonical_url: /probes/availableProbes/FlushAllRedis/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json
---

# FlushAllRedis — Configuration (YAML scaffold)

Drop this into the `ProbeConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
ProbeConfiguration:
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
```
