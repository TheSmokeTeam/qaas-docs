# ExecuteRedisCommand

Executes one Redis command with optional arguments against the selected Redis database, optionally storing the result for later redisResults placeholder reuse.

## What It Does

Runs one Redis command with the configured arguments against the selected Redis database.

This is useful for one-off setup or cleanup operations such as setting flags, creating keys, or issuing simple maintenance commands inside a scenario flow.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: ExecuteRedisCommandProbe
        Probe: ExecuteRedisCommand
        ProbeConfiguration:
          HostNames:
            - localhost:6379
          RedisDataBase: 0
          Command: SET
          Arguments:
            - qaas:last-template
            - ready
```

## What This Configuration Does

This example runs `SET qaas:last-template ready` against Redis database `0`.

It is a simple probe step that can prepare a key before the rest of the scenario begins.
