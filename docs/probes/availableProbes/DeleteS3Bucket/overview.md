# DeleteS3Bucket

Probe to delete a s3 bucket

> Logical group: Object storage / S3 bucket deletion

> Logical group: Object storage / S3 bucket deletion

## What It Does

Deletes an S3-compatible bucket after first emptying all objects from it.

This is the destructive bucket-level cleanup option and is useful when the scenario creates temporary buckets that should be removed completely at the end of a run.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteS3BucketProbe
        Probe: DeleteS3Bucket
        ProbeConfiguration:
          AccessKey: access-key
          SecretKey: secret-key
          ServiceURL: http://minio.local:9000
          StorageBucket: qaas-docs-temp
          ForcePathStyle: true
```

## What This Configuration Does

This probe connects to the S3-compatible service at `http://minio.local:9000`, empties the `qaas-docs-temp` bucket, and then deletes the bucket itself.

It is appropriate for fully disposable test buckets.
