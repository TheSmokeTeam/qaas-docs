---
id: assertions.available.delaybychunks.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, DelayByChunks, configuration, reference]
summary: "Field-by-field reference for DelayByChunks AssertionConfiguration keys, types, defaults and descriptions, generated from assertions.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json -->

# DelayByChunks — Configuration (table view)

Generated from `assertions.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/assertions.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  |  |
| `AssertionConfiguration.Output` | `object or string` | &#10004 |  | The information about the output required for the assertion |
| `AssertionConfiguration.Output.Name` | `string` | &#10004 |  | Name of the end point the chunk belongs to |
| `AssertionConfiguration.Output.ChunkSize` | `integer or string` | &#10004 |  | The end point items chunk size |
| `AssertionConfiguration.Output.ChunkTimeOption` | `integer or string` | &#10006 | Average | How to calculate the time of a chunk. Options: [ `Average` - Calculates the chunks time by taking the average of all times in the chunk / `First` - Calculates the chunks time by taking the time of the first item in the chunk / `Last` - Calculates the chunks time by taking the time of the last item in the chunk ] |
| `AssertionConfiguration.Input` | `object or string` | &#10004 |  | The information about the input required for the assertion |
| `AssertionConfiguration.Input.Name` | `string` | &#10004 |  | Name of the end point the chunk belongs to |
| `AssertionConfiguration.Input.ChunkSize` | `integer or string` | &#10004 |  | The end point items chunk size |
| `AssertionConfiguration.Input.ChunkTimeOption` | `integer or string` | &#10006 | Average | How to calculate the time of a chunk. Options: [ `Average` - Calculates the chunks time by taking the average of all times in the chunk / `First` - Calculates the chunks time by taking the time of the first item in the chunk / `Last` - Calculates the chunks time by taking the time of the last item in the chunk ] |
| `AssertionConfiguration.InputsAreOutputs` | `boolean or string` | &#10006 | false | Whether the given input in Input is actually another outputs list |
| `AssertionConfiguration.MaximumDelayMs` | `integer or string` | &#10004 |  | maximum delay in milliseconds allowed for a chunk's delay for the chunk to be considered as arrived on time |
| `AssertionConfiguration.MaximumNegativeDelayBufferMs` | `integer or null or string` | &#10006 | 100 | maximum negative delay buffer of a chunk's delay in milliseconds, if value falls within the buffer it is still compared to maximum allowed delay |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
