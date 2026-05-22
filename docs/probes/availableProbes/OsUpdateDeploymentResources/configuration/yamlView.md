---
id: probes.available.osupdatedeploymentresources.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: [probes/availableProbes/OsUpdateDeploymentResources/overview.md]
code_langs: [yaml]
keywords: [probes, OsUpdateDeploymentResources, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for OsUpdateDeploymentResources ProbeConfiguration — copy, fill the blanks, drop into a Session step."
tags: [probes]
canonical_url: /probes/availableProbes/OsUpdateDeploymentResources/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json
---

# OsUpdateDeploymentResources — Configuration (YAML scaffold)

Drop this into the `ProbeConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
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
