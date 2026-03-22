# QaaS Mocker

**QaaS.Mocker** is a lightweight mock-server framework for HTTP, gRPC, and raw TCP/UDP services. It is built on .NET 10, driven by YAML configuration, and designed for tight integration with [QaaS.Runner](../qaas/index.md) tests.

|             |                                                           |
| ----------- | --------------------------------------------------------- |
| **Runtime** | .NET 10                                                   |
| **Package** | `QaaS.Mocker` (NuGet)                                     |
| **Source**  | [Repository - QaaS.Mocker]({{ links.repository_mocker }}) |
| **Docker**  | Multi-stage Dockerfile included                           |

## Key Capabilities

- **HTTP server** - Kestrel-based, with per-endpoint route and method matching plus configurable response stubs.
- **gRPC server** - reflection-based service binding with stubs per service and RPC method.
- **Socket server** - TCP and UDP endpoints with configurable collect or broadcast behavior.
- **Runtime control** - an optional Redis-backed **Controller** lets Runner sessions swap stubs, trigger actions, or consume cached transactions at runtime.
- **Plugin system** - extend the runtime with custom `IProcessor` and `ITransactionProcessor` implementations from the project itself, NuGet packages, or local assemblies.
- **Multi-server support** - run several HTTP, gRPC, and socket servers from one mocker process through the preferred `Servers` configuration model.

## Commands

| Mode       | Description                                     |
| ---------- | ----------------------------------------------- |
| `run`      | Start servers and controller (default)          |
| `lint`     | Validate configuration without starting servers |
| `template` | Print a YAML configuration template             |

See [CLI Commands](userInterfaces/mocker/commands/commands.md) for usage examples and available flags.
