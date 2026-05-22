---
id: probes.available.osupdatestatefulsetimage.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsUpdateStatefulSetImage, ProbeConfiguration]
summary: "Updates the image of one container in a Kubernetes or OpenShift stateful set."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsUpdateStatefulSetImage.cs -->

# OsUpdateStatefulSetImage

Updates the image of one container in a Kubernetes or OpenShift stateful set.

## What it does

Updates the image of one container in a Kubernetes or OpenShift stateful set. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OsUpdateStatefulSetImageSession
    Probes:
      - Name: OsUpdateStatefulSetImageStep
        Probe: OsUpdateStatefulSetImage
        ProbeConfiguration:
        ContainerName:
        ReplicaSetName:
        IntervalBetweenDesiredStateChecksMs:
        TimeoutWaitForDesiredStateSeconds:
        Openshift:
          Cluster:
          Username:
          Password:
          Namespace:
        DesiredImage:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `OsUpdateStatefulSetImage` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsUpdateStatefulSetImage.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
