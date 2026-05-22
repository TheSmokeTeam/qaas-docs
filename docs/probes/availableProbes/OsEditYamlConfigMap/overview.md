---
id: probes.available.osedityamlconfigmap.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsEditYamlConfigMap, ProbeConfiguration]
summary: "OsEditYamlConfigMap probe plugin (auto-generated reference)."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\ConfigurationObjects\Os\OsEditYamlConfigMapConfig.cs -->

# OsEditYamlConfigMap

!!! warning "Missing XMLDoc"
    Source class has no `<summary>` comment. Tracked in [docs/_meta/xmldoc-gaps.md](../../../_meta/xmldoc-gaps.md).

No summary available yet — see [docs/_meta/xmldoc-gaps.md](../../../_meta/xmldoc-gaps.md).

## What it does

Behavior not yet documented in source XMLDoc. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OsEditYamlConfigMapSession
    Probes:
      - Name: OsEditYamlConfigMapStep
        Probe: OsEditYamlConfigMap
        ProbeConfiguration:
        Openshift:
          Cluster:
          Username:
          Password:
          Namespace:
        ConfigMapName:
        ConfigMapYamlFileName:
        ValuesToEdit:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `OsEditYamlConfigMap` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\ConfigurationObjects\Os\OsEditYamlConfigMapConfig.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
