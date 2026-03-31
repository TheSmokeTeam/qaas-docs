# ExecuteRedisCommands

Executes multiple Redis commands sequentially against the selected Redis database, allowing later commands to reuse earlier results through redisResults placeholders and optional looping.

## What It Does

Runs a configured sequence of Redis commands in order against the selected database.

It is useful when a scenario needs a small Redis setup script, such as creating a key and then seeding a list or hash before the tested system starts consuming from it.

## YAML Example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: ExecuteRedisCommandsProbe
        Probe: ExecuteRedisCommands
        ProbeConfiguration:
          UseGlobalDict: true
          HostNames:
            - localhost:6379
          RedisDataBase: 0
          Commands:
            - Command: SET
              Arguments:
                - qaas:mode
                - docs
            - Command: LPUSH
              Arguments:
                - qaas:jobs
                - first-job
```

## What This Configuration Does

This probe first sets `qaas:mode` to `docs`, then pushes `first-job` into the `qaas:jobs` list.

Because the commands are executed in sequence, the Redis state is prepared deterministically before the next scenario step runs.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing `HostNames`, authentication fields, and `RedisDataBase` can be resolved from the session-scoped `Redis/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when several Redis command probes should share one connection definition while each probe keeps its own command list.

The existing `redisResults` placeholder behavior is unchanged; global-dictionary fallback only affects configuration loading.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.
