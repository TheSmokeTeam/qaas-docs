---
id: generators.available.froms3.overview
slug: froms3
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [generators, FromS3, GeneratorConfiguration]
ai_summary: "Retrieves data from objects in a configured S3 bucket and prefix."
tags: [generators]
canonical_url: /generators/availableGenerators/FromS3/overview/
# Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromExternalSourceGenerators\FromS3.cs
---

# FromS3

Retrieves data from objects in a configured S3 bucket and prefix.

## What it does

Retrieves data from objects in a configured S3 bucket and prefix. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: FromS3Session
    Generators:
      - Name: FromS3Step
        DataSource: FromS3
        GeneratorConfiguration:
        DataArrangeOrder:
        Count:
        DataUuidRegexExpression:
        StorageMetaData:
        LoadMetadataFirst:
        S3:
          StorageBucket:
          ServiceURL:
          AccessKey:
          SecretKey:
          ForcePathStyle:
          Delimiter:
          Prefix:
          SkipEmptyObjects:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | generators |
| **YAML key** | `FromS3` |
| **Schema** | [`generators.schema.json`](../../../_generated/schemas/generators.md) |
| **Source** | `QaaS.Common.Generators\QaaS.Common.Generators\FromExternalSourceGenerators\FromS3.cs` |

## See also

- [generators index](../../index.md)
- [Custom generator authoring guide](../../custom-authoring-guide.md)
