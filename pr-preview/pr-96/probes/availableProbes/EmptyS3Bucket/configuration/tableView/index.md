# EmptyS3Bucket Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                       | Type                   | Required | Default | Description                                                                                                                       |
| ----------------------------------- | ---------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                | `object or string`     | ✖        |         |                                                                                                                                   |
| `ProbeConfiguration.AccessKey`      | `string`               | ✔        |         | S3 account access key                                                                                                             |
| `ProbeConfiguration.SecretKey`      | `string`               | ✔        |         | S3 account secret access key                                                                                                      |
| `ProbeConfiguration.ServiceURL`     | `string`               | ✔        |         | S3 service url                                                                                                                    |
| `ProbeConfiguration.StorageBucket`  | `string`               | ✔        |         | Name of S3 bucket                                                                                                                 |
| `ProbeConfiguration.ForcePathStyle` | `string or true/false` | ✖        | `True`  | When true, requests will always use path style addressing                                                                         |
| `ProbeConfiguration.Prefix`         | `string`               | ✖        |         | Prefix of all objects to delete from s3 bucket                                                                                    |
| `ProbeConfiguration.UseGlobalDict`  | `string or true/false` | ✖        | `False` | When true, missing S3 probe configuration keys can be resolved from the shared global dictionary before local values are applied. |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/EmptyS3Bucket/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/EmptyS3Bucket/overview/index.md)
