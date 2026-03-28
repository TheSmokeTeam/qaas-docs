# DelayByChunks

Checks for delay between an input source to an output source by subtracting the timestamp of input chunks of a configured size from a timestamp of output chunks of a configured size, takes the chunks in ascending order of the input/output lists.

> Logical group: Latency / Chunk latency

## What It Does

Splits the named input and output streams into ordered chunks, computes one timestamp per chunk, and then checks whether each output chunk arrives within the allowed delay relative to the matching input chunk.

The chunk timestamp can be taken from the first item, last item, or the average of the items in the chunk. The assertion succeeds only when the number of on-time output chunks matches the number of complete input chunks. Incomplete trailing chunks are ignored, an output chunk size of zero means "no output is expected", and large negative chunk delays are treated as invalid timing data.

## YAML Example

```yaml
Sessions:
  - Name: SampleSession

Assertions:
  - Name: DelayByChunksAssertion
    Assertion: DelayByChunks
    SessionNames:
      - SampleSession

    AssertionConfiguration:
      Input:
        Name: PublishedBatch
        ChunkSize: 2
        ChunkTimeOption: Last
      Output:
        Name: ProcessedBatch
        ChunkSize: 1
        ChunkTimeOption: Last
      MaximumDelayMs: 500
      MaximumNegativeDelayBufferMs: 50
```

## What This Configuration Does

This configuration treats every two input items in `PublishedBatch` as one logical batch and compares that batch to each single output item in `ProcessedBatch`, using the last timestamp inside each chunk.

With this setup, the assertion expects one output chunk for every complete two-item input chunk, and each output chunk must arrive within 500 ms of its matching input chunk. Small negative timing drift up to 50 ms is tolerated.
