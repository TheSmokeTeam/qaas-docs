---
id: probes.available.dropmongodbcollection.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, DropMongoDbCollection, configuration, reference]
summary: "Field-by-field reference for DropMongoDbCollection ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---

# DropMongoDbCollection Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.CollectionName` | `string` | &#10004 |  | Name of the collection in the database to perform the operation on |
| `ProbeConfiguration.ConnectionString` | `string` | &#10004 |  | Connection string to the MongoDB server |
| `ProbeConfiguration.DatabaseName` | `string` | &#10004 |  | Name of the database to perform the operation on |
| `ProbeConfiguration.ChunkSize` | `integer or string or null` | &#10006 |  | Optional chunk size for MongoDB operations that process documents in batches. Operations that run as a single database command may accept this shared setting without using it. |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing MongoDB probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
