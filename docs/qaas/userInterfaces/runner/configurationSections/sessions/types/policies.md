---
id: qaas.userinterfaces.runner.configurationsections.sessions.types.policies
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, sessions, types]
summary: "Policies shape how communication actions behave while a session is running. They let you control pace, retries, limits, and phased traffic patterns without rewriting the action itself, which makes ..."
---
# Policies

Policies shape how [communication actions](../overview.md) behave while a session is running. They let you control pace, retries, limits, and phased traffic patterns without rewriting the action itself, which makes them the main lever for turning a simple functional check into a realistic workload profile.

Use them when the same [Publisher](publishers.md), [Consumer](consumers.md), [Transaction](transactions.md), or [Mocker Command](mockerCommands.md) needs to behave differently under smoke, load, soak, or ramp scenarios. In practice, policies are what let you keep one test definition and still express "send slowly", "burst in stages", "stop after this limit", or "keep pushing until timeout" in a clear, reusable way.

In order to see all the available policies visit [QaaS.Framework.Policies](../../../../../../framework/projects/policies.md).
