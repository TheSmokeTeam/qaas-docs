# FromFileSystem

Retrieves data from files under a configured path in the local file system.

## What It Does

Reads files from a local directory and emits each matched file as one generated item.

It can order the file list deterministically, filter by a UUID-like pattern, stop after a fixed count, and attach storage metadata that identifies the source file or path.

## YAML Example

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

## What This Configuration Does

This example loads every `*.json` file under `sample-data/payloads` and exposes each file as one generated item.

Because the order is `AsciiAsc`, runs see the same file order every time, and `StorageMetaData: ItemName` preserves the file name for downstream logic that needs to know which file produced each payload.
