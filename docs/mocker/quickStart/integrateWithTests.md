# Integrate with Tests

For end-to-end integration between [QaaS.Runner](../../qaas/index.md) tests and a mock server, configure the [Controller](../userInterfaces/mocker/configurationSections/controller/overview.md) section in `mocker.qaas.yaml`.

The controller bridges `QaaS.Runner` tests and `QaaS.Mocker` servers via Redis pub/sub. Tests send commands to the mocker, making it perform specific actions. See [Mocker Commands](../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) for details.

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
