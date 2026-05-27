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

# EmptyRedisByChunks Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use {: #when-to-use}

Use this page when you need a starting YAML shape for this hook configuration and want all generated fields in one block.

## YAML configuration {: #yaml-configuration}

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example {: #minimal-example}

```yaml
ProbeConfiguration:
  AbortOnConnectFail: True
  AsyncTimeout: 5000
  BatchSize: 100
  ClientName: 'value'
  ConnectRetry: 3
  KeepAlive: 60
  KeyRegexPattern: 'value'
  Password: 'value'
  RedisDataBase: 0
  Ssl: False
  SslHost: 'value'
  UseGlobalDict: False
  Username: 'value'
  HostNames:
    - 'value'
```

## Realistic example {: #realistic-example}

Start with the minimal scaffold, replace placeholder values with project values, and combine it with the surrounding hook entry shown on the overview page.

## Edge cases {: #edge-cases}

- Optional arrays are emitted as `[]`; add entries only when the hook needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also {: #see-also}

- [Configuration table](tableView.md)
- [Overview](../overview.md)
