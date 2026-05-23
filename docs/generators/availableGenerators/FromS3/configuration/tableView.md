---
id: generators.available.froms3.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromS3, configuration, reference]
summary: "Field-by-field reference for FromS3 GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json -->

# FromS3 Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  | Retrieves data from a configured S3 bucket. `DataSources`: Not used. `SessionData`: Not used. |
| `GeneratorConfiguration.Count` | `integer or string or null` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |
| `GeneratorConfiguration.DataArrangeOrder` | `one of [AsciiAsc / AsciiDesc / FirstNumericalAsc / FirstNumericalDesc / Unordered]` | &#10006 |  | In which order to arrange the loaded data. Arranges data based of the key identifier of the item.  Options: [ `AsciiAsc` - orders by the ascii value ascending / `AsciiDesc` - orders by the ascii value descending / `FirstNumericalAsc` - orders by the first found numerical value in the string ascending /`FirstNumericalDesc` - orders by the first found numerical value in the string descending /'Unordered' - does not order the data ] |
| `GeneratorConfiguration.DataUuidRegexExpression` | `string` | &#10006 | `.*` | A regex expression to use for filtering data from the external source by their UUID, only items that match the regex will be taken |
| `GeneratorConfiguration.LoadMetadataFirst` | `string or true/false` | &#10006 | `True` | Wheather to load lightweight S3 metadata first and then load objects sequentially (true) or load all objects parallelly (false) |
| `GeneratorConfiguration.StorageMetaData` | `one of [FullPath / RelativePath / ItemName / None]` | &#10006 |  | The way to store the name of the generated data as key in StorageMetaData. Options:[ `FullPath` - stores the full path of the item as the key / `RelativePath` - stores the relative path related to the prefix / `ItemName` - stores only the name of the item as the key / `None` - does not store the name of the item |
| `GeneratorConfiguration.S3` | `object or string` | &#10004 |  | S3 configurations |
| `GeneratorConfiguration.S3.AccessKey` | `string` | &#10004 |  | S3 account access key |
| `GeneratorConfiguration.S3.SecretKey` | `string` | &#10004 |  | S3 account secret access key |
| `GeneratorConfiguration.S3.ServiceURL` | `string` | &#10004 |  | S3 service url |
| `GeneratorConfiguration.S3.StorageBucket` | `string` | &#10004 |  | Name of S3 bucket |
| `GeneratorConfiguration.S3.Delimiter` | `string` | &#10006 |  | Delimiter of the objects to extract from s3 bucket, this determines what objects will be retrieved from the bucket, objects that have at least one occurence of the delimiter in their relative path after the `Prefix` will not be retrieved from the bucket. |
| `GeneratorConfiguration.S3.ForcePathStyle` | `string or true/false` | &#10006 | `True` | When true, requests will always use path style addressing |
| `GeneratorConfiguration.S3.Prefix` | `string` | &#10006 |  | The prefix of the objects, in the s3 bucket to take |
| `GeneratorConfiguration.S3.SkipEmptyObjects` | `string or true/false` | &#10006 | `True` | Whether to skip the loading of empty s3 objects or not, if true skips them if false doesnt skip them |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
