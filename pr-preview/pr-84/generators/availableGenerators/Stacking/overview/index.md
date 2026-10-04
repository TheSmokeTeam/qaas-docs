# Stacking

> TL;DR — Combines multiple data sources by taking a configured number of items from each source in turn.

## When to use

Combines multiple attached data sources by taking a configured number of items from each source in sequence and repeating that pattern until the sources are exhausted or a count limit is reached.

It is useful when you need a predictable mix of payload families rather than consuming one data source completely before moving to the next. It can also keep looping over finished generators when you want a longer mixed stream.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

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

## Realistic example

`MixedPayloads` takes two items from `PriorityPayloads`, then one item from `StandardPayloads`, and repeats that pattern until it has produced five generated items.

Because `LoopFinishedGenerators` is enabled, the stacking process can continue even if one source runs out earlier than the other.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/Stacking/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/Stacking/configuration/yamlView/index.md)
- [Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md)
