---
id: probes.available.deletes3bucket.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, DeleteS3Bucket, configuration, reference]
summary: "Field-by-field reference for DeleteS3Bucket ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# DeleteS3Bucket — Configuration (table view)

Generated from `probes.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.StorageBucket` | `string` | &#10004 |  | Name of S3 bucket |
| `ProbeConfiguration.ServiceURL` | `string` | &#10004 |  | S3 service url |
| `ProbeConfiguration.AccessKey` | `string` | &#10004 |  | S3 account access key |
| `ProbeConfiguration.SecretKey` | `string` | &#10004 |  | S3 account secret access key |
| `ProbeConfiguration.ForcePathStyle` | `boolean or string` | &#10006 | true | When true, requests will always use path style addressing |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
