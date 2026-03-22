# DataSourceResponseProcessor

Selects generated data from one configured data source and turns that payload into the HTTP response body. It supports first, last, and explicit index selection, plus an optional fallback body when selection fails.

## Processor Parameters

- **Processor Name** - `DataSourceResponseProcessor`.
- **ProcessorConfiguration** - `DataSourceResponseConfiguration`.
- **DataSources** - Uses the configured stub data sources.
- **RequestData** - Does not inspect the request body.
- **SessionData** - Not used.
