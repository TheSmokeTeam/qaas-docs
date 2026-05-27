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

# DelayByChunks Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `AssertionConfiguration` | `object or string` | &#10006 |  | Delay checks the time interval between the inputs and outputs is not bigger than a configured number by subtracting the timestamp of input chunks of a configured size from a timestamp of output chunks of a configured size, The timestamp of the chunks is calculated differently depending on the configuration. takes the chunks in ascending order (which will be the send/arrival order) from the configured input/output. `Warning`: This delay test only works on synchronous applications! `DataSources`: Not used. `Session Support`: Only supports a single session assertion |
| `AssertionConfiguration.MaximumDelayMs` | `integer or string` | &#10004 |  | maximum delay in milliseconds allowed for a chunk's delay for the chunk to be considered as arrived on time |
| `AssertionConfiguration.InputsAreOutputs` | `string or true/false` | &#10006 | `False` | Whether the given input in Input is actually another outputs list |
| `AssertionConfiguration.MaximumNegativeDelayBufferMs` | `integer or string or null` | &#10006 | `100` | maximum negative delay buffer of a chunk's delay in milliseconds, if value falls within the buffer it is still compared to maximum allowed delay |
| `AssertionConfiguration.Input` | `object or string` | &#10004 |  | The information about the input required for the assertion |
| `AssertionConfiguration.Input.ChunkSize` | `integer or string` | &#10004 |  | The end point items chunk size |
| `AssertionConfiguration.Input.Name` | `string` | &#10004 |  | Name of the end point the chunk belongs to |
| `AssertionConfiguration.Input.ChunkTimeOption` | `one of [Average / First / Last]` | &#10006 |  | How to calculate the time of a chunk. Options: [ `Average` - Calculates the chunks time by taking the average of all times in the chunk / `First` - Calculates the chunks time by taking the time of the first item in the chunk / `Last` - Calculates the chunks time by taking the time of the last item in the chunk ] |
| `AssertionConfiguration.Output` | `object or string` | &#10004 |  | The information about the output required for the assertion  |
| `AssertionConfiguration.Output.ChunkSize` | `integer or string` | &#10004 |  | The end point items chunk size |
| `AssertionConfiguration.Output.Name` | `string` | &#10004 |  | Name of the end point the chunk belongs to |
| `AssertionConfiguration.Output.ChunkTimeOption` | `one of [Average / First / Last]` | &#10006 |  | How to calculate the time of a chunk. Options: [ `Average` - Calculates the chunks time by taking the average of all times in the chunk / `First` - Calculates the chunks time by taking the time of the first item in the chunk / `Last` - Calculates the chunks time by taking the time of the last item in the chunk ] |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
