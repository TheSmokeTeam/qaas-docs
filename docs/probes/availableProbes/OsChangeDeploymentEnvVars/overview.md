---
id: probes.available.oschangedeploymentenvvars.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsChangeDeploymentEnvVars, ProbeConfiguration]
summary: "Probe that changes the environment variables of a deployment"
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsChangeDeploymentEnvVars.cs -->

# OsChangeDeploymentEnvVars

Probe that changes the environment variables of a deployment

## What it does

Probe that changes the environment variables of a deployment See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: OsChangeDeploymentEnvVarsSession
    Probes:
      - Name: OsChangeDeploymentEnvVarsStep
        Probe: OsChangeDeploymentEnvVars
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
| **YAML key** | `OsChangeDeploymentEnvVars` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\OsProbes\OsChangeDeploymentEnvVars.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
