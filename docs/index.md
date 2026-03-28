# QaaS Documentation

**QaaS (QA As A Service)** is a .NET 10 ecosystem for integration and end-to-end testing of backend applications. Define tests in YAML, extend behavior with C# hooks, and validate results with minimal boilerplate.

## Quick Navigation

<div class="grid cards" markdown>

-   :material-test-tube:{ .lg .middle } **Runner**

    ---

    The [QaaS.Runner](qaas/index.md) test orchestrator. Manages [Sessions](qaas/userInterfaces/runner/configurationSections/sessions/overview.md), [DataSources](qaas/userInterfaces/runner/configurationSections/dataSources/overview.md), [Policies](qaas/userInterfaces/runner/configurationSections/sessions/types/policies.md), [Storages](qaas/userInterfaces/runner/configurationSections/storages/overview.md), and [Assertions](qaas/userInterfaces/runner/configurationSections/assertions/overview.md) via YAML or code.

    [:octicons-arrow-right-24: Runner Docs](qaas/index.md)

-   :material-server:{ .lg .middle } **Mocker**

    ---

    Spin up [QaaS.Mocker](mocker/index.md) HTTP, gRPC, or socket mock servers with configurable [Stubs](mocker/userInterfaces/mocker/configurationSections/stubs/overview.md), [Servers](mocker/userInterfaces/mocker/configurationSections/server/overview.md), and runtime [Controller](mocker/userInterfaces/mocker/configurationSections/controller/overview.md) support via Redis.

    [:octicons-arrow-right-24: Mocker Docs](mocker/index.md)

-   :material-check-all:{ .lg .middle } **Hooks**

    ---

    Reusable [QaaS.Common.Assertions](assertions/index.md), [QaaS.Common.Generators](generators/index.md), [QaaS.Common.Probes](probes/index.md), and [QaaS.Common.Processors](processors/index.md). Plug them into any test.

    [:octicons-arrow-right-24: Hooks Reference](assertions/index.md)

-   :material-puzzle:{ .lg .middle } **Framework**

    ---

    The shared [QaaS.Framework](framework/index.md) foundation that [QaaS.Runner](qaas/index.md), [QaaS.Mocker](mocker/index.md), and custom hooks build on: SDK types, configuration loading, protocol abstractions, serialization, [Policies](framework/projects/policies.md), and DI providers.

    [:octicons-arrow-right-24: Framework Docs](framework/index.md)

</div>

## Zero-to-Hero Path

| Phase                                  | # | Guide                                                             | Description                                                              |
|----------------------------------------|:-:|-------------------------------------------------------------------|--------------------------------------------------------------------------|
| :material-hammer-wrench: **Setup**     | 1 | [Installation](qaas/quickStart/installation.md)                   | Install .NET 10, configure NuGet feeds, scaffold a project               |
|                                        | 2 | [IDE Setup](qaas/quickStart/ide.md)                               | Enable YAML auto-complete and validation in VS Code or Rider             |
| :material-pencil: **Build**            | 3 | [Write a Test (YAML)](qaas/quickStart/writeTestYaml.md)           | Write a minimal YAML test, define [DataSources](qaas/userInterfaces/runner/configurationSections/dataSources/overview.md), [Sessions](qaas/userInterfaces/runner/configurationSections/sessions/overview.md), and [Assertions](qaas/userInterfaces/runner/configurationSections/assertions/overview.md) |
|                                        | 4 | [Write a Test (Code)](qaas/quickStart/writeTestCode.md)           | Same test using C# builders instead                                      |
|                                        | 5 | [Write Custom Hooks](qaas/quickStart/writeHooks.md)               | Create your own [QaaS.Common.Generators](generators/index.md), [QaaS.Common.Assertions](assertions/index.md), [QaaS.Common.Probes](probes/index.md), and [QaaS.Common.Processors](processors/index.md) |
| :material-play-circle: **Run & Debug** | 6 | [Run a Test](qaas/quickStart/runTest.md)                          | Execute tests and view results in the [Allure Report](qaas/userInterfaces/runner/allureReport.md) |
|                                        | 7 | [Debug Failures](qaas/quickStart/debugTestFailure.md)             | Split act/assert, inspect session data, diagnose issues                  |
| :material-trophy: **Master**           | 8 | [Maintainable Tests](qaas/quickStart/makeTestMoreMaintainable.md) | Improve structure by using anchors, placeholders, and variable files     |
|                                        | 9 | [Architecture](qaas/architecture.md)                              | Understand the Runner pipeline and design complex scenarios              |

## Contact Us

Join our community where you can ask questions, report bugs, request features, and interact with the community.

Click [Here]({{ links.qaas_community }}) to join the `QaaS Community`.
