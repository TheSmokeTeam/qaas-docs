---
id: probes.available.oschangestatefulsetenvvars.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsChangeStatefulSetEnvVars, yaml, scaffold]
summary: "Minimal YAML scaffold for OsChangeStatefulSetEnvVars ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# OsChangeStatefulSetEnvVars Configurations Yaml View

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
