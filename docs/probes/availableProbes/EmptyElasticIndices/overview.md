# EmptyElasticIndices

Empties elastic indices by their index pattern

> Logical group: Document stores / Elastic indices

## What It Does

Finds Elasticsearch indices that match the configured pattern and deletes documents from them with a delete-by-query operation.

This is useful when you want to clear scenario-generated documents from one family of indices without dropping the indices themselves.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: EmptyElasticIndicesProbe
        Probe: EmptyElasticIndices
        ProbeConfiguration:
          Url: http://elastic.local:9200
          Username: elastic
          Password: elastic-password
          IndexPattern: qaas-orders-*
          MatchQueryString: event.dataset:orders
          RequestTimeoutMs: 15000
```

## What This Configuration Does

This probe targets indices whose names match `qaas-orders-*` and removes documents that match the query string `event.dataset:orders`.

The indices stay in place, but the matching documents are cleared out before the next run.
