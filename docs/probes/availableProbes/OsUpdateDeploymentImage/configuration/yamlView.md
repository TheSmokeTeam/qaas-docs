---
id: probes.available.osupdatedeploymentimage.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsUpdateDeploymentImage, yaml, scaffold]
summary: "Minimal YAML scaffold for OsUpdateDeploymentImage ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# OsUpdateDeploymentImage Configurations Yaml View

```yaml
ProbeConfiguration:
  ContainerName:
  DesiredImage:
  ReplicaSetName:
  IntervalBetweenDesiredStateChecksMs:
  TimeoutWaitForDesiredStateSeconds:
  UseGlobalDict:
  Openshift:
    Cluster:
    Namespace:
    Password:
    Username:
    AllowInvalidServerCertificates:
```
