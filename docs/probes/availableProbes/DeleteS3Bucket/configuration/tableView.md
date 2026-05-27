# DeleteS3Bucket Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.AccessKey` | `string` | &#10004 |  | S3 account access key |
| `ProbeConfiguration.SecretKey` | `string` | &#10004 |  | S3 account secret access key |
| `ProbeConfiguration.ServiceURL` | `string` | &#10004 |  | S3 service url |
| `ProbeConfiguration.StorageBucket` | `string` | &#10004 |  | Name of S3 bucket |
| `ProbeConfiguration.ForcePathStyle` | `string or true/false` | &#10006 | True | When true, requests will always use path style addressing |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing S3 probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
