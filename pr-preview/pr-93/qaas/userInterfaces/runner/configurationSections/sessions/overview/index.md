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

Shared [Policies](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/policies/index.md) are not a separate action type. They are attached to supported communication actions to control pace, load shape, and stopping conditions. Retry behavior is configured by the protocol.

Connection Timeouts

The more asynchronous actions that use network resources you have in a session, the more likely you are to get connection timeouts. If you are experiencing timeouts, try increasing the relevant action's network connection timeout configurations, which may vary between different actions. If you increase the timeout of a communication action, make sure your consuming communication action's timeout is substantially higher or you might experience loss of data.

## YAML configuration

Use `Sessions[]` for session entries. Put communication work under `Publishers`, `Consumers`, `Collectors`, and `Transactions`; put infrastructure work under `Probes`; put Mocker control work under `MockerCommands`.

The complete schema-derived field list is in the [configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/configurations/tableView/index.md). The copy-ready scaffold is in the [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/configurations/yamlView/index.md).

## Action concurrency

Action-level workers and action scheduling are separate controls:

| Action                    | Per-action `Parallel.Parallelism` / `.WithParallelism(n)` | How actions overlap                                                                                                         |
| ------------------------- | --------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Publisher                 | Supported; counts sends                                   | Separately named actions have independent worker limits and protocol instances.                                             |
| Chunk publisher           | Supported through PublisherBuilder; counts chunks         | Each active worker can hold a whole chunk.                                                                                  |
| Transaction               | Supported; counts request/response operations             | Workers share the action's transactor; parallel input is materialized per pass.                                             |
| Consumer / chunk consumer | Not supported                                             | Use multiple consumer actions and protocol-specific partitioning, prefetch, batching or S3 download windows.                |
| Probe                     | Not supported by Runner                                   | Each action calls its hook once; any internal concurrency belongs to that hook's configuration.                             |
| Mocker command            | Not supported                                             | Separate command actions can overlap; order dependent commands through explicit orchestration.                              |
| Collector                 | Not supported                                             | Collectors run concurrently in the post-session phase after staged actions finish and collect their configured time ranges. |

For staged actions, `Stage` in YAML or `.AtStage(n)` on the **action builder** selects a launch group. Actions within that group are started concurrently. Runner launches groups in ascending stage order with the configured stage delays, then waits for all staged actions. A stage number is not a completion barrier: a slow action can overlap later groups. Same-stage startup also does not prove that a consumer has connected before a publisher sends. Use protocol readiness and suitable initial/idle timeouts; the consumer defaults to stage 0, publisher to 1, transaction to 2, probe to 3 and Mocker command to 4. `SessionBuilder.AtStage` configures session scheduling and is a different setting.

`Parallel.Parallelism` is local to each publisher/transaction action. There is no session-wide worker budget implied by setting it on one action. Omit the field for sequential work inside that action; use a positive integer to set its worker limit. More workers can increase connection pressure, memory use and out-of-order completion. Shared protocol connections can impose additional serialization, so use the action-specific guidance before increasing the limit.

See [publisher YAML/code stress examples](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/publishers/#parallel-publishing), [concurrent consumer examples](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/consumers/#concurrent-consumers), and [transaction request examples](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/transactions/#parallel-requests). Each action's rate/count/timeout policy is independent; divide an aggregate load target across actions. Bound both run length and retained data when testing a resource-constrained system.

## SessionData Structure

`SessionData` is the outcome produced by every session run. It contains a list of `inputs` and a list of `outputs`. The inputs are produced from any data sent to the tested system and their name is the name of the action that produced them. The outputs are produced from any data received from the tested system and their name is the name of the action that produced them. Each action records its own items. Parallel operations can complete out of source order. Transaction IO match indexes identify pairs within one source pass and restart on each iteration; use application correlation IDs across passes. Do not assume that list positions across actions match. See [transaction concurrency](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/transactions/#parallel-requests) for request/response correlation.

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
