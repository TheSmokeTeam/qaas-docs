# Mocker Commands

Mocker commands connect [QaaS.Runner](../../../../../../qaas/index.md) tests to [QaaS.Mocker](../../../../../../mocker/index.md) servers through the Redis-backed Mocker controller. They let a test dynamically change mock behavior, trigger mock-side actions, or consume mock activity during the execution of a test session.

For the transport-side configuration, see [QaaS.Mocker Servers](../../../../../../mocker/userInterfaces/mocker/configurationSections/server/overview.md).

At runtime the Runner connects to Redis, publishes ping requests to discover live Mocker server instances for `ServerName`, sends the configured command to each discovered instance, waits for acknowledgements, and fails if any expected instance does not report success within the retry window. `Command` is the canonical YAML property; `Configuration` is kept as an alias for the same shape.

Use this page for behavior and YAML shape. The same action can be built in C# with the [MockerCommandBuilder API](../../../../../../qaas/functions/builders/mocker-commands.md); that page is the function reference for the code-first surface.

**Table Property Path** - `Sessions[].MockerCommands[]`

## ChangeActionStub

Changes the transaction stub used by a named mock action. The command updates Mocker runtime state and does not create session `Input` or `Output`.

**Table Property Path** - `Sessions[].MockerCommands[].Command.ChangeActionStub`

```yaml
Type: ChangeActionStub
ChangeActionStub: {}
```

## TriggerAction

Triggers a named mock action on the Mocker side. The command asks the selected Mocker instances to execute the action and does not create session `Input` or `Output`.

**Table Property Path** - `Sessions[].MockerCommands[].Command.TriggerAction`

```yaml
Type: TriggerAction
TriggerAction: {}
```

## Consume

Consumes data captured by the Mocker. After the Redis command succeeds, the Runner reads the Mocker input and/or output Redis queues selected by the server's reported `InputOutputState`. It pops queue items until the consume timeout elapses without another item, applies input and output filters, optionally deserializes the bodies, and stores the consumed values as session `Input` and `Output`.

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
