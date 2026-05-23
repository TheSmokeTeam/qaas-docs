---
id: generators.available.fromfilesystem.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromFileSystem, GeneratorConfiguration]
summary: "Retrieves data from files under a configured path in the local file system."
---
<!-- Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromExternalSourceGenerators\FromFileSystem.cs -->

# FromFileSystem

> TL;DR — Retrieves data from files under a configured path in the local file system.

## When to use {: #when-to-use}

Reads files from a local directory and emits each matched file as one generated item.

It can order the file list deterministically, filter by a UUID-like pattern, stop after a fixed count, and attach storage metadata that identifies the source file or path.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

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

## Realistic example {: #realistic-example}

This example loads every `*.json` file under `sample-data/payloads` and exposes each file as one generated item.

Because the order is `AsciiAsc`, runs see the same file order every time, and `StorageMetaData: ItemName` preserves the file name for downstream logic that needs to know which file produced each payload.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Generators](../../index.md)
