# DeleteElasticIndices

Deletes every Elasticsearch index that matches the configured index pattern.

## What It Does

Deletes every Elasticsearch index that matches the configured pattern.

Use this when a scenario creates disposable indices and the cleanest reset is to remove the indices themselves instead of deleting documents from inside them.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DeleteElasticIndicesProbe
        Probe: DeleteElasticIndices
        ProbeConfiguration:
          Url: http://elastic.local:9200
          Username: elastic
          Password: elastic-password
          IndexPattern: qaas-orders-*
          RequestTimeoutMs: 15000
```

## What This Configuration Does

This probe targets every index whose name matches `qaas-orders-*` and deletes those indices entirely.

It is the index-level cleanup option for disposable Elasticsearch test data.
