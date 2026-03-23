# Mocker Commands

Mocker commands connect `QaaS.Runner` tests to `QaaS.Mocker` servers. They let a test change mock behavior, trigger mock-side actions, or consume mock activity.

Further explanation on `QaaS.Mocker` servers can be found [here](../../../../../../mocker/userInterfaces/mocker/configurationSections/server/overview.md).

Some mocker commands do not produce session data. Others interact with the mocker's data and create `Input` and `Output` values in `SessionData` depending on the command type.

**Table Property Path** - `Sessions[].MockerCommands[]`

## Common Fields

The current mocker command schema includes the shared fields below:

- `Name`
- `Stage`
- `ServerName`
- `Redis`
- `Command`
- `RequestDurationMs`
- `RequestRetries`

## ChangeActionStub

Changes the stub for a specific mock action endpoint.

**Table Property Path** - `Sessions[].MockerCommands[].Command.ChangeActionStub`

```yaml
Type: ChangeActionStub
ChangeActionStub: {}
```

## TriggerAction

Triggers a mock action endpoint.

**Table Property Path** - `Sessions[].MockerCommands[].Command.TriggerAction`

```yaml
Type: TriggerAction
TriggerAction: {}
```

## Consume

Consumes data received by the mocker and data sent by the mocker.

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
