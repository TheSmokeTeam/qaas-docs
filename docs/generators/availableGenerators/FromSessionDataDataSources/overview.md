---
id: generators.available.fromsessiondatadatasources.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [generators]
keywords: [generators, FromSessionDataDataSources, GeneratorConfiguration]
summary: "Generates data from the enumerable of data sources it receives, presumes all items in the enumerable are serialized and can be treated as a byte array"
---
<!-- Verified-against: QaaS.Common.Generators\QaaS.Common.Generators\FromDataSourcesGenerators\FromSessionDataDataSources.cs -->

# FromSessionDataDataSources

> TL;DR — Generates data from the enumerable of data sources it receives, presumes all items in the enumerable are serialized and can be treated as a byte array

## When to use {: #when-to-use}

Loads serialized session data from attached data sources, deserializes it back into session snapshots, and then emits the inputs and outputs named in the configuration.

This generator is useful when you want to replay or mine previously captured sessions. It lets you pull only the communication streams you care about instead of replaying the entire saved session.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
DataSources:
  - Name: SavedSessionData
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: sample-data/session-data
        SearchPattern: '*.sessionData'
      StorageMetaData: ItemName

  - Name: ExtractedReplayData
    Generator: FromSessionDataDataSources
    DataSourceNames:
      - SavedSessionData
    GeneratorConfiguration:
      - SessionName: CheckoutSession
        CommunicationDataList:
          - Name: Published
            Type: Input
          - Name: Delivered
            Type: Output
```

## Realistic example {: #realistic-example}

`SavedSessionData` points at serialized session snapshots on disk. `ExtractedReplayData` then deserializes those snapshots, looks for the session named `CheckoutSession`, and emits both its `Published` input data and its `Delivered` output data.

That makes the resulting data source useful for replay scenarios, regression checks, or derived generators that need past session traffic as their input.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Generators](../../index.md)
