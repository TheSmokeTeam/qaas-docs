# QaaS Mocker

**QaaS.Mocker** is the mock-server runtime in the QaaS ecosystem. It runs HTTP, gRPC, and socket mocks from YAML or from code, routes incoming traffic to named stubs, and lets each stub shape its response through reusable or project-local processors.

|             |                                                           |
| ----------- | --------------------------------------------------------- |
| **Runtime** | .NET 10                                                   |
| **Package** | `QaaS.Mocker` (NuGet)                                     |
| **Source**  | [Repository - QaaS.Mocker]({{ links.repository_mocker }}) |
| **Docker**  | Multi-stage Dockerfile included                           |

## Key Capabilities

- **Protocol coverage** - host HTTP, gRPC, TCP, and UDP mocks from one process.
- **Composable responses** - map endpoints to named stubs, then let processors turn request data and optional data sources into responses.
- **Data-backed stubs** - preload files or generated data and reuse them across multiple endpoints and actions.
- **Runtime control** - use the optional controller to switch stubs or drive runtime state externally during Runner flows.
- **Plugin model** - load processors and generators from the project itself, local assemblies, or NuGet packages.
- **YAML and code parity** - keep the mock definition in `mocker.qaas.yaml`, build it fluently in C#, or combine both.

See [Architecture](architecture.md) for the runtime layout.
