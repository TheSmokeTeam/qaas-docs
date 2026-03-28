# LettuceFromFileSystem

Retrieves lettuce-formatted files from the configured file-system path and exposes them as generated messages with their routing key metadata.

> Logical group: External sources / Lettuce files

## What It Does

Reads lettuce envelope files directly from the local file system, decodes the base64 `Body`, and emits the decoded payload bytes.

If the envelope contains a RabbitMQ routing key, that routing key is copied into the generated item metadata so it can be reused when publishing or asserting later in the flow.

## YAML Example

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

## What This Configuration Does

This configuration scans `sample-data/lettuce` for lettuce envelope files, processes them in deterministic order, and exposes the decoded payload from each file as a generated item.

Any routing key carried by the envelope is preserved in metadata, which makes the generated data ready for RabbitMQ-based flows.
