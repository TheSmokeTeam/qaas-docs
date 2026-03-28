# EmptyS3Bucket

Probe to empty a s3 bucket according to a certain prefix

## What It Does

Deletes objects from an S3-compatible bucket without deleting the bucket itself.

An optional prefix limits the cleanup to one logical folder, which is useful when multiple scenarios share the same bucket but write to different prefixes.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: EmptyS3BucketProbe
        Probe: EmptyS3Bucket
        ProbeConfiguration:
          AccessKey: access-key
          SecretKey: secret-key
          ServiceURL: http://minio.local:9000
          StorageBucket: qaas-docs
          ForcePathStyle: true
          Prefix: runs/2026-03-28/
```

## What This Configuration Does

This configuration removes every object under the `runs/2026-03-28/` prefix from the `qaas-docs` bucket and keeps the bucket itself intact.

That makes it useful for cleaning one run namespace without affecting the rest of the bucket.
