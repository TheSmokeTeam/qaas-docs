---
id: mocker.quickstart.integratewithtests
type: tutorial
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [mocker]
keywords: [mocker, quickstart, integratewithtests]
summary: "For end-to-end integration between QaaS.Runner tests and a mock server, configure the Controller section in mocker.qaas.yaml."
---
# Integrate with Tests

> TL;DR — Connect Runner tests to a Mocker instance through the Controller section and Runner Mocker Commands.

For end-to-end integration between [QaaS.Runner](../../qaas/index.md) tests and a mock server, configure the [Controller](../userInterfaces/mocker/configurationSections/controller/overview.md) section in `mocker.qaas.yaml`.

The controller bridges `QaaS.Runner` tests and `QaaS.Mocker` servers via Redis pub/sub. Tests send commands to the mocker, making it perform specific actions. See [Mocker Commands](../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) for details.

## Configuring Controller {: #configuring-controller}

To let the tests and the mocker recognize each other, configure a server name and a Redis connection.

`mocker.qaas.yaml`

```yaml
Controller:
  ServerName: MockerExample
  Redis:
    Host: redis:6379
    RedisDataBase: 0
```

## See also {: #see-also}

- [Create a mock in YAML](createMock.md)
- [Controller](../userInterfaces/mocker/configurationSections/controller/overview.md)
- [Mocker Commands](../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md)
- [Debug a failed test](../../qaas/quickStart/debugTestFailure.md)
