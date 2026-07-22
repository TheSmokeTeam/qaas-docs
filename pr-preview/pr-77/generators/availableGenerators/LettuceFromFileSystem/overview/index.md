# LettuceFromFileSystem

> TL;DR — Retrieves lettuce-formatted files from the configured file-system path and exposes them as generated messages with their routing key metadata.

## When to use

Reads lettuce envelope files directly from the local file system, decodes the base64 `Body`, and emits the decoded payload bytes.

If the envelope contains a RabbitMQ routing key, that routing key is copied into the generated item metadata so it can be reused when publishing or asserting later in the flow.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
DataSources:
  - Name: LettuceFiles
    Generator: LettuceFromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/lettuce
        SearchPattern: '*.json'
      StorageMetaData: ItemName
```

## Realistic example

This configuration scans `sample-data/lettuce` for lettuce envelope files, processes them in deterministic order, and exposes the decoded payload from each file as a generated item.

Any routing key carried by the envelope is preserved in metadata, which makes the generated data ready for RabbitMQ-based flows.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/LettuceFromFileSystem/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/LettuceFromFileSystem/configuration/yamlView/index.md)
- [Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md)
