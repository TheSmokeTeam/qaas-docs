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
          UseGlobalDict: true
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

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing bucket connection fields can be resolved from the session-scoped `S3/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when object cleanup should reuse the same S3 bucket definition while keeping the `Prefix` local.

No recovery alias is written for S3 in this first pass.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.
