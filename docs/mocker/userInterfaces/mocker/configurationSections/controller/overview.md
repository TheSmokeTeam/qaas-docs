# Controller

The `Controller` section is optional. When configured with a usable Redis connection, it enables [QaaS.Runner](../../../../../qaas/index.md) [Mocker Commands](../../../../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) such as changing action stubs, triggering actions, and consuming cached transactions.

The controller is built only when:

- `Controller.ServerName` is set
- `Controller.Redis` is configured with a usable Redis host

If the Redis connection is missing or unavailable, the runtime skips controller startup and the servers still run.
