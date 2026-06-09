# Controller

> TL;DR — Configure Controller when Runner needs to coordinate a running mock through Redis-backed control channels.

## When to use

The `Controller` section is optional. When configured with a usable Redis connection, it enables [QaaS.Runner](https://TheSmokeTeam.github.io/qaas-docs/qaas/index.md) [Mocker Commands](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands/index.md) such as changing action stubs, triggering actions, and consuming cached transactions.

The controller is built only when:

- `Controller.ServerName` is set
- `Controller.Redis` is configured with a usable Redis host

If the Redis connection is missing or unavailable, the runtime skips controller startup and the servers still run.

## YAML configuration

Use `Controller.ServerName` for the controller identity and `Controller.Redis` for the Redis connection used by Runner Mocker Commands.

The complete schema-derived field list is in the [configuration table](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/configurations/tableView/index.md). The copy-ready scaffold is in the [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/configurations/yamlView/index.md).

## Edge cases

- Controller is optional; omit it when Runner does not need to issue Mocker Commands.
- Controller startup is skipped when the Redis configuration is missing or not usable.
- Server stubs still run when the controller is not started.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/configurations/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/configurations/yamlView/index.md)
- [Mocker Commands](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands/index.md)
- [Servers](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/server/overview/index.md)
