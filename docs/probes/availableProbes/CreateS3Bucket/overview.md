---
id: probes.available.creates3bucket.overview
slug: creates3bucket
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, CreateS3Bucket, ProbeConfiguration]
ai_summary: "Ensures the configured S3 bucket exists by creating it when it is missing."
tags: [probes]
canonical_url: /probes/availableProbes/CreateS3Bucket/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\S3Probes\CreateS3Bucket.cs
---

# CreateS3Bucket

Ensures the configured S3 bucket exists by creating it when it is missing.

## What it does

Ensures the configured S3 bucket exists by creating it when it is missing. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: CreateS3BucketSession
    Probes:
      - Name: CreateS3BucketStep
        Probe: CreateS3Bucket
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
| **YAML key** | `CreateS3Bucket` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\S3Probes\CreateS3Bucket.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
