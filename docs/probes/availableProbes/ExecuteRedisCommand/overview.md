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
          UseGlobalDict: true
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

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing `HostNames`, authentication fields, and `RedisDataBase` can be resolved from the session-scoped `Redis/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when a command should reuse Redis connection defaults while still keeping `Command`, `Arguments`, and `StoreResultAs` local to the probe.

The existing `redisResults` placeholder behavior is unchanged; global-dictionary fallback only affects configuration loading.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.
