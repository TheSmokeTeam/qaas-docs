---
id: probes.available.osupdatestatefulsetresources.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsUpdateStatefulSetResources, yaml, scaffold]
summary: "Minimal YAML scaffold for OsUpdateStatefulSetResources ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# OsUpdateStatefulSetResources Configurations Yaml View

> TL;DR: Minimal YAML scaffold for OsUpdateStatefulSetResources ProbeConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example

```yaml
ProbeConfiguration:
  ContainerName:
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
  DesiredResources:
    Limits:
      Cpu:
      Memory:
    Requests:
      Cpu:
      Memory:
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
