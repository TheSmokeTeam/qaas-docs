# QaaS Documentation

**QaaS (QA As A Service)** is a .NET 10 ecosystem for integration and end-to-end testing of backend applications. Define tests in YAML, extend behaviour with C# hooks, and validate results — all with minimal boilerplate.

## Quick Navigation

<div class="grid cards" markdown>

-   :material-rocket-launch:{ .lg .middle } **Getting Started**

    ---

    Install the SDK, write your first test in YAML, run it, and read the Allure report — in under 10 minutes.

    [:octicons-arrow-right-24: Start Here](qaas/quickStart/installation.md)

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

### :material-hammer-wrench: Phase 1 — Setup

1. [**Installation**](qaas/quickStart/installation.md) — Install .NET 10, configure NuGet feeds, scaffold a project
2. [**IDE Setup**](qaas/quickStart/ide.md) — Enable YAML auto-complete & validation in VS Code or Rider

### :material-pencil: Phase 2 — Build

3. [**Write a Test (YAML)**](qaas/quickStart/writeTestYaml.md) — Write a minimal YAML test, define data sources, sessions, and assertions
4. [**Write a Test (Code)**](qaas/quickStart/writeTestCode.md) — Same test using C# builders instead
5. [**Write Custom Hooks**](qaas/quickStart/writeHooks.md) — Create your own generators, assertions, probes, and processors

### :material-play-circle: Phase 3 — Run & Debug

6. [**Run a Test**](qaas/quickStart/runTest.md) — Execute tests and view results in the Allure report
7. [**Debug Failures**](qaas/quickStart/debugTestFailure.md) — Split act/assert, inspect session data, diagnose issues

### :material-trophy: Phase 4 — Master

8. [**Maintainable Tests**](qaas/quickStart/makeTestMoreMaintainable.md) — Improve structure by using anchors, placeholders, and variable files
9. [**Architecture**](qaas/architecture.md) — Understand the Runner pipeline and design complex scenarios
