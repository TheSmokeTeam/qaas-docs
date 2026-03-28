# Stacking

Combines multiple data sources by taking a configured number of items from each source in turn.

> Logical group: Existing data sources / Stacking

## What It Does

Combines multiple attached data sources by taking a configured number of items from each source in sequence and repeating that pattern until the sources are exhausted or a count limit is reached.

It is useful when you need a predictable mix of payload families rather than consuming one data source completely before moving to the next. It can also keep looping over finished generators when you want a longer mixed stream.

## YAML Example

```yaml
DataSources:
  - Name: PriorityPayloads
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/priority
        SearchPattern: '*.json'
      StorageMetaData: ItemName

  - Name: StandardPayloads
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/standard
        SearchPattern: '*.json'
      StorageMetaData: ItemName

  - Name: MixedPayloads
    Generator: Stacking
    DataSourceNames:
      - PriorityPayloads
      - StandardPayloads
    GeneratorConfiguration:
      Count: 5
      LoopFinishedGenerators: true
      ItemsPerGenerator:
        - 2
        - 1
```

## What This Configuration Does

`MixedPayloads` takes two items from `PriorityPayloads`, then one item from `StandardPayloads`, and repeats that pattern until it has produced five generated items.

Because `LoopFinishedGenerators` is enabled, the stacking process can continue even if one source runs out earlier than the other.
