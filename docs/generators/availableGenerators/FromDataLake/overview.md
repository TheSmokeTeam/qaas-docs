# FromDataLake

Retrieves rows from the configured data lake query and exposes each row as a generated JSON object.

## What It Does

Runs a Trino query and emits the returned rows as generated JSON-like objects.

This generator is useful when test data already lives in a lakehouse or analytics system and you want the scenario to read it directly instead of exporting it first. Optional ignored columns let you drop fields that are not relevant for the rest of the flow.

## YAML Example

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

## What This Configuration Does

This configuration connects to Trino, runs the provided query, and turns each result row into one generated item.

The `debug_flag` column is removed before the items are exposed to the rest of the configuration, so downstream consumers only see `order_id` and `customer_id`.
