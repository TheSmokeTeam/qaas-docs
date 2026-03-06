# FromLettuceDataSources

Supports generating data from multiple DataSources that contain lettuce files.

!!! info "Data Structure"
    === ":octicons-file-code-16: `Data`"
        ```yaml
        Body: <byte[]>
        MetaData:
          RabbitMq:
            RoutingKey: <string> # The routing key in the lettuce file.
        ```

## DataSource Parameters

* **Generator Name** - `FromLettuceDataSources`.
* **DataSources** - All Used. Must all be deserialized with `Json` as its default type (JsonNode).
* **SessionData** - Passed to used DataSources.
