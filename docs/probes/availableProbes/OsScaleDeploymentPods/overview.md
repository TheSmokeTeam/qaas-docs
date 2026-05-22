---
id: probes.available.osscaledeploymentpods.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsScaleDeploymentPods, ProbeConfiguration]
summary: "Probe that scales openshift deployments"
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsScaleDeploymentPods.cs -->

# OsScaleDeploymentPods

Probe that scales openshift deployments

## What it does

Probe that scales openshift deployments See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OsScaleDeploymentPodsSession
    Probes:
      - Name: OsScaleDeploymentPodsStep
        Probe: OsScaleDeploymentPods
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
| **YAML key** | `OsScaleDeploymentPods` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsScaleDeploymentPods.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
