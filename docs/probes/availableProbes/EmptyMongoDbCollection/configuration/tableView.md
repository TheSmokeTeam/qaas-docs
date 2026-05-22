---
id: probes.availableprobes.emptymongodbcollection.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, availableprobes, emptymongodbcollection, configuration, tableview]
summary: "EmptyMongoDbCollection Configurations Table View"
---
# EmptyMongoDbCollection Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.CollectionName` | `string` | &#10004 |  | Name of the collection in the database to perform the operation on |
| `ProbeConfiguration.ConnectionString` | `string` | &#10004 |  | Connection string to the MongoDB server |
| `ProbeConfiguration.DatabaseName` | `string` | &#10004 |  | Name of the database to perform the operation on |
| `ProbeConfiguration.ChunkSize` | `integer or string or null` | &#10006 |  | Chunk size of the data to process, This represents the number of documents to process in a single operation. If not specified, all data will be processed in a single chunk. |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing MongoDB probe configuration keys can be resolved from the shared global dictionary before local values are applied. |
