---
id: mocker.userinterfaces.mocker.configurationsections.controller.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [mocker]
keywords: [mocker, userinterfaces, configurationsections, controller, overview]
summary: "The Controller section lets Runner Mocker Commands coordinate a running mock through Redis-backed control channels."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\schema.json -->

# Controller

> TL;DR — Configure Controller when Runner needs to coordinate a running mock through Redis-backed control channels.

## When to use {: #when-to-use}

The `Controller` section is optional. When configured with a usable Redis connection, it enables [QaaS.Runner](../../../../../qaas/index.md) [Mocker Commands](../../../../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) such as changing action stubs, triggering actions, and consuming cached transactions.

The controller is built only when:

- `Controller.ServerName` is set
- `Controller.Redis` is configured with a usable Redis host

If the Redis connection is missing or unavailable, the runtime skips controller startup and the servers still run.

## YAML configuration {: #yaml-configuration}

Use `Controller.ServerName` for the controller identity and `Controller.Redis` for the Redis connection used by Runner Mocker Commands.

The complete schema-derived field list is in the [configuration table](configurations/tableView.md). The copy-ready scaffold is in the [YAML scaffold](configurations/yamlView.md).

## Edge cases {: #edge-cases}

- Controller is optional; omit it when Runner does not need to issue Mocker Commands.
- Controller startup is skipped when the Redis configuration is missing or not usable.
- Server stubs still run when the controller is not started.

## See also {: #see-also}

- [Configuration table](configurations/tableView.md)
- [YAML scaffold](configurations/yamlView.md)
- [Mocker Commands](../../../../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md)
- [Servers](../server/overview.md)
