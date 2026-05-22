---
id: probes.available.oschangedeploymentenvvars.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsChangeDeploymentEnvVars, yaml, scaffold]
summary: "Minimal YAML scaffold for OsChangeDeploymentEnvVars ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# OsChangeDeploymentEnvVars — Configuration (YAML scaffold)

Drop this into the `ProbeConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
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
