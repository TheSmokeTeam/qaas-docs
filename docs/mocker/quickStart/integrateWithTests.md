# Integrate with Tests

In some cases we may want complete integration between our tests and our mock server.

In order to do so we can configure the optional section `Controller` section in the `mocker.qaas.yaml`

The controller is the interface between the `QaaS.Runner`'s tests and `QaaS.Mocker`'s servers. The servers and the tests are both connecting to redis and communicating with each other that way. The tests can send specific commands to the mocker, making it do some specific action. More on that in [QaaS Docs](REDA/configurationSections/sessions/types/mockerCommands/)

## Configuring Controller

In order to let the tests and the mocker recognize each other, we configure a controller by setting a name for our mocker server and a redis connection.

```mocker.qaas.yaml```

```yaml
Controller:
  ServerName: MockerExample
  Redis: # relevant redis connection
```
