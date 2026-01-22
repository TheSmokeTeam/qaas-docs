# FromS3

Retrieves data from a configured S3 bucket.

???- info "Data Structure"
    === ":octicons-file-code-16: `Data`"
        ```yaml
        Body: <byte[]>
        MetaData:
            Storage:
              Key: <string> # The identifier of the item, decided by the `StorageMetaData` configuration property
        ```

## DataSource Parameters

* **Generator Name** - `FromS3`.
* **DataSources** - Not Used.
* **SessionData** - Not Used.
