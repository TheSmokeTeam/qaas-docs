---
id: probes.available.osscalestatefulsetpods.configuration.yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsScaleStatefulSetPods, yaml, scaffold]
summary: "Minimal YAML scaffold for OsScaleStatefulSetPods ProbeConfiguration — copy, fill the blanks, drop into a Session step."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# OsScaleStatefulSetPods — Configuration (YAML scaffold)

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
  DesiredNumberOfPods:
```
