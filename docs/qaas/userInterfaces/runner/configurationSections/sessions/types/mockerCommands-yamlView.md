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

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use {: #when-to-use}

Use this page when you need the generated YAML shape for this configuration section and want every emitted field in one block.

## YAML configuration {: #yaml-configuration}

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example {: #minimal-example}

```yaml
MockerCommands:
  -
    Name: 'value'
    ServerName: 'value'
    RequestDurationMs: 3000
    RequestRetries: 3
    Stage: 4
    Command:
      ChangeActionStub:
        ActionName: 'value'
        StubName: 'value'
      Consume:
        TimeoutMs: 0
        ActionName: 'value'
        InputDataFilter:
          Body: True
          MetaData: True
          Timestamp: True
        InputDeserialize:
          Deserializer: 'Binary'
          SpecificType:
            TypeFullName: 'value'
            AssemblyName: 'value'
        OutputDataFilter:
          Body: True
          MetaData: True
          Timestamp: True
        OutputDeserialize:
          Deserializer: 'Binary'
          SpecificType:
            TypeFullName: 'value'
            AssemblyName: 'value'
      TriggerAction:
        ActionName: 'value'
        TimeoutMs: 0
    Redis:
      Host: 'value'
      AbortOnConnectFail: True
      AsyncTimeoutMs: 5000
      ClientName: 'value'
      ConnectRetry: 3
      KeepAliveSeconds: 60
      Password: 'value'
      RedisDataBase: 0
      Ssl: False
      SslHost: 'value'
      Username: 'value'
```

## Realistic example {: #realistic-example}

Start with the minimal scaffold, replace placeholder values with project values, and keep only the optional branches that this configuration needs.

## Edge cases {: #edge-cases}

- Optional arrays are emitted as `[]`; add entries only when the section needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also {: #see-also}

- [Configuration table](mockerCommands-tableView.md)
- [Overview](../overview.md)
