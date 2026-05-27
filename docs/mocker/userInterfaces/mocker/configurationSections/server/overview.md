---
id: mocker.userinterfaces.mocker.configurationsections.server.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [mocker]
keywords: [mocker, userinterfaces, configurationsections, server, overview]
summary: "Servers defines the HTTP, gRPC, or socket endpoints that QaaS.Mocker starts for a mock execution."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\schema.json -->

# Servers

> TL;DR — Servers defines the HTTP, gRPC, or socket endpoints that QaaS.Mocker starts for a mock execution.

## When to use {: #when-to-use}

`Servers` defines the runtime endpoints that [QaaS.Mocker](../../../../../mocker/index.md) starts for a mock execution. Each item represents one server instance, and each instance can expose one protocol configuration such as `Http`, `Grpc`, or `Socket`.

Use `Servers` when you need to run multiple listeners at the same time, or when different protocols require isolated settings such as ports, TLS credentials, endpoint mappings, or socket options. The list shape keeps each server self-contained so configuration for one transport does not bleed into another.

The most common usage patterns are:

- A single HTTP server for REST-style stubs.
- A gRPC server for generated services and RPC handlers.
- A socket server for streaming or connection-oriented flows.
- Multiple server entries in the same mocker run when the system under test needs more than one protocol exposed at once.

`Servers` is the preferred shape for new docs and runtime usage. The legacy `Server` property remains supported as a single-server shorthand, but it is intentionally described here only as a compatibility path.

When reading the configuration reference, keep in mind that the server sections describe transport behavior, not [Stub](../stubs/overview.md) behavior. [Stubs](../stubs/overview.md) still define the mocked responses and actions, while `Servers` only controls how those stubs are exposed over the network.

## YAML configuration {: #yaml-configuration}

Use `Servers[]` for new mock configurations. Each entry contains the protocol branch it exposes, such as `Http`, `Grpc`, or `Socket`.

The complete schema-derived field list is in the [configuration table](configurations/tableView.md). The copy-ready scaffold is in the [YAML scaffold](configurations/yamlView.md).

## Edge cases {: #edge-cases}

- Keep transport configuration in `Servers`; keep response behavior in [Stubs](../stubs/overview.md).
- Use multiple `Servers[]` entries when different protocols or listeners need isolated settings.
- The legacy single `Server` shape is compatibility-only for older configurations.

## See also {: #see-also}

- [Configuration table](configurations/tableView.md)
- [YAML scaffold](configurations/yamlView.md)
- [Stubs](../stubs/overview.md)
- [Multi-server routing](../../../../authoring-guide/multi-server-routing.md)
