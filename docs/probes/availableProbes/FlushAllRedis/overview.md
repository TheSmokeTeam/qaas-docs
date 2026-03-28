# FlushAllRedis

Runs Redis FLUSHALL against the configured server to remove keys from every database.

> Logical group: Redis maintenance / Database flush

## What It Does

Runs `FLUSHALL` on the targeted Redis server and removes keys from every database on that server.

This is the broadest Redis cleanup option and is only appropriate when the Redis instance is dedicated to the scenario or test environment.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: FlushAllRedisProbe
        Probe: FlushAllRedis
        ProbeConfiguration:
          HostNames:
            - localhost:6379
```

## What This Configuration Does

This configuration performs a full Redis server flush against `localhost:6379`.

After the probe runs, all Redis databases on that server are emptied.
