---
id: generators.available.fromdatasources.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromDataSources, GeneratorConfiguration]
summary: "Generates data from the enumerable of data sources it receives"
---
<!-- Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromDataSourcesGenerators\FromDataSources.cs -->

# FromDataSources

> TL;DR — Generates data from the enumerable of data sources it receives

## When to use {: #when-to-use}

Forwards the generated items produced by the attached data sources and exposes them as a new data source.

It does not transform the payloads. It is mainly a way to cap, regroup, or re-export existing generated data under a new name so the same base source can be reused in multiple places.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
DataSources:
  - Name: RawPayloads
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/payloads
        SearchPattern: '*.json'
      StorageMetaData: ItemName

  - Name: ForwardedPayloads
    Generator: FromDataSources
    DataSourceNames:
      - RawPayloads
    GeneratorConfiguration:
      Count: 2
```

## Realistic example {: #realistic-example}

`RawPayloads` loads every matching file from disk, and `ForwardedPayloads` then re-emits only the first two generated items from that source.

This is useful when you want to reuse an existing data source but limit how many items a particular session or stub should see.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Generators](../../index.md)
