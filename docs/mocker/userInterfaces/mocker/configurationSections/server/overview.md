# Servers

Use `Servers` to configure one or more mock servers in a single runtime.

Each entry in `Servers` must configure exactly one transport:

- `Http`
- `Grpc`
- `Socket`

The legacy `Server` property is still supported for a single server, but new configurations should use `Servers`.

## Multi-Server Behavior

When you configure more than one server:

- all servers run concurrently
- controller commands target actions by action name
- action names must be unique across all configured servers

## HTTP

Use `Http` for REST-like or plain HTTP endpoints. Each endpoint contains one or more method-specific actions.

## gRPC

Use `Grpc` for generated proto services. Each configured service maps RPC method names to transaction stubs.

## Socket

Use `Socket` for TCP or UDP listeners. Each endpoint exposes one action and can either collect incoming data or broadcast data from a configured data source.
