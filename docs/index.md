# QaaS Documentation

**QaaS (QA As A Service)** is a .NET 10 ecosystem for integration and end-to-end testing of backend applications. Define tests in YAML, extend behaviour with C# hooks, and validate results — all with minimal boilerplate.

## Quick Navigation

<div class="grid cards" markdown>

-   :material-test-tube:{ .lg .middle } **Runner**

    ---

    The test orchestrator. Manages sessions, data sources, policies, storage, and assertions via YAML or code.

    [:octicons-arrow-right-24: Runner Docs](qaas/index.md)

-   :material-server:{ .lg .middle } **Mocker**

    ---

    Spin up HTTP, gRPC, or Socket mock servers with configurable stubs and runtime control via Redis.

    [:octicons-arrow-right-24: Mocker Docs](mocker/index.md)

-   :material-check-all:{ .lg .middle } **Hooks**

    ---

    Reusable assertions, data generators, environment probes, and transaction processors — plug them into any test.

    [:octicons-arrow-right-24: Hooks Reference](assertions/index.md)

-   :material-puzzle:{ .lg .middle } **Framework**

    ---

    The shared foundation: SDK types, 17-protocol abstraction layer, configuration engine, serialization, policies, and DI providers.

    [:octicons-arrow-right-24: Framework Docs](framework/index.md)

</div>

## Zero-to-Hero Path

| Phase                                  | # | Guide                                                             | Description                                                              |
|----------------------------------------|:-:|-------------------------------------------------------------------|--------------------------------------------------------------------------|
| :material-hammer-wrench: **Setup**     | 1 | [Installation](qaas/quickStart/installation.md)                   | Install .NET 10, configure NuGet feeds, scaffold a project               |
|                                        | 2 | [IDE Setup](qaas/quickStart/ide.md)                               | Enable YAML auto-complete & validation in VS Code or Rider               |
| :material-pencil: **Build**            | 3 | [Write a Test (YAML)](qaas/quickStart/writeTestYaml.md)           | Write a minimal YAML test, define data sources, sessions, and assertions |
|                                        | 4 | [Write a Test (Code)](qaas/quickStart/writeTestCode.md)           | Same test using C# builders instead                                      |
|                                        | 5 | [Write Custom Hooks](qaas/quickStart/writeHooks.md)               | Create your own generators, assertions, probes, and processors           |
| :material-play-circle: **Run & Debug** | 6 | [Run a Test](qaas/quickStart/runTest.md)                          | Execute tests and view results in the Allure report                      |
|                                        | 7 | [Debug Failures](qaas/quickStart/debugTestFailure.md)             | Split act/assert, inspect session data, diagnose issues                  |
| :material-trophy: **Master**           | 8 | [Maintainable Tests](qaas/quickStart/makeTestMoreMaintainable.md) | Improve structure by using anchors, placeholders, and variable files     |
|                                        | 9 | [Architecture](qaas/architecture.md)                              | Understand the Runner pipeline and design complex scenarios              |

## Contact Us

Join our community where you can ask questions, report bugs, request features and interact with the community!

Click [Here]({{ links.qaas_community }}) to join the `QaaS Community` channel.
