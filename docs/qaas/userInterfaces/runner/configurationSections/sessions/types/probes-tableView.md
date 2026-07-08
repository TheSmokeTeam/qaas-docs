---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.probes-tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Probes Configurations Table View"
---

<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Probes Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a configuration section before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Sessions[].Probes` | `list or string or null` | &#10006 |  | List of all probes to build and run for this session. Probes are hook methods that do not return data, and can be integrated inside session run |
| `Sessions[].Probes[]` | `object or string` | &#10006 |  |  |
| `Sessions[].Probes[].Name` | `string` | &#10004 |  | The name of the probe |
| `Sessions[].Probes[].Probe` | `string` | &#10004 |  | The name of the probe to use |
| `Sessions[].Probes[].ProbeConfiguration` | `object or string or null` | &#10006 |  | Implementation configuration for the probe, the configuration given here is loaded into the provided probe dynamically. |
| `Sessions[].Probes[].Stage` | `integer or string` | &#10006 | 3 | The stage in which the Probe runs at |
| `Sessions[].Probes[].DataSourceNames` | `list or string` | &#10006 |  | Names of the pre defined data sources to pass to the probe |
| `Sessions[].Probes[].DataSourceNames[]` | `string` | &#10006 |  |  |
| `Sessions[].Probes[].DataSourcePatterns` | `list or string` | &#10006 |  | Regex patterns of data sources |
| `Sessions[].Probes[].DataSourcePatterns[]` | `string` | &#10006 |  |  |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](probes-yamlView.md)
- [Overview](../overview.md)
