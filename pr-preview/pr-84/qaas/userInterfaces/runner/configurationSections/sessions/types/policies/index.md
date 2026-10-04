# Policies

> TL;DR — Policies control communication action pace, retries, limits, and phased traffic patterns.

Policies shape how [communication actions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md) behave while a session is running. They let you control pace, retries, limits, and phased traffic patterns without rewriting the action itself, which makes them the main lever for turning a simple functional check into a realistic workload profile.

Use them when the same [Publisher](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/publishers/index.md), [Consumer](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/consumers/index.md), [Transaction](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/transactions/index.md), or [Mocker Command](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands/index.md) needs to behave differently under smoke, load, soak, or ramp scenarios. In practice, policies are what let you keep one test definition and still express "send slowly", "burst in stages", "stop after this limit", or "keep pushing until timeout" in a clear, reusable way.

In order to see all the available policies visit [QaaS.Framework.Policies](https://TheSmokeTeam.github.io/qaas-docs/framework/projects/policies/index.md).

## See also

- [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
