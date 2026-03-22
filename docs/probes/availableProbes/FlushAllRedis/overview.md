# FlushAllRedis

Runs Redis FLUSHALL against the configured server to remove keys from every database.

## Probe Parameters

- **Probe Name** - `FlushAllRedis`.
- **ProbeConfiguration** - `BaseRedisConfig`.
- **DataSources** - Not used.
- **SessionData** - Not used.
- **Execution stage** - Typically used in setup or cleanup stages around Runner sessions.
