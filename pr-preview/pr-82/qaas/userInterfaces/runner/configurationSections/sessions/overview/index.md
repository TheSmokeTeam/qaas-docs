# Sessions

> TL;DR — Sessions define the runtime actions Runner performs against the system under test and supporting infrastructure.

## When to use

The Sessions section defines the runtime work that [QaaS.Runner](https://TheSmokeTeam.github.io/qaas-docs/qaas/index.md) performs against the system under test and its supporting infrastructure. A session combines shared session-level settings with one or more action collections.

At a high level, the action collections fall into two categories:

- [`Probe actions`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/probes/index.md) are actions that affect the system or its underlying infrastructure but do not save information related to the interaction with the system.
- `Communication actions` are actions that send or receive data from the system or its underlying infrastructure and save that data in the `SessionData`.

Communication actions are further divided into these sub-categories:

- [`Publishers`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/publishers/index.md) send data.
- [`Consumers`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/consumers/index.md) receive data.
- [`Collectors`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/collectors/index.md) collect data from an endpoint within a certain time range in a single action.
- [`Transactions`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/transactions/index.md) send and receive data.

[`MockerCommands`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands/index.md) are separate from the communication-action group. They control [QaaS.Mocker](https://TheSmokeTeam.github.io/qaas-docs/mocker/index.md) during a Runner session and can optionally create input and output data depending on the command.

Shared [Policies](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/policies/index.md) are not a separate action type. They are attached to supported communication actions to control pace, retries, load shape, and stopping conditions.

Connection Timeouts

The more asynchronous actions that use network resources you have in a session, the more likely you are to get connection timeouts. If you are experiencing timeouts, try increasing the relevant action's network connection timeout configurations, which may vary between different actions. If you increase the timeout of a communication action, make sure your consuming communication action's timeout is substantially higher or you might experience loss of data.

## YAML configuration

Use `Sessions[]` for session entries. Put communication work under `Publishers`, `Consumers`, `Collectors`, and `Transactions`; put infrastructure work under `Probes`; put Mocker control work under `MockerCommands`.

The complete schema-derived field list is in the [configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/configurations/tableView/index.md). The copy-ready scaffold is in the [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/configurations/yamlView/index.md).

## SessionData Structure

`SessionData` is the outcome produced by every session run. It contains a list of `inputs` and a list of `outputs`. The inputs are produced from any data sent to the tested system and their name is the name of the action that produced them. The outputs are produced from any data received from the tested system and their name is the name of the action that produced them. Both the inputs' and outputs' items are arranged by timestamp in ascending order.

## Serialized Data Based Communications And Deserialized Data Based Communications

Every communication action can either work with serialized `byte[]` data or with a deserialized C# object.

Communication actions that work with serialized data can be configured to serialize generated data before sending it, and can also deserialize received data before saving it to the `SessionData`.

Communication actions that work with deserialized data must receive the C# object they work with directly, and for output actions they save the deserialized data as received to the `SessionData`.

## Edge cases

- Consumer timeouts should be longer than the producer-side timing they wait for.
- Communication actions save `SessionData`; probe actions usually affect infrastructure without producing session inputs or outputs.
- Mocker Commands are control actions and should be kept separate from normal protocol communication actions.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/configurations/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/configurations/yamlView/index.md)
- [Publishers](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/publishers/index.md)
- [Consumers](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/consumers/index.md)
- [Transactions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/transactions/index.md)
- [MockerCommands](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands/index.md)
