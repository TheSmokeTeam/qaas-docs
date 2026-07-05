---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.collectors-yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Collector YAML scaffold for session metrics and time-range collection."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Collectors Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use {: #when-to-use}

Use this page when you need the generated YAML shape for this configuration section and want every emitted field in one block.

## YAML configuration {: #yaml-configuration}

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example {: #minimal-example}

```yaml
Collectors:
  -
    Name: 'value'
    EndTimeReachedCheckIntervalMs: 1000
    CollectionRange:
      EndTimeMs: 0
      StartTimeMs: 0
    DataFilter:
      Body: True
      MetaData: True
      Timestamp: True
    Prometheus:
      Expression: 'value'
      Url: 'value'
      ApiKey: 'value'
      SampleIntervalMs: 30000
      TimeoutMs: 120000
```

## Realistic example {: #realistic-example}

Start with the minimal scaffold, replace placeholder values with project values, and keep only the optional branches that this configuration needs.

## Edge cases {: #edge-cases}

- Optional arrays are emitted as `[]`; add entries only when the section needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also {: #see-also}

- [Configuration table](collectors-tableView.md)
- [Overview](../overview.md)
