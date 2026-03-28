# QaaS Runner

**QaaS.Runner** is the execution engine of the QaaS ecosystem. It loads YAML or code-based test configuration, runs setup and cleanup hooks, drives protocol [Sessions](userInterfaces/runner/configurationSections/sessions/overview.md) against the system under test, stores the resulting session data, evaluates [Assertions](userInterfaces/runner/configurationSections/assertions/overview.md), and writes [Allure Report](userInterfaces/runner/allureReport.md) results.

|             |                                                   |
| ----------- | ------------------------------------------------- |
| **Runtime** | .NET 10                                           |
| **Package** | `QaaS.Runner` (NuGet)                             |
| **Source**  | [QaaS.Runner]({{ links.repository_runner }}) |

## Key Capabilities

- **YAML and code configuration** - keep the execution in `test.qaas.yaml`, build it in C#, or combine both through [Configuration as Code](advancedConcepts/configurationAsCode.md).
- **Multi-stage execution** - run [Probes](userInterfaces/runner/configurationSections/sessions/types/probes.md), [Publishers](userInterfaces/runner/configurationSections/sessions/types/publishers.md), [Consumers](userInterfaces/runner/configurationSections/sessions/types/consumers.md), [Transactions](userInterfaces/runner/configurationSections/sessions/types/transactions.md), [Collectors](userInterfaces/runner/configurationSections/sessions/types/collectors.md), and [Mocker Commands](userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) as part of one execution graph.
- **Protocol abstraction** - test HTTP, messaging, storage-backed, and other protocol flows through the same session model.
- **Hook ecosystem** - plug in [QaaS.Common.Generators](../generators/index.md), [QaaS.Common.Assertions](../assertions/index.md), [QaaS.Common.Probes](../probes/index.md), and project-local hooks from the same execution.
- **Report output** - persist execution results and render pass/fail status into [Allure-compatible output](userInterfaces/runner/allureReport.md).
- **Composable tests** - split reusable [DataSources](userInterfaces/runner/configurationSections/dataSources/overview.md), [Sessions](userInterfaces/runner/configurationSections/sessions/overview.md), [Assertions](userInterfaces/runner/configurationSections/assertions/overview.md), and overrides instead of encoding everything into one file.
