# DropMongoDbCollection Configurations Table View

> TL;DR: Field-by-field reference for DropMongoDbCollection ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path                         | Type                        | Required | Default | Description                                                                                                                                                                     |
| ------------------------------------- | --------------------------- | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                  | `object or string`          | ✖        |         |                                                                                                                                                                                 |
| `ProbeConfiguration.CollectionName`   | `string`                    | ✔        |         | Name of the collection in the database to perform the operation on                                                                                                              |
| `ProbeConfiguration.ConnectionString` | `string`                    | ✔        |         | Connection string to the MongoDB server                                                                                                                                         |
| `ProbeConfiguration.DatabaseName`     | `string`                    | ✔        |         | Name of the database to perform the operation on                                                                                                                                |
| `ProbeConfiguration.ChunkSize`        | `integer or string or null` | ✖        |         | Optional chunk size for MongoDB operations that process documents in batches. Operations that run as a single database command may accept this shared setting without using it. |
| `ProbeConfiguration.UseGlobalDict`    | `string or true/false`      | ✖        | False   | When true, missing MongoDB probe configuration keys can be resolved from the shared global dictionary before local values are applied.                                          |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
