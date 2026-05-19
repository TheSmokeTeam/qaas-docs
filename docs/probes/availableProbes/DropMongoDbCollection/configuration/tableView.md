# DropMongoDbCollection Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.CollectionName` | `string` | &#10004 |  | Name of the collection in the database to perform the operation on |
| `ProbeConfiguration.ConnectionString` | `string` | &#10004 |  | Connection string to the MongoDB server |
| `ProbeConfiguration.DatabaseName` | `string` | &#10004 |  | Name of the database to perform the operation on |
| `ProbeConfiguration.ChunkSize` | `integer or string or null` | &#10006 |  | Accepted from the shared MongoDB configuration shape but not used by this probe; the collection is dropped in one operation. |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing MongoDB probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
