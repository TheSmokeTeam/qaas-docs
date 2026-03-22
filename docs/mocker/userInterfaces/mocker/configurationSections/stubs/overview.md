# Stubs

`Stubs` are the mock behaviors executed by server actions. Each stub resolves one `ITransactionProcessor` hook and can optionally:

- consume one or more configured data sources
- deserialize incoming request bodies before processor execution
- serialize outgoing response bodies after processor execution

The current configuration model uses `ProcessorConfiguration` for hook-specific settings. `ProcessorSpecificConfiguration` is the older name and should not be used in new files.
