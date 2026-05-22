---
id: probes.available.osupdatedeploymentimage.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: [probes/availableProbes/OsUpdateDeploymentImage/overview.md]
code_langs: [yaml]
keywords: [probes, OsUpdateDeploymentImage, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for OsUpdateDeploymentImage ProbeConfiguration — copy, fill the blanks, drop into a Session step."
tags: [probes]
canonical_url: /probes/availableProbes/OsUpdateDeploymentImage/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json
---

# OsUpdateDeploymentImage — Configuration (YAML scaffold)

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
  DesiredImage:
```
