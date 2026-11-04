---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.probes
type: reference
status: stable
since: 2.0.0
last_verified: 2026-11-04
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Probes run infrastructure actions in a session without adding interaction data to SessionData."
---
# Probes

> TL;DR — Probes run infrastructure actions in a session without adding interaction data to SessionData.

Probes are based on the `IProbe` hook contract and are actions that affect the system or its underlying infrastructure without saving interaction data, which means they do not modify the `SessionData` object at all.

Probes can use `SessionData` and [DataSources](../../dataSources/overview.md) in order to get relevant information to perform their action.

In order to see all of the available probes visit [QaaS.Common.Probes](../../../../../../probes/index.md).

## Concurrency {: #concurrency}

A Runner probe action invokes `IProbe.Run` once. It has no `Parallel` field or `.WithParallelism` method. Separate probe actions in the same `Stage` can overlap with each other and other staged actions. Their hook implementations must tolerate any shared infrastructure they modify. A hook may expose its own concurrency setting in its `Configuration`; consult that hook's reference rather than adding publisher-style fields to the probe action.

Use probes for setup, checks and cleanup that match the hook's contract. Use [publishers](publishers.md#parallel-publishing) or [transactions](transactions.md#parallel-requests) for paced traffic. Action stages determine launch order and delays, not completion barriers; a setup probe in an earlier stage is not by itself a guarantee that it has completed before traffic starts. See [action concurrency](../overview.md#action-concurrency).

## See also {: #see-also}

- [Sessions](../overview.md)
