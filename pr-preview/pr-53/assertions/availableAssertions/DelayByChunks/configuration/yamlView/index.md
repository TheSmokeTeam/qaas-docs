# DelayByChunks Configurations Yaml View

> TL;DR: Minimal YAML scaffold for DelayByChunks AssertionConfiguration — copy, fill the blanks, drop into a Session step.

Use this generated scaffold as the starting point for the hook configuration block.

## Minimal example

```yaml
AssertionConfiguration:
  MaximumDelayMs: "${value}"
  InputsAreOutputs: "${value}"
  MaximumNegativeDelayBufferMs: "${value}"
  Input:
    ChunkSize: "${value}"
    Name: "value"
    ChunkTimeOption: "Average"
  Output:
    ChunkSize: "${value}"
    Name: "value"
    ChunkTimeOption: "Average"
```

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
