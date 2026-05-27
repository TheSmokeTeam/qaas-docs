---
id: probes.available.deleteelasticindices.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, DeleteElasticIndices, ProbeConfiguration]
summary: "Deletes every Elasticsearch index that matches the configured index pattern."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\ElasticProbes\DeleteElasticIndices.cs -->

# DeleteElasticIndices

> TL;DR: Deletes every Elasticsearch index that matches the configured index pattern.

Deletes every Elasticsearch index that matches the configured index pattern.

## What It Does {: #what-it-does}

Deletes every Elasticsearch index that matches the configured pattern.

Use this when a scenario creates disposable indices and the cleanest reset is to remove the indices themselves instead of deleting documents from inside them.

## Minimal example {: #minimal-example}

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteElasticIndicesProbe
        Probe: DeleteElasticIndices
        ProbeConfiguration:
          UseGlobalDict: true
          Url: http://elastic.local:9200
          Username: elastic
          Password: elastic-password
          IndexPattern: qaas-orders-*
          RequestTimeoutMs: 15000
```

## Realistic example {: #realistic-example}

This probe targets every index whose name matches `qaas-orders-*` and deletes those indices entirely.

It is the index-level cleanup option for disposable Elasticsearch test data.

### Global Dictionary Behavior {: #global-dictionary-behavior}

With `UseGlobalDict: true`, missing cluster connection fields such as `Url`, `Username`, and `Password` can be resolved from the session-scoped `Elastic/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when several Elasticsearch cleanup probes share the same cluster definition.

No recovery alias is written for Elasticsearch in this first pass.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.

## See also {: #see-also}

Use the surrounding documentation navigation to move between related generated reference pages.
