# QaaS Documentation

> TL;DR — QaaS docs cover Runner tests, Mocker services, Framework APIs, shared hooks, integrations, and offline packaging from the same MkDocs source.

**QaaS (QA As A Service)** is a .NET 10 ecosystem for integration and end-to-end testing of backend applications. Define tests in YAML, extend behavior with C# hooks, and validate results with minimal boilerplate.

## Quick Navigation

- **Runner**

  ______________________________________________________________________

  The [QaaS.Runner](https://TheSmokeTeam.github.io/qaas-docs/qaas/index.md) test orchestrator. Manages [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md), [DataSources](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/dataSources/overview/index.md), [Policies](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/policies/index.md), [Storages](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/storages/overview/index.md), and [Assertions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/overview/index.md) via YAML or code.

  [Runner Docs](https://TheSmokeTeam.github.io/qaas-docs/qaas/index.md)

- **Mocker**

  ______________________________________________________________________

  Spin up [QaaS.Mocker](https://TheSmokeTeam.github.io/qaas-docs/mocker/index.md) HTTP, gRPC, or socket mock servers with configurable [Stubs](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/overview/index.md), [Servers](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/server/overview/index.md), and runtime [Controller](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/controller/overview/index.md) support via Redis.

  [Mocker Docs](https://TheSmokeTeam.github.io/qaas-docs/mocker/index.md)

- **Hooks**

  ______________________________________________________________________

  Reusable [QaaS.Common.Assertions](https://TheSmokeTeam.github.io/qaas-docs/assertions/index.md), [QaaS.Common.Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md), [QaaS.Common.Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md), and [QaaS.Common.Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md). Plug them into any test.

  [Hooks Reference](https://TheSmokeTeam.github.io/qaas-docs/assertions/index.md)

- **Framework**

  ______________________________________________________________________

  The shared [QaaS.Framework](https://TheSmokeTeam.github.io/qaas-docs/framework/index.md) foundation that [QaaS.Runner](https://TheSmokeTeam.github.io/qaas-docs/qaas/index.md), [QaaS.Mocker](https://TheSmokeTeam.github.io/qaas-docs/mocker/index.md), and custom hooks build on: SDK types, configuration loading, protocol abstractions, serialization, [Policies](https://TheSmokeTeam.github.io/qaas-docs/framework/projects/policies/index.md), and DI providers.

  [Framework Docs](https://TheSmokeTeam.github.io/qaas-docs/framework/index.md)

## Zero-to-Hero Path

| Phase           | #   | Guide                                                                                                            | Description                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| --------------- | --- | ---------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Setup**       | 1   | [Installation](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/installation/index.md)                   | Install .NET 10, configure NuGet feeds, scaffold a project                                                                                                                                                                                                                                                                                                                                                                                           |
|                 | 2   | [IDE Setup](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/ide/index.md)                               | Enable YAML auto-complete and validation in VS Code or Rider                                                                                                                                                                                                                                                                                                                                                                                         |
| **Build**       | 3   | [Write a Test (YAML)](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/writeTestYaml/index.md)           | Write a minimal YAML test, define [DataSources](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/dataSources/overview/index.md), [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md), and [Assertions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/overview/index.md) |
|                 | 4   | [Write a Test (Code)](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/writeTestCode/index.md)           | Same test using C# builders instead                                                                                                                                                                                                                                                                                                                                                                                                                  |
|                 | 5   | [Write Custom Hooks](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/writeHooks/index.md)               | Create your own [QaaS.Common.Generators](https://TheSmokeTeam.github.io/qaas-docs/generators/index.md), [QaaS.Common.Assertions](https://TheSmokeTeam.github.io/qaas-docs/assertions/index.md), [QaaS.Common.Probes](https://TheSmokeTeam.github.io/qaas-docs/probes/index.md), and [QaaS.Common.Processors](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md)                                                                           |
| **Run & Debug** | 6   | [Run a Test](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/runTest/index.md)                          | Execute tests and view results in the [Allure Report](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/allureReport/index.md)                                                                                                                                                                                                                                                                                                     |
|                 | 7   | [Debug Failures](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/debugTestFailure/index.md)             | Split act/assert, inspect session data, diagnose issues                                                                                                                                                                                                                                                                                                                                                                                              |
| **Master**      | 8   | [Maintainable Tests](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/makeTestMoreMaintainable/index.md) | Improve structure by using anchors, placeholders, and variable files                                                                                                                                                                                                                                                                                                                                                                                 |
|                 | 9   | [Architecture](https://TheSmokeTeam.github.io/qaas-docs/qaas/architecture/index.md)                              | Understand the Runner pipeline and design complex scenarios                                                                                                                                                                                                                                                                                                                                                                                          |

## Contact Us

Join our community where you can ask questions, report bugs, request features, and interact with the community.

Click [Here](https://discord.gg/rg2NYT4Mea) to join the `QaaS Community`.
