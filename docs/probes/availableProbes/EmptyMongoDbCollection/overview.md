---
id: probes.available.emptymongodbcollection.overview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, EmptyMongoDbCollection, ProbeConfiguration]
summary: "Deletes all documents from the configured MongoDB collection so it starts clean for the test run."
---
<!-- Verified-against: QaaS.Common.Probes\QaaS.Common.Probes\MongoDbProbes\EmptyMongoDbCollection.cs -->

# EmptyMongoDbCollection

> TL;DR — Deletes all documents from the configured MongoDB collection so it starts clean for the test run.

## When to use {: #when-to-use}

Deletes all documents from one MongoDB collection while leaving the collection itself in place.

This is useful for repeatable cleanup in environments where the collection should stay available but the data written by the previous run should be removed.

## YAML configuration {: #yaml-configuration}

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example {: #minimal-example}

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: EmptyMongoDbCollectionProbe
        Probe: EmptyMongoDbCollection
        ProbeConfiguration:
          UseGlobalDict: true
          ConnectionString: mongodb://localhost:27017
          DatabaseName: qaas
          CollectionName: orders
          ChunkSize: 1000
```

## Realistic example {: #realistic-example}

This probe connects to the `qaas` database and deletes the documents stored in the `orders` collection while keeping the collection itself available.

The collection itself remains available for the next scenario run.

### Global Dictionary Behavior {: #global-dictionary-behavior}

With `UseGlobalDict: true`, missing `ConnectionString`, `DatabaseName`, and `CollectionName` can be resolved from the session-scoped `MongoDb/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when cleanup probes should reuse the same MongoDB collection target from a previous step.

No recovery alias is written for MongoDB in this first pass.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.

## Edge cases {: #edge-cases}

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also {: #see-also}

- [Configuration table](configuration/tableView.md)
- [YAML scaffold](configuration/yamlView.md)
- [Probes](../../index.md)
