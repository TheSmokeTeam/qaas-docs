# FromS3

Retrieves data from objects in a configured S3 bucket and prefix.

> Logical group: External sources / S3 storage

> Logical group: External sources / S3 storage

## What It Does

Reads objects from an S3-compatible bucket and emits one generated item per object.

It can walk the bucket directly or load object metadata first, filter keys, skip empty objects, order the results, and attach storage metadata that describes which object was used.

## YAML Example

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

## What This Configuration Does

This configuration reads objects from the `qaas-docs` bucket under the `payloads/` prefix, skips empty objects, and emits the remaining objects in deterministic ASCII order.

Because metadata is loaded first, the generator can order and filter the object set before it starts retrieving the actual object bodies.
