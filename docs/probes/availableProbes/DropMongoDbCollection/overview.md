# DropMongoDbCollection

Drops the configured MongoDB collection so a later run can recreate it from scratch.

## What It Does

Drops one MongoDB collection completely so later setup can recreate it from scratch.

This is the collection-level reset option when you do not want to preserve collection metadata or existing indexes between runs.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DropMongoDbCollectionProbe
        Probe: DropMongoDbCollection
        ProbeConfiguration:
          UseGlobalDict: true
          ConnectionString: mongodb://localhost:27017
          DatabaseName: qaas
          CollectionName: orders
```

## What This Configuration Does

This probe connects to the `qaas` database and drops the `orders` collection entirely.

Use it when the scenario wants a full MongoDB collection reset rather than a document-only cleanup.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing `ConnectionString`, `DatabaseName`, and `CollectionName` can be resolved from the session-scoped `MongoDb/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when collection maintenance probes should reuse the same MongoDB target definition.

No recovery alias is written for MongoDB in this first pass.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.
