---
id: probes.available.osupdatedeploymentresources.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsUpdateDeploymentResources, yaml, scaffold]
summary: "Minimal YAML scaffold for OsUpdateDeploymentResources ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# OsUpdateDeploymentResources Configurations Yaml View

> TL;DR: Minimal YAML scaffold for OsUpdateDeploymentResources ProbeConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example {: #minimal-example}

```yaml
ProbeConfiguration:
  ContainerName: "value"
  ReplicaSetName: "value"
  IntervalBetweenDesiredStateChecksMs: "${value}"
  TimeoutWaitForDesiredStateSeconds: "${value}"
  UseGlobalDict: "${value}"
  Openshift:
    Cluster: "value"
    Namespace: "value"
    Password: "value"
    Username: "value"
    AllowInvalidServerCertificates: "${value}"
  DesiredResources:
    Limits:
      Cpu: "value"
      Memory: "value"
    Requests:
      Cpu: "value"
      Memory: "value"
```

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
