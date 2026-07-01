---
id: qaas.userInterfaces.runner.configurationSections.reporters.configurations.yamlView
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-27
applies_to: [runner]
keywords: [runner, reference]
summary: "Reference page for Reporters Configurations Yaml View."
---

<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Reporters Configurations Yaml View

> TL;DR — Copy this schema-derived YAML scaffold, replace placeholder values, and use the table view for field descriptions.

## When to use {: #when-to-use}

Use this page when you need the generated YAML shape for this configuration section and want every emitted field in one block.

## YAML configuration {: #yaml-configuration}

The scaffold follows the generated schema order. String placeholders are quoted, optional lists render as `[]`, and numeric placeholders use schema minimums when they exist.

## Minimal example {: #minimal-example}

```yaml
Reporters:
  DisplayTrace: True
  SaveAttachments: True
  SaveLogs: True
  SaveSessionData: True
  SaveTemplate: True
  ReportPortal:
    ApiKey: 'Global API key in QaaS.Configuration'
    Attributes: {}
    DebugMode: False
    Description: 'Default QaaS description'
    Enabled: 'QaaS.Configuration defaults'
    Endpoint: 'Global URL in QaaS.Configuration'
    LaunchName: 'Generated according MetaData.Team, MetaData.System and the session occured'
    Project: 'MetaData.Team value'
```

## Realistic example {: #realistic-example}

Start with the minimal scaffold, replace placeholder values with project values, and keep only the optional branches that this configuration needs.

## Edge cases {: #edge-cases}

- Optional arrays are emitted as `[]`; add entries only when the section needs that collection.
- Placeholder-style strings are quoted so YAML parsers keep them as scalar values.

## See also {: #see-also}

- [Configuration table](tableView.md)
- [Overview](../overview.md)
