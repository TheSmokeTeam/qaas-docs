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

# DeleteS3Bucket Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.AccessKey` | `string` | &#10004 |  | S3 account access key |
| `ProbeConfiguration.SecretKey` | `string` | &#10004 |  | S3 account secret access key |
| `ProbeConfiguration.ServiceURL` | `string` | &#10004 |  | S3 service url |
| `ProbeConfiguration.StorageBucket` | `string` | &#10004 |  | Name of S3 bucket |
| `ProbeConfiguration.ForcePathStyle` | `string or true/false` | &#10006 | `True` | When true, requests will always use path style addressing |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | `False` | When true, missing S3 probe configuration keys can be resolved from the shared global dictionary before local values are applied. |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
