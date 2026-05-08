# Mocker Commands

Mocker commands connect [QaaS.Runner](../../../../../../qaas/index.md) tests to [QaaS.Mocker](../../../../../../mocker/index.md) servers. They let a test dynamically change mock behavior, trigger mock-side actions, or consume mock activity during the execution of a test session.

For the transport-side configuration, see [QaaS.Mocker Servers](../../../../../../mocker/userInterfaces/mocker/configurationSections/server/overview.md).

Some mocker commands do not produce session data. Others interact with the mocker's data and create `Input` and `Output` values in `SessionData` depending on the command type. This allows tests to observe and assert on what external systems are sending to the Mocker.

**Table Property Path** - `Sessions[].MockerCommands[]`

## ChangeActionStub

Changes the stub for a specific mock action endpoint on the fly. This is highly useful for negative testing, or testing multi-stage workflows where an external service's mocked response must change from returning a "Pending" status to a "Completed" status in the middle of a test. The command communicates with the Mocker's control plane to swap out the active stub.

**Table Property Path** - `Sessions[].MockerCommands[].Command.ChangeActionStub`

```yaml
Type: ChangeActionStub
ChangeActionStub: {}
```

## TriggerAction

Triggers a mock action endpoint to spontaneously emit a message or payload. This is heavily utilized when testing asynchronous architectures where the system under test reacts to external webhooks or message queue events. The Runner commands the Mocker to fire the webhook, simulating an external system's spontaneous behavior.

**Table Property Path** - `Sessions[].MockerCommands[].Command.TriggerAction`

```yaml
Type: TriggerAction
TriggerAction: {}
```

## Consume

Consumes data received by the mocker and data sent by the mocker. It queries the Mocker's internal audit log of requests and responses for a given endpoint. This command is critical for asserting that the system under test successfully called an external system with the correct payload and headers. It creates an `Input` and `Output` in the `SessionData` containing the intercepted request and response.

**Table Property Path** - `Sessions[].MockerCommands[].Command.Consume`

```yaml
Consume: {}
```

???- info "Data Structure"
    === ":octicons-file-code-16: `Input`"
    ```yaml
    Body: <byte[]>
    MetaData:
        Http:
            Uri: <Uri>
            RequestHeaders: <IDictionary<string, string>>
    ```
    === ":octicons-file-code-16: `Output`"
    ```yaml
    Body: <byte[]>
    ```
