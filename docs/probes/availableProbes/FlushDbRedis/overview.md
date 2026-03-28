# FlushDbRedis

Runs Redis FLUSHDB against the selected Redis database.

> Logical group: Redis maintenance / Database flush

> Logical group: Redis maintenance / Database flush

## What It Does

Runs `FLUSHDB` on one selected Redis database and removes every key from that database only.

This is safer than `FlushAllRedis` when the Redis server hosts multiple databases and only one of them belongs to the scenario.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: FlushDbRedisProbe
        Probe: FlushDbRedis
        ProbeConfiguration:
          HostNames:
            - localhost:6379
          RedisDataBase: 5
```

## What This Configuration Does

This probe connects to database `5` on `localhost:6379` and removes all keys from that database.

Other Redis databases on the same server are left untouched.
