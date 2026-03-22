# ConditionalResponseProcessor

Evaluates the configured rules in order and returns the first matching response based on a request header value or a captured path parameter. If no rule matches, it returns the configured fallback response.

## Processor Parameters

- **Processor Name** - `ConditionalResponseProcessor`.
- **ProcessorConfiguration** - `ConditionalResponseConfiguration`.
- **DataSources** - Not used.
- **RequestData** - Reads HTTP request headers and path parameters.
- **SessionData** - Not used.
