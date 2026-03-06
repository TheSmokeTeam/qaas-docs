# FromSessionDataDataSources

Supports generating data from multiple DataSources that contain SessionData files.

!!! info "Data Structure"
    === ":octicons-file-code-16: `Data`"
        ```yaml
        Body: <object>
        MetaData: <object> # Whatever metadata the data from the SessionData had
        ```

## DataSource Parameters

* **Generator Name** - `FromSessionDataDataSources`.
* **DataSources** - All Used. Must all be serialized (`byte[]`) `SessionData` items.
* **SessionData** - Passed to used DataSources.
