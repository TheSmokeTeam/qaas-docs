# CreateS3Bucket

Ensures the configured S3 bucket exists by creating it when it is missing.

## What It Does

Ensures an S3-compatible bucket exists before later steps try to write data into it.

If the bucket is already present, the probe leaves it alone. If it is missing, the probe creates it so downstream uploads and reads can rely on the bucket being available.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: CreateS3BucketProbe
        Probe: CreateS3Bucket
        ProbeConfiguration:
          UseGlobalDict: true
          AccessKey: access-key
          SecretKey: secret-key
          ServiceURL: http://minio.local:9000
          StorageBucket: qaas-docs
          ForcePathStyle: true
```

## What This Configuration Does

This probe connects to the S3-compatible service at `http://minio.local:9000` and ensures that the `qaas-docs` bucket exists.

It is useful as an idempotent setup step before generators or the system under test start uploading files.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing bucket connection fields such as `ServiceURL`, `AccessKey`, `SecretKey`, and `StorageBucket` can be resolved from the session-scoped `S3/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when bucket administration probes share one S3-compatible endpoint definition.

No recovery alias is written for S3 in this first pass.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.
