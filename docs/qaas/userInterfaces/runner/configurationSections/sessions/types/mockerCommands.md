# Mocker Commands

Mocker commands connect [QaaS.Runner](../../../../../../qaas/index.md) tests to [QaaS.Mocker](../../../../../../mocker/index.md) servers. They let a test dynamically change mock behavior, trigger mock-side actions, or consume mock activity during the execution of a test session.

For the transport-side configuration, see [QaaS.Mocker Servers](../../../../../../mocker/userInterfaces/mocker/configurationSections/server/overview.md).

The core logic of a Mocker Command involves the Runner establishing a control-plane connection to the QaaS.Mocker instance. Rather than interacting with the system under test directly, the Runner sends directive payloads to the Mocker's management API. These directives instruct the Mocker to alter its internal routing rules, simulate asynchronous events, or dump its audit logs. Some mocker commands purely alter state and do not produce session data. Others query the Mocker for historical interaction data and create `Input` and `Output` values in `SessionData` depending on the command type. This out-of-band communication channel is essential for orchestrating complex integration tests where external dependencies must be actively manipulated or closely monitored.

**Table Property Path** - `Sessions[].MockerCommands[]`

## ChangeActionStub

Changes the stub for a specific mock action endpoint on the fly. The core logic of this command revolves around state manipulation within the Mocker instance. The Runner identifies a specific mocked endpoint and transmits a new behavioral definition (the stub) to the Mocker's control plane. Upon receiving this directive, the Mocker immediately updates its routing tables and response generators for that endpoint. Future requests from the system under test to that endpoint will now receive the newly defined response. This mechanism is highly useful for negative testing, or for testing multi-stage workflows where an external service's mocked response must dynamically change from returning a "Pending" status to a "Completed" status in the middle of a test.

**Table Property Path** - `Sessions[].MockerCommands[].Command.ChangeActionStub`

```yaml
Type: ChangeActionStub
ChangeActionStub: {}
```

## TriggerAction

Triggers a mock action endpoint to spontaneously emit a message or payload. Unlike standard mocking where the Mocker waits for incoming requests, the core logic of `TriggerAction` forces the Mocker to initiate an outbound communication. The Runner sends a trigger command containing a specific payload definition to the Mocker. The Mocker then acts as a client, constructing a message (e.g., an HTTP webhook call or an AMQP message) and pushing it to the configured target. This is heavily utilized when testing asynchronous architectures where the system under test must react to external webhook notifications or message queue events, allowing the test to simulate an external system's spontaneous behavior on demand.

**Table Property Path** - `Sessions[].MockerCommands[].Command.TriggerAction`

```yaml
Type: TriggerAction
TriggerAction: {}
```

## Consume

Consumes data received by the mocker and data sent by the mocker. The core logic of the `Consume` command centers around auditing and validation. The Mocker inherently records a detailed log of all incoming requests it receives and outgoing responses it generates. When the Runner issues a `Consume` command, it queries this internal audit log for a specific endpoint. The Mocker retrieves the stored interaction history and transmits it back to the Runner. The Runner then parses this history, mapping the intercepted requests and responses into standard `Input` and `Output` objects within the `SessionData`. This command is critical for verifying that the system under test successfully called an external system, allowing the Runner to perform deep assertions on the exact headers, paths, and payload structures that the application transmitted.

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
