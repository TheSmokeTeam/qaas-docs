# Integrate with Tests

For end-to-end integration between tests and a mock server, configure the `Controller` section in `mocker.qaas.yaml`.

The Controller bridges `QaaS.Runner` tests and `QaaS.Mocker` servers via Redis pub/sub. Tests send commands to the mocker, making it perform specific actions. See [Mocker Commands](REDA/configurationSections/sessions/types/mockerCommands/) for details.

## Configuring Controller

In order to let the tests and the mocker recognize each other, we configure a controller by setting a name for our mocker server and a redis connection.

```mocker.qaas.yaml```

```yaml
Controller:
  ServerName: MockerExample
  Redis: # relevant redis connection
```
