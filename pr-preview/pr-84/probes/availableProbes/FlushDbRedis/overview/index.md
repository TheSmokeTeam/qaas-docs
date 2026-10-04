# FlushDbRedis

> TL;DR — Runs Redis FLUSHDB against the selected Redis database.

## When to use

Runs `FLUSHDB` on one selected Redis database and removes every key from that database only.

This is safer than `FlushAllRedis` when the Redis server hosts multiple databases and only one of them belongs to the scenario.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: FlushDbRedisProbe
        Probe: FlushDbRedis
        ProbeConfiguration:
          UseGlobalDict: true
          HostNames:
            - localhost:6379
          RedisDataBase: 5
```

## Realistic example

This probe connects to database `5` on `localhost:6379` and removes all keys from that database.

Other Redis databases on the same server are left untouched.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing server connection fields and `RedisDataBase` can be resolved from the session-scoped `Redis/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when a database-scoped flush should reuse Redis connection defaults from an earlier probe.

No recovery alias is involved for this probe.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/FlushDbRedis/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/FlushDbRedis/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
