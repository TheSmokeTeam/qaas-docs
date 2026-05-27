# EmptyElasticIndices

Empties elastic indices by their index pattern

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
          UseGlobalDict: true
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

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing cluster connection fields can be resolved from the session-scoped `Elastic/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when an index-emptying step should reuse the same Elasticsearch connection details.

No recovery alias is written for Elasticsearch in this first pass.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.
