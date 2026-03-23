# FromS3 Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `Object | String` | &#10006 |  | Retrieves data from a configured S3 bucket. `DataSources`: Not used. `SessionData`: Not used. |
| `GeneratorConfiguration.DataArrangeOrder` | `enum [AsciiAsc / AsciiDesc / FirstNumericalAsc / FirstNumericalDesc / Unordered]` | &#10004 |  | In which order to arrange the loaded data. Arranges data based of the key identifier of the item.  Options: [ `AsciiAsc` - orders by the ascii value ascending / `AsciiDesc` - orders by the ascii value descending / `FirstNumericalAsc` - orders by the first found numerical value in the string ascending /`FirstNumericalDesc` - orders by the first found numerical value in the string descending /'Unordered' - does not order the data ] |
| `GeneratorConfiguration.Count` | `Integer | Null | String` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |
| `GeneratorConfiguration.DataUuidRegexExpression` | `String` | &#10006 | .* | A regex expression to use for filtering data from the external source by their UUID, only items that match the regex will be taken |
| `GeneratorConfiguration.LoadMetadataFirst` | `Boolean | String` | &#10006 | True | Wheather to load lightweight S3 metadata first and then load objects sequentially (true) or load all objects parallelly (false) |
| `GeneratorConfiguration.StorageMetaData` | `enum [FullPath / RelativePath / ItemName / None]` | &#10006 |  | The way to store the name of the generated data as key in StorageMetaData. Options:[ `FullPath` - stores the full path of the item as the key / `RelativePath` - stores the relative path related to the prefix / `ItemName` - stores only the name of the item as the key / `None` - does not store the name of the item |
| `GeneratorConfiguration.S3` | `Object | String` | &#10004 |  | S3 configurations |
| `GeneratorConfiguration.S3.AccessKey` | `String` | &#10004 |  | S3 account access key |
| `GeneratorConfiguration.S3.SecretKey` | `String` | &#10004 |  | S3 account secret access key |
| `GeneratorConfiguration.S3.ServiceURL` | `String` | &#10004 |  | S3 service url |
| `GeneratorConfiguration.S3.StorageBucket` | `String` | &#10004 |  | Name of S3 bucket |
| `GeneratorConfiguration.S3.Delimiter` | `String` | &#10006 |  | Delimiter of the objects to extract from s3 bucket, this determines what objects will be retrieved from the bucket, objects that have at least one occurence of the delimiter in their relative path after the `Prefix` will not be retrieved from the bucket. |
| `GeneratorConfiguration.S3.ForcePathStyle` | `Boolean | String` | &#10006 | True | When true, requests will always use path style addressing |
| `GeneratorConfiguration.S3.Prefix` | `String` | &#10006 |  | The prefix of the objects, in the s3 bucket to take |
| `GeneratorConfiguration.S3.SkipEmptyObjects` | `Boolean | String` | &#10006 | True | Whether to skip the loading of empty s3 objects or not, if true skips them if false doesnt skip them |
