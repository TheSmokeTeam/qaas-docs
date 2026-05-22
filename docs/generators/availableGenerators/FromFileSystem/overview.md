---
id: generators.available.fromfilesystem.overview
slug: fromfilesystem
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [generators, FromFileSystem, GeneratorConfiguration]
ai_summary: "Retrieves data from files under a configured path in the local file system."
tags: [generators]
canonical_url: /generators/availableGenerators/FromFileSystem/overview/
# Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromExternalSourceGenerators\FromFileSystem.cs
---

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
