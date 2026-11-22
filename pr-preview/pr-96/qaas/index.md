# QaaS Runner

> TL;DR — QaaS.Runner loads YAML or C# test configuration, runs sessions, evaluates assertions, and writes report output.

**QaaS.Runner** is the execution engine of the QaaS ecosystem. It loads YAML or code-based test configuration, runs setup and cleanup hooks, drives protocol [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md) against the system under test, stores the resulting session data, evaluates [Assertions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/overview/index.md), and writes [Allure Report](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/allureReport/index.md) results.

|             |                                                            |
| ----------- | ---------------------------------------------------------- |
| **Runtime** | .NET 10                                                    |
| **Package** | `QaaS.Runner` (NuGet)                                      |
| **Source**  | [QaaS.Runner](https://github.com/TheSmokeTeam/QaaS.Runner) |

## Key Capabilities

- **YAML and code configuration** - keep the execution in `test.qaas.yaml`, build it in C#, or combine both through [Configuration as Code](https://TheSmokeTeam.github.io/qaas-docs/qaas/advancedConcepts/configurationAsCode/index.md).
- **Multi-stage execution** - run [Probes](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/probes/index.md), [Publishers](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/publishers/index.md), [Consumers](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/consumers/index.md), [Transactions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/transactions/index.md), [Collectors](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/collectors/index.md), and [Mocker Commands](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands/index.md) as part of one execution graph.
- **Protocol abstraction** - test HTTP, messaging, storage-backed, and other protocol flows through the same session abstraction.
- **Hook ecosystem** - plug in [QaaS.Common.Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md), [QaaS.Common.Assertions](https://TheSmokeTeam.github.io/qaas-docs/assertions/index.md), [QaaS.Common.Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md), and project-local hooks from the same execution.
- **Report output** - persist execution results and render pass/fail status into [Allure-compatible output](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/allureReport/index.md).
- **Composable tests** - split reusable [DataSources](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/dataSources/overview/index.md), [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md), [Assertions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/overview/index.md), and overrides instead of encoding everything into one file.
