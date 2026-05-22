---
id: probes.available.osupdatedeploymentresources.overview
slug: osupdatedeploymentresources
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, OsUpdateDeploymentResources, ProbeConfiguration]
ai_summary: "Updates container resource requests and limits in a Kubernetes or OpenShift deployment."
tags: [probes]
canonical_url: /probes/availableProbes/OsUpdateDeploymentResources/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsUpdateDeploymentResources.cs
---

# OsUpdateDeploymentResources

Updates container resource requests and limits in a Kubernetes or OpenShift deployment.

## What it does

Updates container resource requests and limits in a Kubernetes or OpenShift deployment. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OsUpdateDeploymentResourcesSession
    Probes:
      - Name: OsUpdateDeploymentResourcesStep
        Probe: OsUpdateDeploymentResources
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
        DesiredResources:
          Requests:
            Cpu:
            Memory:
          Limits:
            Cpu:
            Memory:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `OsUpdateDeploymentResources` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsUpdateDeploymentResources.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
