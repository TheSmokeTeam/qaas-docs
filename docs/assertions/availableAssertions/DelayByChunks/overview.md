---
id: assertions.available.delaybychunks.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions]
keywords: [assertions, DelayByChunks, AssertionConfiguration]
summary: "Checks for delay between an input source to an output source by subtracting the timestamp of input chunks of a configured size from a timestamp of output chunks of a configured size, takes the chun..."
---
<!-- Verified-against: QaaS.Common.Assertions\QaaS.Common.Assertions\Delay\DelayByChunks.cs -->

# DelayByChunks

Checks for delay between an input source to an output source by subtracting the timestamp of input chunks of a configured size from a timestamp of output chunks of a configured size, takes the chunks in ascending order of the input/output lists.

## What it does

Checks for delay between an input source to an output source by subtracting the timestamp of input chunks of a configured size from a timestamp of output chunks of a configured size, takes the chunks in ascending order of the input/output lists. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DelayByChunksSession
    Assertions:
      - Name: DelayByChunksStep
        Assertion: DelayByChunks
        AssertionConfiguration:
        Output:
          Name:
          ChunkSize:
          ChunkTimeOption:
        Input:
          Name:
          ChunkSize:
          ChunkTimeOption:
        InputsAreOutputs:
        MaximumDelayMs:
        MaximumNegativeDelayBufferMs:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | assertions |
| **YAML key** | `DelayByChunks` |
| **Schema** | [`assertions.schema.json`](../../../_generated/schemas/assertions.md) |
| **Source** | `QaaS.Common.Assertions\QaaS.Common.Assertions\Delay\DelayByChunks.cs` |

## See also

- [assertions index](../../index.md)
- [Custom assertion authoring guide](../../custom-authoring-guide.md)
