---
id: probes.available.emptyelasticindices.overview
slug: emptyelasticindices
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: []
code_langs: [yaml, csharp]
keywords: [probes, EmptyElasticIndices, ProbeConfiguration]
ai_summary: "Empties elastic indices by their index pattern"
tags: [probes]
canonical_url: /probes/availableProbes/EmptyElasticIndices/overview/
# Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\ElasticProbes\EmptyElasticIndices.cs
---

# EmptyElasticIndices

Empties elastic indices by their index pattern

## What it does

Empties elastic indices by their index pattern See [Configuration ▸ tableView](configuration/tableView.md) for the full field reference and [Configuration ▸ yamlView](configuration/yamlView.md) for a minimal scaffold.

## YAML example

```yaml
Sessions:
  - Name: EmptyElasticIndicesSession
    Probes:
      - Name: EmptyElasticIndicesStep
        Probe: EmptyElasticIndices
        ProbeConfiguration:
        MatchQueryString:
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
| **YAML key** | `EmptyElasticIndices` |
| **Schema** | [`probes.schema.json`](../../../_generated/schemas/probes.md) |
| **Source** | `QaaS.Common.Probes\QaaS.Common.Probes\ElasticProbes\EmptyElasticIndices.cs` |

## See also

- [probes index](../../index.md)
- [Custom probe authoring guide](../../custom-authoring-guide.md)
