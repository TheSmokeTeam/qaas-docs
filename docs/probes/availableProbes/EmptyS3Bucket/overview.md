---
id: probes.available.emptys3bucket.overview
slug: emptys3bucket
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, EmptyS3Bucket, ProbeConfiguration]
ai_summary: "Deletes objects from the configured S3 bucket, optionally constrained to a prefix, while treating a missing bucket as a no-op."
tags: [probes]
canonical_url: /probes/availableProbes/EmptyS3Bucket/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\S3Probes\EmptyS3Bucket.cs
---

# EmptyS3Bucket

Deletes objects from the configured S3 bucket, optionally constrained to a prefix, while treating a missing bucket as a no-op.

## What it does

Deletes objects from the configured S3 bucket, optionally constrained to a prefix, while treating a missing bucket as a no-op. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: EmptyS3BucketSession
    Probes:
      - Name: EmptyS3BucketStep
        Probe: EmptyS3Bucket
        ProbeConfiguration:
        StorageBucket:
        ServiceURL:
        AccessKey:
        SecretKey:
        ForcePathStyle:
        Prefix:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `EmptyS3Bucket` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\S3Probes\EmptyS3Bucket.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
