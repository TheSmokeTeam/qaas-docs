# Controller

`Controller` is optional. When `Controller.ServerName` and `Controller.Redis` are both configured, QaaS.Mocker starts a Redis-backed controller alongside the server runtime.

Runner tests use this controller to send [mocker commands](../../../../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) such as changing the stub behind an action, triggering an action, or consuming cached input and output.

If `ServerName` or `Redis` is missing, the mocker still starts its configured servers and skips the controller.

**Table Property Path** - `Controller`

```yaml
Controller:
  ServerName: MockerExample
  Redis:
    Host: localhost:6379
```
