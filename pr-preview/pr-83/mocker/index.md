# QaaS Mocker

> TL;DR — QaaS.Mocker runs HTTP, gRPC, and socket mocks from YAML or C# configuration and routes traffic to named stubs.

**QaaS.Mocker** is the mock-server runtime in the QaaS ecosystem. It runs HTTP, gRPC, and socket mocks from YAML or from code, routes incoming traffic to named [Stubs](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/overview/index.md), and lets each stub shape its response through reusable or project-local [Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md).

|             |                                                            |
| ----------- | ---------------------------------------------------------- |
| **Runtime** | .NET 10                                                    |
| **Package** | `QaaS.Mocker` (NuGet)                                      |
| **Source**  | [QaaS.Mocker](https://github.com/TheSmokeTeam/QaaS.Mocker) |
| **Docker**  | Multi-stage Dockerfile included                            |

## Key Capabilities

- **Protocol coverage** - host HTTP, gRPC, TCP, and UDP mocks from one process.
- **Composable responses** - map endpoints to named [Stubs](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/overview/index.md), then let [Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md) turn request data and optional [DataSources](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/dataSources/overview/index.md) into responses.
- **Data-backed stubs** - preload files or generated data in [DataSources](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/dataSources/overview/index.md) and reuse them across multiple endpoints and actions.
- **Runtime control** - use the optional [Controller](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/overview/index.md) to switch stubs or drive runtime state externally during [QaaS.Runner](https://TheSmokeTeam.github.io/qaas-docs/qaas/index.md) flows.
- **Plugin architecture** - load [QaaS.Common.Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md) and [QaaS.Common.Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md) from the project itself, local assemblies, or NuGet packages.
- **YAML and code parity** - keep the mock definition in `mocker.qaas.yaml`, build it fluently in C#, or combine both through [Configuration as Code](https://TheSmokeTeam.github.io/qaas-docs/qaas/advancedConcepts/configurationAsCode/index.md).

See [Architecture](https://TheSmokeTeam.github.io/qaas-docs/mocker/architecture/index.md) for the runtime layout.
