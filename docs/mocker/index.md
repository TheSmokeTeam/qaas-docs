# QaaS Mocker

**QaaS.Mocker** is the mock-server runtime in the QaaS ecosystem. It runs HTTP, gRPC, and socket mocks from YAML or from code, routes incoming traffic to named [Stubs](userInterfaces/mocker/configurationSections/stubs/overview.md), and lets each stub shape its response through reusable or project-local [Processors](../processors/index.md).

|             |                                                           |
| ----------- | --------------------------------------------------------- |
| **Runtime** | .NET 10                                                   |
| **Package** | `QaaS.Mocker` (NuGet)                                     |
| **Source**  | [QaaS.Mocker]({{ links.repository_mocker }}) |
| **Docker**  | Multi-stage Dockerfile included                           |

## Key Capabilities

- **Protocol coverage** - host HTTP, gRPC, TCP, and UDP mocks from one process.
- **Composable responses** - map endpoints to named [Stubs](userInterfaces/mocker/configurationSections/stubs/overview.md), then let [Processors](../processors/index.md) turn request data and optional [DataSources](userInterfaces/mocker/configurationSections/dataSources/overview.md) into responses.
- **Data-backed stubs** - preload files or generated data in [DataSources](userInterfaces/mocker/configurationSections/dataSources/overview.md) and reuse them across multiple endpoints and actions.
- **Runtime control** - use the optional [Controller](userInterfaces/mocker/configurationSections/controller/overview.md) to switch stubs or drive runtime state externally during [QaaS.Runner](../qaas/index.md) flows.
- **Plugin model** - load [QaaS.Common.Processors](../processors/index.md) and [QaaS.Common.Generators](../generators/index.md) from the project itself, local assemblies, or NuGet packages.
- **YAML and code parity** - keep the mock definition in `mocker.qaas.yaml`, build it fluently in C#, or combine both through [Configuration as Code](../qaas/advancedConcepts/configurationAsCode.md).

See [Architecture](architecture.md) for the runtime layout.
