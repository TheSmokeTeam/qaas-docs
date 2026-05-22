---
id: probes.available.deletes3bucket.overview
slug: deletes3bucket
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, DeleteS3Bucket, ProbeConfiguration]
ai_summary: "Empties the configured S3 bucket and deletes it, treating a missing bucket as an already-satisfied state."
tags: [probes]
canonical_url: /probes/availableProbes/DeleteS3Bucket/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\S3Probes\DeleteS3Bucket.cs
---

# DeleteS3Bucket

Empties the configured S3 bucket and deletes it, treating a missing bucket as an already-satisfied state.

## What it does

Empties the configured S3 bucket and deletes it, treating a missing bucket as an already-satisfied state. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DeleteS3BucketSession
    Probes:
      - Name: DeleteS3BucketStep
        Probe: DeleteS3Bucket
        ProbeConfiguration:
        StorageBucket:
        ServiceURL:
        AccessKey:
        SecretKey:
        ForcePathStyle:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `DeleteS3Bucket` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\S3Probes\DeleteS3Bucket.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
