# Probes

> TL;DR — Probes run infrastructure actions in a session without adding interaction data to SessionData.

Probes are based on the `IProbe` hook contract and are actions that affect the system or its underlying infrastructure without saving interaction data, which means they do not modify the `SessionData` object at all.

Probes can use `SessionData` and [DataSources](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/dataSources/overview/index.md) in order to get relevant information to perform their action.

In order to see all of the available probes visit [QaaS.Common.Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md).

## See also

- [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
