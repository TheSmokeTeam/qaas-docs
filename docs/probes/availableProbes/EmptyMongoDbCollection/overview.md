# EmptyMongoDbCollection

Deletes all documents from the configured MongoDB collection so it starts clean for the test run.

## What It Does

Deletes all documents from one MongoDB collection while leaving the collection itself in place.

This is useful for repeatable cleanup in environments where the collection should stay available but the data written by the previous run should be removed.

## YAML Example

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

## What This Configuration Does

This probe connects to the `qaas` database and deletes the documents stored in the `orders` collection while keeping the collection itself available.

The collection itself remains available for the next scenario run.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing `ConnectionString`, `DatabaseName`, and `CollectionName` can be resolved from the session-scoped `MongoDb/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when cleanup probes should reuse the same MongoDB collection target from a previous step.

No recovery alias is written for MongoDB in this first pass.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.
