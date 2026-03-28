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
          ConnectionString: mongodb://localhost:27017
          DatabaseName: qaas
          CollectionName: orders
          ChunkSize: 1000
```

## What This Configuration Does

This probe connects to the `qaas` database and deletes the documents stored in the `orders` collection while keeping the collection itself available.

The collection itself remains available for the next scenario run.
