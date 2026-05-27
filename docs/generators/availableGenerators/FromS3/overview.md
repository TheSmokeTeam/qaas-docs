---
id: generators.available.froms3.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromS3, GeneratorConfiguration]
summary: "Retrieves data from objects in a configured S3 bucket and prefix."
---
<!-- Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromExternalSourceGenerators\FromS3.cs -->

# FromS3

> TL;DR — Retrieves data from objects in a configured S3 bucket and prefix.

## When to use {: #when-to-use}

Reads objects from an S3-compatible bucket and emits one generated item per object.

It can walk the bucket directly or load object metadata first, filter keys, skip empty objects, order the results, and attach storage metadata that describes which object was used.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
DataSources:
  - Name: BucketPayloads
    Generator: FromS3
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      LoadMetadataFirst: true
      StorageMetaData: ItemName
      S3:
        AccessKey: access-key
        SecretKey: secret-key
        ServiceURL: http://minio.local:9000
        StorageBucket: qaas-docs
        Prefix: payloads/
        SkipEmptyObjects: true
        ForcePathStyle: true
```

## Realistic example {: #realistic-example}

This configuration reads objects from the `qaas-docs` bucket under the `payloads/` prefix, skips empty objects, and emits the remaining objects in deterministic ASCII order.

Because metadata is loaded first, the generator can order and filter the object set before it starts retrieving the actual object bodies.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Generators](../../index.md)
