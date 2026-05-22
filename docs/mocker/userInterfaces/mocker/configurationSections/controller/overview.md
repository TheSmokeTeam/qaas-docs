---
id: mocker.userinterfaces.mocker.configurationsections.controller.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, userinterfaces, configurationsections, controller, overview]
summary: "The Controller section is optional. When configured with a usable Redis connection, it enables QaaS.Runner Mocker Commands such as changing action stubs, triggering actions, and consuming cached tr..."
---
# Controller

The `Controller` section is optional. When configured with a usable Redis connection, it enables [QaaS.Runner](../../../../../qaas/index.md) [Mocker Commands](../../../../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) such as changing action stubs, triggering actions, and consuming cached transactions.

The controller is built only when:

- `Controller.ServerName` is set
- `Controller.Redis` is configured with a usable Redis host

If the Redis connection is missing or unavailable, the runtime skips controller startup and the servers still run.
