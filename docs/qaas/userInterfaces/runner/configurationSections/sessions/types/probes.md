---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.probes
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Probes run infrastructure actions in a session without adding interaction data to SessionData."
---
# Probes

> TL;DR — Probes run infrastructure actions in a session without adding interaction data to SessionData.

Probes are based on the `IProbe` hook contract and are actions that affect the system or its underlying infrastructure without saving interaction data, which means they do not modify the `SessionData` object at all.

Probes can use `SessionData` and [DataSources](../../dataSources/overview.md) in order to get relevant information to perform their action.

In order to see all of the available probes visit [QaaS.Common.Probes](../../../../../../probes/index.md).

## See also {: #see-also}

- [Sessions](../overview.md)
