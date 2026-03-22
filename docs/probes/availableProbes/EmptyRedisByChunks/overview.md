# EmptyRedisByChunks

Scans the selected Redis database in batches and deletes matching keys, optionally filtering them by a regular expression.

## Probe Parameters

- **Probe Name** - `EmptyRedisByChunks`.
- **ProbeConfiguration** - `RedisDataBaseBatchProbeConfig`.
- **DataSources** - Not used.
- **SessionData** - Not used.
- **Execution stage** - Typically used in setup or cleanup stages around Runner sessions.
