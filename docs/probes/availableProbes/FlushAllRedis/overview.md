# FlushAllRedis

Runs Redis FLUSHALL against the configured server to remove keys from every database.

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
          UseGlobalDict: true
          HostNames:
            - localhost:6379
```

## What This Configuration Does

This configuration performs a full Redis server flush against `localhost:6379`.

After the probe runs, all Redis databases on that server are emptied.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing server connection fields can be resolved from the session-scoped `Redis/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when a maintenance step should reuse the same Redis server definition without repeating it.

No recovery alias is involved for this probe.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.
