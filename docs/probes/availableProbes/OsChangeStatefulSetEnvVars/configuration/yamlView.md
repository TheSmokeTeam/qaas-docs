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

> TL;DR: Minimal YAML scaffold for OsChangeStatefulSetEnvVars ProbeConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example {: #minimal-example}

```yaml
ProbeConfiguration:
  ReplicaSetName: "value"
  ContainerEnvVarsToUpdate: "${value}"
  ContainerName: "value"
  EnvVarsToUpdate: "${value}"
  IntervalBetweenDesiredStateChecksMs: "${value}"
  TimeoutWaitForDesiredStateSeconds: "${value}"
  UseGlobalDict: "${value}"
  EnvVarsToRemove:
    - "value"
  Openshift:
    Cluster: "value"
    Namespace: "value"
    Password: "value"
    Username: "value"
    AllowInvalidServerCertificates: "${value}"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
