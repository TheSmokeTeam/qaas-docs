---
id: probes.available.osupdatestatefulsetresources.overview
slug: osupdatestatefulsetresources
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, OsUpdateStatefulSetResources, ProbeConfiguration]
ai_summary: "Updates container resource requests and limits in a Kubernetes or OpenShift stateful set."
tags: [probes]
canonical_url: /probes/availableProbes/OsUpdateStatefulSetResources/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsUpdateStatefulSetResources.cs
---

# OsUpdateStatefulSetResources

Updates container resource requests and limits in a Kubernetes or OpenShift stateful set.

## What it does

Updates container resource requests and limits in a Kubernetes or OpenShift stateful set. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OsUpdateStatefulSetResourcesSession
    Probes:
      - Name: OsUpdateStatefulSetResourcesStep
        Probe: OsUpdateStatefulSetResources
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
| **YAML key** | `OsUpdateStatefulSetResources` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsUpdateStatefulSetResources.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
