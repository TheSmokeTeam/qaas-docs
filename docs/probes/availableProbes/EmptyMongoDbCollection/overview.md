# EmptyMongoDbCollection

Deletes all documents from the configured MongoDB collection so it starts clean for the test run.

> Logical group: Document stores / MongoDB collections

## What It Does

Deletes documents from one MongoDB collection in chunks until the collection is empty.

This is useful for repeatable cleanup in environments where the collection should stay available but the data written by the previous run should be removed.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: EmptyMongoDbCollectionProbe
        Probe: EmptyMongoDbCollection
        ProbeConfiguration:
          ConnectionString: mongodb://localhost:27017
          DatabaseName: qaas
          CollectionName: orders
          ChunkSize: 1000
```

## What This Configuration Does

This probe connects to the `qaas` database, deletes documents from the `orders` collection in batches of 1000, and repeats until the collection is empty.

The collection itself remains available for the next scenario run.
