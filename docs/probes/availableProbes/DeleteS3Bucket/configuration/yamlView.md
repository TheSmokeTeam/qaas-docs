---
id: probes.available.deletes3bucket.configuration.yamlview
slug: yamlview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: [probes/availableProbes/DeleteS3Bucket/overview.md]
code_langs: [yaml]
keywords: [probes, DeleteS3Bucket, yaml, scaffold]
ai_summary: "Minimal YAML scaffold for DeleteS3Bucket ProbeConfiguration — copy, fill the blanks, drop into a Session step."
tags: [probes]
canonical_url: /probes/availableProbes/DeleteS3Bucket/configuration/yamlView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json
---

# DeleteS3Bucket — Configuration (YAML scaffold)

Drop this into the `ProbeConfiguration` block of a Session step. Field meanings are in [tableView](tableView.md).

```yaml
ProbeConfiguration:
  StorageBucket:
  ServiceURL:
  AccessKey:
  SecretKey:
  ForcePathStyle:
```
