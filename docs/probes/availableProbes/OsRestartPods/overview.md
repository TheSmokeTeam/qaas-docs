---
id: probes.available.osrestartpods.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsRestartPods, ProbeConfiguration]
summary: "Probe that restarts all pods with configured labels in the configured namespace"
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsRestartPods.cs -->

# OsRestartPods

Probe that restarts all pods with configured labels in the configured namespace

## What it does

Probe that restarts all pods with configured labels in the configured namespace See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OsRestartPodsSession
    Probes:
      - Name: OsRestartPodsStep
        Probe: OsRestartPods
        ProbeConfiguration:
        Openshift:
          Cluster:
          Username:
          Password:
          Namespace:
        ApplicationLabels: []
        IntervalBetweenDesiredStateChecksMs:
        TimeoutWaitForDesiredStateSeconds:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `OsRestartPods` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsRestartPods.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
