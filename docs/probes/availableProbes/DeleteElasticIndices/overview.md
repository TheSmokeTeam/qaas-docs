---
id: probes.available.deleteelasticindices.overview
slug: deleteelasticindices
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, DeleteElasticIndices, ProbeConfiguration]
ai_summary: "Deletes every Elasticsearch index that matches the configured index pattern."
tags: [probes]
canonical_url: /probes/availableProbes/DeleteElasticIndices/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\ElasticProbes\DeleteElasticIndices.cs
---

# DeleteElasticIndices

Deletes every Elasticsearch index that matches the configured index pattern.

## What it does

Deletes every Elasticsearch index that matches the configured index pattern. See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: DeleteElasticIndicesSession
    Probes:
      - Name: DeleteElasticIndicesStep
        Probe: DeleteElasticIndices
        ProbeConfiguration:
        IndexPattern:
        Url:
        Username:
        Password:
        RequestTimeoutMs:
```


## Where it lives

| | |
|--|--|
| **Plugin family** | probes |
| **YAML key** | `DeleteElasticIndices` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\ElasticProbes\DeleteElasticIndices.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
