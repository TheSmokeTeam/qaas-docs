---
id: generators.available.froms3.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: [generators/availableGenerators/FromS3/overview.md]
code_langs: [yaml]
keywords: [generators, FromS3, configuration, reference]
ai_summary: "Field-by-field reference for FromS3 GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json."
tags: [generators]
canonical_url: /generators/availableGenerators/FromS3/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json
---

# FromS3 — Configuration (table view)

Generated from `generators.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/generators.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `GeneratorConfiguration` | `object or string` | &#10006 |  |  |
| `GeneratorConfiguration.DataArrangeOrder` | `integer or string` | &#10004 |  | In which order to arrange the loaded data. Arranges data based of the key identifier of the item.  Options: [ `AsciiAsc` - orders by the ascii value ascending / `AsciiDesc` - orders by the ascii value descending / `FirstNumericalAsc` - orders by the first found numerical value in the string ascending /`FirstNumericalDesc` - orders by the first found numerical value in the string descending /'Unordered' - does not order the data ] |
| `GeneratorConfiguration.Count` | `integer or null or string` | &#10006 |  | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |
| `GeneratorConfiguration.DataUuidRegexExpression` | `string` | &#10006 | .* | A regex expression to use for filtering data from the external source by their UUID, only items that match the regex will be taken |
| `GeneratorConfiguration.StorageMetaData` | `integer or string` | &#10006 | RelativePath | The way to store the name of the generated data as key in StorageMetaData. Options:[ `FullPath` - stores the full path of the item as the key / `RelativePath` - stores the relative path related to the prefix / `ItemName` - stores only the name of the item as the key / `None` - does not store the name of the item |
| `GeneratorConfiguration.LoadMetadataFirst` | `boolean or string` | &#10006 | true | Wheather to load lightweight S3 metadata first and then load objects sequentially (true) or load all objects parallelly (false) |
| `GeneratorConfiguration.S3` | `object or string` | &#10004 |  | S3 configurations |
| `GeneratorConfiguration.S3.StorageBucket` | `string` | &#10004 |  | Name of S3 bucket |
| `GeneratorConfiguration.S3.ServiceURL` | `string` | &#10004 |  | S3 service url |
| `GeneratorConfiguration.S3.AccessKey` | `string` | &#10004 |  | S3 account access key |
| `GeneratorConfiguration.S3.SecretKey` | `string` | &#10004 |  | S3 account secret access key |
| `GeneratorConfiguration.S3.ForcePathStyle` | `boolean or string` | &#10006 | true | When true, requests will always use path style addressing |
| `GeneratorConfiguration.S3.Delimiter` | `string` | &#10006 |  | Delimiter of the objects to extract from s3 bucket, this determines what objects will be retrieved from the bucket, objects that have at least one occurence of the delimiter in their relative path after the `Prefix` will not be retrieved from the bucket. |
| `GeneratorConfiguration.S3.Prefix` | `string` | &#10006 |  | The prefix of the objects, in the s3 bucket to take |
| `GeneratorConfiguration.S3.SkipEmptyObjects` | `boolean or string` | &#10006 | true | Whether to skip the loading of empty s3 objects or not, if true skips them if false doesnt skip them |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
