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

Retrieves data from files under a configured path in the local file system.

## What it does

Retrieves data from files under a configured path in the local file system. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: FromFileSystemSession
    Generators:
      - Name: FromFileSystemStep
        DataSource: FromFileSystem
        GeneratorConfiguration:
        DataArrangeOrder:
        Count:
        DataUuidRegexExpression:
        StorageMetaData:
        FileSystem:
          Path:
          SearchPattern:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | generators |
| **YAML key** | `FromFileSystem` |
| **Schema** | [`generators.schema.json`](../../../_generated/schemas/generators.md) |
| **Source** | `QaaS.Common.Generators\QaaS.Common.Generators\FromExternalSourceGenerators\FromFileSystem.cs` |

## See also

- [generators index](../../index.md)
- [Custom generator authoring guide](../../custom-authoring-guide.md)
