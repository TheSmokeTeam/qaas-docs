---
id: qaas.userinterfaces.runner.configurationsections.metadata.configurations.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, metadata, configurations]
summary: "MetaData Configurations Table View"
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# MetaData Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a configuration section before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `MetaData` | `object or string` | &#10006 |  | The metadata for the tests' run |
| `MetaData.System` | `string` | &#10004 |  | The tested system name |
| `MetaData.Team` | `string` | &#10004 |  | The team responsible for the tests |
| `MetaData.ExtraLabels` | `object or string` | &#10006 |  | Extra labels added by the user |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
