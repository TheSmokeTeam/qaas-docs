# FromFileSystem

> TL;DR — Retrieves data from files under a configured path in the local file system.

## When to use

Reads files from a local directory and emits each matched file as one generated item.

It can order the file list deterministically, filter by a UUID-like pattern, stop after a fixed count, and attach storage metadata that identifies the source file or path.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
DataSources:
  - Name: PayloadFiles
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/payloads
        SearchPattern: '*.json'
      StorageMetaData: ItemName
```

## Realistic example

This example loads every `*.json` file under `sample-data/payloads` and exposes each file as one generated item.

Because the order is `AsciiAsc`, runs see the same file order every time, and `StorageMetaData: ItemName` preserves the file name for downstream logic that needs to know which file produced each payload.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/FromFileSystem/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/FromFileSystem/configuration/yamlView/index.md)
- [Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md)
