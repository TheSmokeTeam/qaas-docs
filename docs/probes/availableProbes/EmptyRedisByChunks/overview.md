# EmptyRedisByChunks

Concrete Redis chunk-deletion probe that uses the standard Redis batch probe configuration.

## What It Does

Scans the selected Redis database and deletes matching keys in batches instead of trying to remove everything in one call.

An optional key regex narrows the deletion to a subset of keys, which is useful when only one scenario namespace should be cleaned while the rest of the database stays untouched.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: EmptyRedisByChunksProbe
        Probe: EmptyRedisByChunks
        ProbeConfiguration:
          HostNames:
            - localhost:6379
          RedisDataBase: 0
          BatchSize: 500
          KeyRegexPattern: '^qaas:'
```

## What This Configuration Does

This probe connects to Redis database `0`, finds keys that start with `qaas:`, and deletes them in batches of up to 500 keys at a time.

That gives you a focused cleanup step for scenario-owned keys without flushing unrelated Redis data.
