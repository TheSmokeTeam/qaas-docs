# FromDataLake

> TL;DR — Retrieves rows from the configured data lake query and exposes each row as a generated JSON object.

## When to use

Runs a Trino query and emits the returned rows as generated JSON-like objects.

This generator is useful when test data already lives in a lakehouse or analytics system and you want the scenario to read it directly instead of exporting it first. Optional ignored columns let you drop fields that are not relevant for the rest of the flow.

## YAML configuration

Use the hook name in the matching runtime section, then place hook-specific fields under the configuration object shown in the examples below.

## Minimal example

```yaml
DataSources:
  - Name: OrdersFromDataLake
    Generator: FromDataLake
    GeneratorConfiguration:
      TrinoServerUri: http://trino.local:8080
      Catalog: lakehouse
      Query: SELECT order_id, customer_id, debug_flag FROM qaas.orders
      Username: docs
      Password: docs-password
      ClientTag: qaas-docs
      ColumnsToIgnore:
        - debug_flag
```

## Realistic example

This configuration connects to Trino, runs the provided query, and turns each result row into one generated item.

The `debug_flag` column is removed before the items are exposed to the rest of the configuration, so downstream consumers only see `order_id` and `customer_id`.

## Edge cases

- Missing required configuration keys fail schema validation before the hook runs.
- Keep hook names and referenced session or data-source names aligned with the surrounding YAML.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/FromDataLake/configuration/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/generators/availableGenerators/FromDataLake/configuration/yamlView/index.md)
- [Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md)
