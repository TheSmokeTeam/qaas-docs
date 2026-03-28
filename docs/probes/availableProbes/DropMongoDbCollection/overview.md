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
          ConnectionString: mongodb://localhost:27017
          DatabaseName: qaas
          CollectionName: orders
```

## What This Configuration Does

This probe connects to the `qaas` database and drops the `orders` collection entirely.

Use it when the scenario wants a full MongoDB collection reset rather than a document-only cleanup.
