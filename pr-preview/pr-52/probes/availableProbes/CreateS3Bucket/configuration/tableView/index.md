# CreateS3Bucket Configurations Table View

> TL;DR: Field-by-field reference for CreateS3Bucket ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path                       | Type                   | Required | Default | Description                                                                                                                       |
| ----------------------------------- | ---------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                | `object or string`     | ✖        |         |                                                                                                                                   |
| `ProbeConfiguration.AccessKey`      | `string`               | ✔        |         | S3 account access key                                                                                                             |
| `ProbeConfiguration.SecretKey`      | `string`               | ✔        |         | S3 account secret access key                                                                                                      |
| `ProbeConfiguration.ServiceURL`     | `string`               | ✔        |         | S3 service url                                                                                                                    |
| `ProbeConfiguration.StorageBucket`  | `string`               | ✔        |         | Name of S3 bucket                                                                                                                 |
| `ProbeConfiguration.ForcePathStyle` | `string or true/false` | ✖        | True    | When true, requests will always use path style addressing                                                                         |
| `ProbeConfiguration.UseGlobalDict`  | `string or true/false` | ✖        | False   | When true, missing S3 probe configuration keys can be resolved from the shared global dictionary before local values are applied. |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
