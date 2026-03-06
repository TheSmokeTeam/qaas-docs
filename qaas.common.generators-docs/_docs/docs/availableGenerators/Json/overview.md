# Json

Supports generating data from a **single DataSource** that contains a **single Json**.
Given Json Deserielized as `JsonObject` or `JsonArray` of `System.Text.Json`.
Generates data in the following order:

1. Deep Clones the given Json.
2. If configured: Injects **Manual** or **DataSource** given values to fields.  > ⚠ Replaces value of already existing fields.
3. If configured: Parses the Json to a different output object.

!!! info "Data Structure"
    === ":octicons-file-code-16: `Data`"
        ```yaml
        Body: <object>
        ```

## DataSource Parameters

* **Generator Name** - `Json`.
* **DataSources** - All Used.
* **SessionData** - Passed to used DataSources.
