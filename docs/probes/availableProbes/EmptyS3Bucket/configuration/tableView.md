# EmptyS3Bucket Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.AccessKey` | `String` | &#10004 |  | S3 account access key |
| `ProbeConfiguration.SecretKey` | `String` | &#10004 |  | S3 account secret access key |
| `ProbeConfiguration.ServiceURL` | `String` | &#10004 |  | S3 service url |
| `ProbeConfiguration.StorageBucket` | `String` | &#10004 |  | Name of S3 bucket |
| `ProbeConfiguration.ForcePathStyle` | `Boolean | String` | &#10006 | True | When true, requests will always use path style addressing |
| `ProbeConfiguration.Prefix` | `String` | &#10006 |  | Prefix of all objects to delete from s3 bucket |
