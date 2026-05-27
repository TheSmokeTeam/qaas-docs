---
id: probes.available.emptys3bucket.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, EmptyS3Bucket, yaml, scaffold]
summary: "Minimal YAML scaffold for EmptyS3Bucket ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# EmptyS3Bucket Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use {: #when-to-use}

Use this page when you need a starting YAML shape for this hook configuration and want all generated fields in one block.

## YAML configuration {: #yaml-configuration}

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example {: #minimal-example}

```yaml
ProbeConfiguration:
  AccessKey: 'value'
  SecretKey: 'value'
  ServiceURL: 'value'
  StorageBucket: 'value'
  ForcePathStyle: True
  Prefix: ''
  UseGlobalDict: False
```

## Realistic example {: #realistic-example}

Start with the minimal scaffold, replace placeholder values with project values, and combine it with the surrounding hook entry shown on the overview page.

## Edge cases {: #edge-cases}

- Optional arrays are emitted as `[]`; add entries only when the hook needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also {: #see-also}

- [Configuration table](tableView.md)
- [Overview](../overview.md)
