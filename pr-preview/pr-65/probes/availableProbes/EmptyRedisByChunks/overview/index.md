# EmptyRedisByChunks

> TL;DR — Concrete Redis chunk-deletion probe that uses the standard Redis batch probe configuration.

## When to use

Scans the selected Redis database and deletes matching keys in batches instead of trying to remove everything in one call.

An optional key regex narrows the deletion to a subset of keys, which is useful when only one scenario namespace should be cleaned while the rest of the database stays untouched.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: EmptyRedisByChunksProbe
        Probe: EmptyRedisByChunks
        ProbeConfiguration:
          UseGlobalDict: true
          HostNames:
            - localhost:6379
          RedisDataBase: 0
          BatchSize: 500
          KeyRegexPattern: '^qaas:'
```

## Realistic example

This probe connects to Redis database `0`, finds keys that start with `qaas:`, and deletes them in batches of up to 500 keys at a time.

That gives you a focused cleanup step for scenario-owned keys without flushing unrelated Redis data.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing server connection fields and `RedisDataBase` can be resolved from the session-scoped `Redis/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when large cleanup jobs should reuse Redis connection defaults while still keeping the chunk size and scan behavior local.

No recovery alias is involved for this probe.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/EmptyRedisByChunks/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/EmptyRedisByChunks/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
