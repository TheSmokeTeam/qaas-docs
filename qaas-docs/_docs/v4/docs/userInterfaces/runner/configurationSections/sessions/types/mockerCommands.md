# Mocker Commands

Mocker commands are the integration between `QaaS.Runner`'s tests to `QaaS.Mocker`'s mock servers.
They provide a way for tests to command and communicate with the mockers.
Further explanation on `QaaS.Mocker` servers can be found [here](REDA)

Some mocker commands don't require any data and thus will not create `Input` or `Output` by their name to the `SessionData`, and other mocker commands interact with the mocker's data and will create `Input` and `Output` by their name in the `SessionData` depending on the specific command.

**Table Property Path** - `Sessions[].MockerCommands[]`

## Mocker Commands Types

### ChangeActionStub

Command the mocker server to change stub for a specific action endpoint by a stub and action name

**Table Property Path** - `Sessions[].MockerCommands[].Command.ChangeActionStub`

```yaml
Type: ChangeActionStub
ChangeActionStub: {}
```

### Consume

Command the mocker server to send the input data received by the mocker and the output data sent by the mocker to the tests. The data received by the mocker will be an `Input` with the name of the mocker action in the `SessionData` and the data sent by the mocker will be an `Output` with the name of the mocker action in the  `SessionData`.

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
                Uri: <Uri> The uri of the request.
                RequestHeaders: <IDictionary<string, string>> # The collection of HTTP request headers.
        ```
    === ":octicons-file-code-16: `Output`"
        ```yaml
        Body: <byte[]>
        ```
