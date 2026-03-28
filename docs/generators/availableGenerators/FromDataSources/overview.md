# FromDataSources

Generates data from the enumerable of data sources it receives

> Logical group: Existing data sources / Direct reuse

## What It Does

Forwards the generated items produced by the attached data sources and exposes them as a new data source.

It does not transform the payloads. It is mainly a way to cap, regroup, or re-export existing generated data under a new name so the same base source can be reused in multiple places.

## YAML Example

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

## What This Configuration Does

`RawPayloads` loads every matching file from disk, and `ForwardedPayloads` then re-emits only the first two generated items from that source.

This is useful when you want to reuse an existing data source but limit how many items a particular session or stub should see.
