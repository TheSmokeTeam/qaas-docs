# FromCSV

Reads CSV files from the configured file-system path and turns each row into a generated data item. It reuses the file-discovery behavior of `FromFileSystem`, then parses rows according to the delimiter, header, and trimming settings.

???- info "Data Structure"
    === ":octicons-file-code-16: `Data`"
        ```yaml
        Body: <object>
        MetaData:
            Storage:
              Key: <string> # Includes the file key plus the CSV row index
        ```

## DataSource Parameters

- **Generator Name** - `FromCSV`.
- **DataSources** - Not used.
- **SessionData** - Not used.
