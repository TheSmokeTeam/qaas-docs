# DropMongoDbCollection

> TL;DR — Drops the configured MongoDB collection so a later run can recreate it from scratch.

## When to use

Drops one MongoDB collection completely so later setup can recreate it from scratch.

This is the collection-level reset option when you do not want to preserve collection metadata or existing indexes between runs.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
Sessions:
  - Name: ProbeSession
    Probes:
      - Name: DropMongoDbCollectionProbe
        Probe: DropMongoDbCollection
        ProbeConfiguration:
          UseGlobalDict: true
          ConnectionString: mongodb://localhost:27017
          DatabaseName: qaas
          CollectionName: orders
```

## Realistic example

This probe connects to the `qaas` database and drops the `orders` collection entirely.

Use it when the scenario wants a full MongoDB collection reset rather than a document-only cleanup.

### Global Dictionary Behavior

With `UseGlobalDict: true`, missing `ConnectionString`, `DatabaseName`, and `CollectionName` can be resolved from the session-scoped `MongoDb/Defaults` alias when those keys do not appear in the local probe configuration. The probe still binds and validates after the merge, and any key that is present locally keeps priority over the shared default.

That makes the probe useful when collection maintenance probes should reuse the same MongoDB target definition.

No recovery alias is written for MongoDB in this first pass.

When `UseGlobalDict` is `false`, the probe behaves exactly as before and uses only local YAML or code configuration.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DropMongoDbCollection/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/DropMongoDbCollection/configuration/yamlView/index.md)
- [Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md)
