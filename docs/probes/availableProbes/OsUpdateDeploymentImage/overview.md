---
id: probes.available.osupdatedeploymentimage.overview
slug: osupdatedeploymentimage
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, OsUpdateDeploymentImage, ProbeConfiguration]
ai_summary: "Updates the image of one container in a Kubernetes or OpenShift deployment."
tags: [probes]
canonical_url: /probes/availableProbes/OsUpdateDeploymentImage/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsUpdateDeploymentImage.cs
---

# OsUpdateDeploymentImage

Updates the image of one container in a Kubernetes or OpenShift deployment.

## What it does

Updates the image of one container in a Kubernetes or OpenShift deployment. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OsUpdateDeploymentImageSession
    Probes:
      - Name: OsUpdateDeploymentImageStep
        Probe: OsUpdateDeploymentImage
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
| **YAML key** | `OsUpdateDeploymentImage` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsUpdateDeploymentImage.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
