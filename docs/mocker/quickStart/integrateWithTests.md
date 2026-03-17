# Integrate with Tests

Use the optional `Controller` section when `QaaS.Runner` tests need to change stubs, trigger actions, or consume cached mocker traffic through [Mocker Commands](../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md).

```yaml
Controller:
  ServerName: MockerExample
  Redis:
    Host: localhost:6379
```

## When the Controller Starts

The current runtime starts the controller only when both of the following are configured:

- `Controller.ServerName`
- `Controller.Redis`

If either value is missing, the mocker still starts its configured servers and skips the controller.

## Action Names Matter

Runner mocker commands target action names. When you use `Servers`, action names must be unique across all configured servers.

For gRPC actions, if `Actions[].Name` is omitted, uniqueness falls back to `<ServiceName>.<RpcName>`.

## Supported Controller Operations

The current Redis controller supports:

- `Ping`, which reports the server name, server instance id, and input/output capture mode
- `ChangeActionStub`, which rebinds a named action to a different loaded stub
- `TriggerAction`, which is implemented for socket actions and is not implemented for HTTP or gRPC actions
- `Consume`, which drains captured input and output traffic into Redis queues for the configured server name

`Consume` works with the runtime's current capture mode:

- HTTP and gRPC runtimes capture both input and output
- socket `Collect` endpoints capture input
- socket `Broadcast` endpoints capture output
- mixed socket configurations can expose both

## Related References

- [Controller configuration reference](../userInterfaces/mocker/configurationSections/controller/overview.md)
- [Server configuration reference](../userInterfaces/mocker/configurationSections/server/overview.md)
