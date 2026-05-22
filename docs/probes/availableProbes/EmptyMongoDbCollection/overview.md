---
id: probes.available.emptymongodbcollection.overview
slug: emptymongodbcollection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, EmptyMongoDbCollection, ProbeConfiguration]
ai_summary: "Deletes all documents from the configured MongoDB collection so it starts clean for the test run."
tags: [probes]
canonical_url: /probes/availableProbes/EmptyMongoDbCollection/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\MongoDbProbes\EmptyMongoDbCollection.cs
---

# EmptyMongoDbCollection

Deletes all documents from the configured MongoDB collection so it starts clean for the test run.

## What it does

Deletes all documents from the configured MongoDB collection so it starts clean for the test run. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: EmptyMongoDbCollectionSession
    Probes:
      - Name: EmptyMongoDbCollectionStep
        Probe: EmptyMongoDbCollection
        ProbeConfiguration:
        ConnectionString:
        DatabaseName:
        CollectionName:
        ChunkSize:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `EmptyMongoDbCollection` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\MongoDbProbes\EmptyMongoDbCollection.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
