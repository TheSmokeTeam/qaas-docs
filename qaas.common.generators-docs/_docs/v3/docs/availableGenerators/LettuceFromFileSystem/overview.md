# LettuceFromFileSystem

Retrieves lettuce data from a configured path to a directory in the file system.

???- info "Data Structure"
    === ":octicons-file-code-16: `Data`"
        ```yaml
        Body: <byte[]>
        MetaData:
          Storage:
              Key: <string> # The identifier of the item, decided by the `StorageMetaData` configuration property.
          RabbitMq:
            RoutingKey: <string> # The routing key in the lettuce file.
        ```

## DataSource Parameters

* **Generator Name** - `LettuceFromFileSystem`.
* **DataSources** - Not Used.
* **SessionData** - Not Used.
