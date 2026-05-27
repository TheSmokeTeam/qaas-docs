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

# OsChangeDeploymentEnvVars Configurations Yaml View

> TL;DR: Minimal YAML scaffold for OsChangeDeploymentEnvVars ProbeConfiguration — copy, fill the blanks, drop into a Session step.

```yaml
ProbeConfiguration:
  ReplicaSetName:
  ContainerEnvVarsToUpdate:
  ContainerName:
  EnvVarsToUpdate:
  IntervalBetweenDesiredStateChecksMs:
  TimeoutWaitForDesiredStateSeconds:
  UseGlobalDict:
  EnvVarsToRemove: []
  Openshift:
    Cluster:
    Namespace:
    Password:
    Username:
    AllowInvalidServerCertificates:
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
