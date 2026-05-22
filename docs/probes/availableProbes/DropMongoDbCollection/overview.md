---
id: probes.available.dropmongodbcollection.overview
slug: dropmongodbcollection
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, DropMongoDbCollection, ProbeConfiguration]
ai_summary: "Drops the configured MongoDB collection so a later run can recreate it from scratch."
tags: [probes]
canonical_url: /probes/availableProbes/DropMongoDbCollection/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\MongoDbProbes\DropMongoDbCollection.cs
---

# DropMongoDbCollection

Drops the configured MongoDB collection so a later run can recreate it from scratch.

## What it does

Drops the configured MongoDB collection so a later run can recreate it from scratch. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DropMongoDbCollectionSession
    Probes:
      - Name: DropMongoDbCollectionStep
        Probe: DropMongoDbCollection
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
| **YAML key** | `DropMongoDbCollection` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\MongoDbProbes\DropMongoDbCollection.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
