# EmptyMongoDbCollection Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `Object | String` | &#10006 |  |  |
| `ProbeConfiguration.CollectionName` | `String` | &#10004 |  | Name of the collection in the database to perform the operation on |
| `ProbeConfiguration.ConnectionString` | `String` | &#10004 |  | Connection string to the MongoDB server |
| `ProbeConfiguration.DatabaseName` | `String` | &#10004 |  | Name of the database to perform the operation on |
| `ProbeConfiguration.ChunkSize` | `Integer | Null | String` | &#10006 |  | Chunk size of the data to process, This represents the number of documents to process in a single operation. If not specified, all data will be processed in a single chunk. |
