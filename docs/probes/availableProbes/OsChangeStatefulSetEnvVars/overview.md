---
id: probes.available.oschangestatefulsetenvvars.overview
slug: oschangestatefulsetenvvars
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, OsChangeStatefulSetEnvVars, ProbeConfiguration]
ai_summary: "Probe that changes the environment variables of a statefulSet"
tags: [probes]
canonical_url: /probes/availableProbes/OsChangeStatefulSetEnvVars/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsChangeStatefulSetEnvVars.cs
---

# OsChangeStatefulSetEnvVars

Probe that changes the environment variables of a statefulSet

## What it does

Probe that changes the environment variables of a statefulSet See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OsChangeStatefulSetEnvVarsSession
    Probes:
      - Name: OsChangeStatefulSetEnvVarsStep
        Probe: OsChangeStatefulSetEnvVars
        ProbeConfiguration:
        ReplicaSetName:
        IntervalBetweenDesiredStateChecksMs:
        TimeoutWaitForDesiredStateSeconds:
        Openshift:
          Cluster:
          Username:
          Password:
          Namespace:
        ContainerName:
        EnvVarsToUpdate:
        EnvVarsToRemove: []
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `OsChangeStatefulSetEnvVars` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsChangeStatefulSetEnvVars.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
