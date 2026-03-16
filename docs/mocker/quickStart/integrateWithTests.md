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

If either value is missing, the mocker still starts its servers and skips the controller.

## Action Names Matter

Runner mocker commands target action names. When you use `Servers`, action names must be unique across all configured servers.

For gRPC actions, if `Actions[].Name` is omitted, uniqueness falls back to `<ServiceName>.<RpcName>`.

## Related References

- [Controller configuration reference](../userInterfaces/mocker/configurationSections/controller/overview.md)
- [Server configuration reference](../userInterfaces/mocker/configurationSections/server/overview.md)
