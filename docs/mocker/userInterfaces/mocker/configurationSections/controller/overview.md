# Controller

`Controller` is optional. When `Controller.ServerName` and `Controller.Redis` are both configured, QaaS.Mocker starts a Redis-backed controller alongside the server runtime.

Runner tests use this controller to send [mocker commands](../../../../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) such as changing the stub behind an action, triggering an action, or consuming cached input and output.

If `ServerName` or `Redis` is missing, the mocker still starts its configured servers and skips the controller.

## What the Controller Exposes

- `Ping`, which reports the logical server name, the server instance id, and the runtime input/output mode
- `ChangeActionStub`, which changes the stub behind a named action
- `TriggerAction`, which is intended for socket actions
- `Consume`, which drains cached input and output traffic into Redis queues for the configured server name

`ServerName` is the logical controller identifier. Keep it stable between the mocker and the Runner configuration that targets it.

**Table Property Path** - `Controller`

```yaml
Controller:
  ServerName: MockerExample
  Redis:
    Host: localhost:6379
```
