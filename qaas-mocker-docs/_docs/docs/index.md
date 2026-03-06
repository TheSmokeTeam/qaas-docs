# Introduction

`QaaS.Mocker` is the configurable mock-service runtime in the QaaS ecosystem. It lets you stand up HTTP, HTTPS, gRPC, gRPCs, or socket-based mock endpoints with YAML configuration and optional custom processor code.

It is C# based, targets `.NET 10`, and is designed to work well with `QaaS.Runner` integration tests when you need controllable dependencies around the system under test.

At a high level:

- `DataSources` provide reusable input data when a processor needs it
- `Stubs` bind a named processor to optional configuration and data sources
- `Server` exposes protocol endpoints and routes requests to stub-backed actions
- `Controller` enables runtime coordination from tests through Redis / KeyDB

Start with the quick-start pages if you want to create a new mock quickly. Use the configuration reference pages once you need to tune endpoints, controller behavior, or protocol-specific settings.
