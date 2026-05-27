---
id: probes.available.emptys3bucket.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, EmptyS3Bucket, configuration, reference]
summary: "Field-by-field reference for EmptyS3Bucket ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# EmptyS3Bucket Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.AccessKey` | `string` | &#10004 |  | S3 account access key |
| `ProbeConfiguration.SecretKey` | `string` | &#10004 |  | S3 account secret access key |
| `ProbeConfiguration.ServiceURL` | `string` | &#10004 |  | S3 service url |
| `ProbeConfiguration.StorageBucket` | `string` | &#10004 |  | Name of S3 bucket |
| `ProbeConfiguration.ForcePathStyle` | `string or true/false` | &#10006 | True | When true, requests will always use path style addressing |
| `ProbeConfiguration.Prefix` | `string` | &#10006 |  | Prefix of all objects to delete from s3 bucket |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing S3 probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
