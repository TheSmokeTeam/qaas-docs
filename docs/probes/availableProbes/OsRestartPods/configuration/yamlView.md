---
id: probes.available.osrestartpods.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: [probes/availableProbes/OsRestartPods/overview.md]
code_langs: [yaml]
keywords: [probes, OsRestartPods, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for OsRestartPods ProbeConfiguration — copy, fill the blanks, drop into a Session step."
tags: [probes]
canonical_url: /probes/availableProbes/OsRestartPods/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json
---

# OsRestartPods — Configuration (YAML scaffold)

Drop this into the `ProbeConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
ProbeConfiguration:
  Openshift:
    Cluster:
    Username:
    Password:
    Namespace:
  ApplicationLabels: []
  IntervalBetweenDesiredStateChecksMs:
  TimeoutWaitForDesiredStateSeconds:
```
