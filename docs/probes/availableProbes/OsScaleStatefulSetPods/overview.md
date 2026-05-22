---
id: probes.available.osscalestatefulsetpods.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsScaleStatefulSetPods, ProbeConfiguration]
summary: "Probe that scales openshift statefulsets"
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsScaleStatefulSetPods.cs -->

# OsScaleStatefulSetPods

Probe that scales openshift statefulsets

## What it does

Probe that scales openshift statefulsets See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OsScaleStatefulSetPodsSession
    Probes:
      - Name: OsScaleStatefulSetPodsStep
        Probe: OsScaleStatefulSetPods
        ProbeConfiguration:
        ReplicaSetName:
        IntervalBetweenDesiredStateChecksMs:
        TimeoutWaitForDesiredStateSeconds:
        Openshift:
          Cluster:
          Username:
          Password:
          Namespace:
        DesiredNumberOfPods:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `OsScaleStatefulSetPods` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsScaleStatefulSetPods.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
