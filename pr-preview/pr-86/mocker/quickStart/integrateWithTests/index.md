# Integrate with Tests

> TL;DR — Connect Runner tests to a Mocker instance through the Controller section and Runner Mocker Commands.

For end-to-end integration between [QaaS.Runner](https://TheSmokeTeam.github.io/qaas-docs/qaas/index.md) tests and a mock server, configure the [Controller](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/overview/index.md) section in `mocker.qaas.yaml`.

The controller bridges `QaaS.Runner` tests and `QaaS.Mocker` servers via Redis pub/sub. Tests send commands to the mocker, making it perform specific actions. See [Mocker Commands](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands/index.md) for details.

## Configuring Controller

To let the tests and the mocker recognize each other, configure a server name and a Redis connection.

`mocker.qaas.yaml`

```yaml
Controller:
  ServerName: MockerExample
  Redis:
    Host: redis:6379
    RedisDataBase: 0
```

## See also

- [Create a mock in YAML](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/createMock/index.md)
- [Controller](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/overview/index.md)
- [Mocker Commands](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands/index.md)
- [Debug a failed test](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/debugTestFailure/index.md)
