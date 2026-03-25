# Storages Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `Storages` | `list or string or null` | &#10006 |  | External storages qaas inner objects can be stored in or retrieved from when using the `qaas act` (to create and store) or `qaas assert` (to retrieve and use) commands |
| `Storages[]` | `object or string` | &#10006 |  |  |
| `Storages[].JsonStorageFormat` | `one of [Indented / None]` | &#10006 |  | The storage format used when storing jsons. Options: [`Indented` - Formats the json with indents, more readable but less memory efficient /`None` - Formats the json without indents, less readable but more memory efficient ] |
| `Storages[].FileSystem` | `object or string` | &#10006 |  | Supports storage as a file system directory |
| `Storages[].FileSystem.Path` | `string` | &#10004 |  | The path of the directory containing the relevant files |
| `Storages[].FileSystem.SearchPattern` | `string` | &#10006 |  | The search string to match against the names of files in path. This parameter can contain a combination of valid literal path and wildcard (* and ?) characters, but it doesn't support regular expressions. |
| `Storages[].S3` | `object or string` | &#10006 |  | Supports storage as an S3 bucket with a certain prefix |
| `Storages[].S3.AccessKey` | `string` | &#10004 |  | S3 account access key |
| `Storages[].S3.SecretKey` | `string` | &#10004 |  | S3 account secret access key |
| `Storages[].S3.ServiceURL` | `string` | &#10004 |  | S3 service url |
| `Storages[].S3.StorageBucket` | `string` | &#10004 |  | Name of S3 bucket |
| `Storages[].S3.Delimiter` | `string` | &#10006 |  | The delimiter of the relevant objects in the s3 bucket |
| `Storages[].S3.ForcePathStyle` | `string or true/false` | &#10006 | True | When true, requests will always use path style addressing |
| `Storages[].S3.MaximumRetryCount` | `integer or string or null` | &#10006 |  | The maximum number of times to retry when an action against the S3 fails due to maximum S3 supported IOPS, if no value is given will retry indefinitely |
| `Storages[].S3.Prefix` | `string` | &#10006 |  | The prefix of the relevant objects in the s3 bucket |
| `Storages[].S3.SkipEmptyObjects` | `string or true/false` | &#10006 | True | Whether to skip the retrieval of empty s3 objects or not, if true skips them if false doesnt skip them |
