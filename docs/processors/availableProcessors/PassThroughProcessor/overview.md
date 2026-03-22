# PassThroughProcessor

Returns the incoming request payload unchanged while applying configured response status and headers. It can preserve the original request metadata or replace it with fresh response metadata.

## Processor Parameters

- **Processor Name** - `PassThroughProcessor`.
- **ProcessorConfiguration** - `PassThroughConfiguration`.
- **DataSources** - Not used.
- **RequestData** - Uses the incoming request body and optional metadata.
- **SessionData** - Not used.
