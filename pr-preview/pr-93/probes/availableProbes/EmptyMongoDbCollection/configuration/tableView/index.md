# EmptyMongoDbCollection Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                         | Type                        | Required | Default | Description                                                                                                                                                                     |
| ------------------------------------- | --------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                  | `object or string`          | ✖        |         |                                                                                                                                                                                 |
| `ProbeConfiguration.CollectionName`   | `string`                    | ✔        |         | Name of the collection in the database to perform the operation on                                                                                                              |
| `ProbeConfiguration.ConnectionString` | `string`                    | ✔        |         | Connection string to the MongoDB server                                                                                                                                         |
| `ProbeConfiguration.DatabaseName`     | `string`                    | ✔        |         | Name of the database to perform the operation on                                                                                                                                |
| `ProbeConfiguration.ChunkSize`        | `integer or string or null` | ✖        |         | Optional chunk size for MongoDB operations that process documents in batches. Operations that run as a single database command may accept this shared setting without using it. |
| `ProbeConfiguration.UseGlobalDict`    | `string or true/false`      | ✖        | `False` | When true, missing MongoDB probe configuration keys can be resolved from the shared global dictionary before local values are applied.                                          |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/EmptyMongoDbCollection/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/EmptyMongoDbCollection/overview/index.md)
