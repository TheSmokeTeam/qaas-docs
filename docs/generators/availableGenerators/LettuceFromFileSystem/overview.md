---
id: generators.available.lettucefromfilesystem.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, LettuceFromFileSystem, GeneratorConfiguration]
summary: "Retrieves lettuce-formatted files from the configured file-system path and exposes them as generated messages with their routing key metadata."
---
<!-- Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromExternalSourceGenerators\LettuceFromFileSystem.cs -->

# LettuceFromFileSystem

Retrieves lettuce-formatted files from the configured file-system path and exposes them as generated messages with their routing key metadata.

## What it does

Retrieves lettuce-formatted files from the configured file-system path and exposes them as generated messages with their routing key metadata. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: LettuceFromFileSystemSession
    Generators:
      - Name: LettuceFromFileSystemStep
        DataSource: LettuceFromFileSystem
        GeneratorConfiguration:
        FileSystem:
          Path:
          SearchPattern:
        DataArrangeOrder:
        Count:
        DataUuidRegexExpression:
        StorageMetaData:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | generators |
| **YAML key** | `LettuceFromFileSystem` |
| **Schema** | [`generators.schema.json`](../../../_generated/schemas/generators.md) |
| **Source** | `QaaS.Common.Generators\QaaS.Common.Generators\FromExternalSourceGenerators\LettuceFromFileSystem.cs` |

## See also

- [generators index](../../index.md)
- [Custom generator authoring guide](../../custom-authoring-guide.md)
