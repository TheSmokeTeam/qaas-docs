# Architecture

The [QaaS.Framework](../framework/index.md) runtime is built around a [Plugins](addOns/plugins.md) model that lets you extend and customize QaaS by integrating user-provided packages. This modular design allows for flexible, extensible, and maintainable test automation solutions, where components can be dynamically loaded and orchestrated based on configuration.

---

## QaaS Project Structure

The foundation of any QaaS project is its configuration file, typically a YAML file, which defines the structure, components, and execution flow of the test. This file serves as the entry point for the runtime, orchestrating the initialization and execution of core components in a defined sequence.

The YAML configuration may include:

- Built-in [QaaS.Framework](../framework/index.md) features
- Custom [Plugins](addOns/plugins.md) and hook packages
- References to external services or [DataSources](userInterfaces/runner/configurationSections/dataSources/overview.md)

This declarative approach enables rapid setup and configuration, while still supporting programmatic control through [Configuration as Code](advancedConcepts/configurationAsCode.md).

---

## Types of QaaS Projects

### QaaS.Runner Project

A [QaaS.Runner](index.md) project is a C#-based project that depends on the `QaaS.Runner` NuGet package. Its primary purpose is to serve as a test execution environment for backend or end-to-end (e2e) applications. These projects are driven by either:

- A YAML configuration file
- Programmatic configuration via C# ([Configuration as Code](advancedConcepts/configurationAsCode.md))

The framework components that can be configured are:

| Component       | Description                                                                                                                                                                       |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Storages**    | Manages the persistence and retrieval of test data objects through [Storages](userInterfaces/runner/configurationSections/storages/overview.md) such as file systems, S3, or databases. |
| **DataSources** | Provides test data through [DataSources](userInterfaces/runner/configurationSections/dataSources/overview.md) and configurable generators. |
| **Sessions**    | Executes synchronous or asynchronous work through [Sessions](userInterfaces/runner/configurationSections/sessions/overview.md), such as sending HTTP requests, publishing messages, restarting services, or manipulating state. |
| **Assertions**  | Validates the outcomes of sessions through [Assertions](userInterfaces/runner/configurationSections/assertions/overview.md) and records test results. |
| **Links**       | Integrates with observability systems through [Links](userInterfaces/runner/configurationSections/links/overview.md) to retrieve metrics, logs, or traces for analysis and reporting. |

---

## Configuration as Code

QaaS supports full programmatic configuration through C# code, enabling dynamic, conditional, and reusable test workflows. Instead of relying solely on static YAML files, teams can define and modify test configurations at runtime using the full power of C#.

This approach allows for:

- Dynamic environment-specific setups
- Conditional execution logic
- Reusable configuration patterns via classes and methods
- Integration with external systems using full .NET capabilities

For detailed guidance on implementing Configuration as Code, including custom runners, fluent builder patterns, and advanced orchestration, refer to the [Configuration as Code](advancedConcepts/configurationAsCode.md) documentation.
