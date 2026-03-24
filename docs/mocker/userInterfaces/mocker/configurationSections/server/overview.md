# Servers

`Servers` defines the runtime endpoints that `QaaS.Mocker` starts for a mock execution. Each item represents one server instance, and each instance can expose one protocol configuration such as `Http`, `Grpc`, or `Socket`.

Use `Servers` when you need to run multiple listeners at the same time, or when different protocols require isolated settings such as ports, TLS credentials, endpoint mappings, or socket options. The list model keeps each server self-contained so configuration for one transport does not bleed into another.

The most common usage patterns are:

- A single HTTP server for REST-style stubs.
- A gRPC server for generated services and RPC handlers.
- A socket server for streaming or connection-oriented flows.
- Multiple server entries in the same mocker run when the system under test needs more than one protocol exposed at once.

`Servers` is the preferred model for new docs and runtime usage. The legacy `Server` property remains supported as a single-server shorthand, but it is intentionally described here only as a compatibility path.

When reading the configuration reference, keep in mind that the server sections describe transport behavior, not stub behavior. Stubs still define the mocked responses and actions, while `Servers` only controls how those stubs are exposed over the network.
