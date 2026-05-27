# DeleteS3Bucket

Empties the configured S3 bucket and deletes it, treating a missing bucket as an already-satisfied state.

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
          UseGlobalDict: true
          AccessKey: access-key
          SecretKey: secret-key
          ServiceURL: http://minio.local:9000
          StorageBucket: qaas-docs-temp
          ForcePathStyle: true
```

## What This Configuration Does

This probe connects to the S3-compatible service at `http://minio.local:9000`, empties the `qaas-docs-temp` bucket, and then deletes the bucket itself.

It is appropriate for fully disposable test buckets.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing bucket connection fields can be resolved from the session-scoped `S3/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when bucket deletion should reuse the same S3 target settings that were already resolved earlier.

No recovery alias is written for S3 in this first pass.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.
