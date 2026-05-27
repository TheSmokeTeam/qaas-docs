---
id: qaas.userinterfaces.runner.configurationsections.sessions.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, overview]
summary: "Sessions define the runtime actions Runner performs against the system under test and supporting infrastructure."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Sessions

> TL;DR — Sessions define the runtime actions Runner performs against the system under test and supporting infrastructure.

## When to use {: #when-to-use}

The Sessions section defines the runtime work that [QaaS.Runner](../../../../../qaas/index.md) performs against the system under test and its supporting infrastructure. A session combines shared session-level settings with one or more action collections.

At a high level, the action collections fall into two categories:

- [`Probe actions`](types/probes.md) are actions that affect the system or its underlying infrastructure but do not save information related to the interaction with the system.
- `Communication actions` are actions that send or receive data from the system or its underlying infrastructure and save that data in the `SessionData`.

Communication actions are further divided into these sub-categories:

- [`Publishers`](types/publishers.md) send data.
- [`Consumers`](types/consumers.md) receive data.
- [`Collectors`](types/collectors.md) collect data from an endpoint within a certain time range in a single action.
- [`Transactions`](types/transactions.md) send and receive data.

[`MockerCommands`](types/mockerCommands.md) are separate from the communication-action group. They control [QaaS.Mocker](../../../../../mocker/index.md) during a Runner session and can optionally create input and output data depending on the command.

Shared [Policies](types/policies.md) are not a separate action type. They are attached to supported communication actions to control pace, retries, load shape, and stopping conditions.

!!! Tip "Connection Timeouts"
    The more asynchronous actions that use network resources you have in a session, the more likely you are to get connection timeouts.
    If you are experiencing timeouts, try increasing the relevant action's network connection timeout configurations, which may vary between different actions.
    If you increase the timeout of a communication action, make sure your consuming communication action's timeout is substantially higher or you might experience loss of data.

## YAML configuration {: #yaml-configuration}

Use `Sessions[]` for session entries. Put communication work under `Publishers`, `Consumers`, `Collectors`, and `Transactions`; put infrastructure work under `Probes`; put Mocker control work under `MockerCommands`.

The complete schema-derived field list is in the [configuration table](configurations/tableView.md). The copy-ready scaffold is in the [YAML scaffold](configurations/yamlView.md).

## SessionData Structure {: #sessiondata-structure}

`SessionData` is the outcome produced by every session run. It contains a list of `inputs` and a list of `outputs`.
The inputs are produced from any data sent to the tested system and their name is the name of the action that produced them.
The outputs are produced from any data received from the tested system and their name is the name of the action that produced them.
Both the inputs' and outputs' items are arranged by timestamp in ascending order.

## Serialized Data Based Communications And Deserialized Data Based Communications {: #serialized-data-based-communications-and-deserialized-data-based-communications}

Every communication action can either work with serialized `byte[]` data or with a deserialized C# object.

Communication actions that work with serialized data can be configured to serialize generated data before sending it, and can also deserialize received data before saving it to the `SessionData`.

Communication actions that work with deserialized data must receive the C# object they work with directly, and for output actions they save the deserialized data as received to the `SessionData`.

## Edge cases {: #edge-cases}

- Consumer timeouts should be longer than the producer-side timing they wait for.
- Communication actions save `SessionData`; probe actions usually affect infrastructure without producing session inputs or outputs.
- Mocker Commands are control actions and should be kept separate from normal protocol communication actions.

## See also {: #see-also}

- [Configuration table](configurations/tableView.md)
- [YAML scaffold](configurations/yamlView.md)
- [Publishers](types/publishers.md)
- [Consumers](types/consumers.md)
- [Transactions](types/transactions.md)
- [MockerCommands](types/mockerCommands.md)
