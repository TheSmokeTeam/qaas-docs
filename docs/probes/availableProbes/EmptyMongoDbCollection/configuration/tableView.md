<!-- generated hash:0c91ea1d2e11 sources:runner-family, EmptyMongoDbCollection, table-view -->

# EmptyMongoDbCollection Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.CollectionName` | `string` | &#10004 |  | Name of the collection in the database to perform the operation on |
| `ProbeConfiguration.ConnectionString` | `string` | &#10004 |  | Connection string to the MongoDB server |
| `ProbeConfiguration.DatabaseName` | `string` | &#10004 |  | Name of the database to perform the operation on |
| `ProbeConfiguration.ChunkSize` | `integer or string or null` | &#10006 |  | Chunk size of the data to process, This represents the number of documents to process in a single operation. If not specified, all data will be processed in a single chunk. |
