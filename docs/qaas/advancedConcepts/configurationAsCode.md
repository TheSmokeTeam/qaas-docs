# Configuration as Code

While YAML offers a concise, human-readable way to define test scenarios, **Configuration as Code (CaC)** lets you harness the full power of C# for dynamic, conditional, and reusable test orchestration.

This guide keeps the original Configuration as Code mental model, but updates it to match the current behavior of [QaaS.Runner](../index.md) and [QaaS.Mocker](../../mocker/index.md).

---

## Initialization: Bootstrap the Runner

The entry point for a normal [QaaS.Runner](../index.md) startup flow is the `Bootstrap` class, which initializes the runtime from command-line style arguments and optional configuration files.

```csharp
using QaaS.Runner;

var runner = Bootstrap.New(args);
```

### Key Responsibilities of `Bootstrap.New(args)`

- Parses command-line arguments (`args`) with support for overrides.
- Normalizes obvious configuration-path inputs to `run <config-file>`.
- Loads and merges configuration from YAML when YAML is part of the chosen startup path.
- Applies overwrite files, overwrite folders, overwrite arguments, pushed references, and optional environment-variable overrides.
- Returns a ready-to-modify `Runner` object.

> **Best Practice**: Use `Bootstrap.New(args)` when you want CLI behavior and code behavior to stay aligned.

---

## Current Bootstrap Resolution Rules

The important point today is to separate two questions:

1. How QaaS resolves configuration when you stay on the normal bootstrap path.
2. How your host chooses between a YAML-defined path and a code-defined path before it calls that bootstrap path.

### Runner

When you use `QaaS.Runner.Bootstrap.New(args)`:

- `Bootstrap.New(null)` or `Bootstrap.New([])` writes help text. Empty arguments are treated as a host decision, not as "load the default YAML file".
- `Bootstrap.New(["test.qaas.yaml"])` is normalized to `run test.qaas.yaml`.
- `Bootstrap.New(["run"])` uses the default configuration file name `test.qaas.yaml`.
- If the YAML file is missing and no `IExecutionBuilderConfigurator` is discovered, Runner fails.
- If the YAML file is missing but one or more `IExecutionBuilderConfigurator` implementations are discovered, Runner can continue and build the execution in code.

Runner recognizes these execution modes:

- `run`
- `act`
- `assert`
- `template`
- `execute`

### Mocker

When you use `QaaS.Mocker.Bootstrap.New(args)`:

- `Bootstrap.New(null)` or `Bootstrap.New([])` writes help text.
- `Bootstrap.New(["mocker.qaas.yaml"])` is normalized to `run mocker.qaas.yaml`.
- `Bootstrap.New(["run"])` uses the default configuration file name `mocker.qaas.yaml`.
- If the YAML file is missing and no `IExecutionBuilderConfigurator` is discovered, Mocker continues down the normal file-loading path and fails.
- If the YAML file is missing but configurators are discovered, Mocker can continue and build the execution in code.

Mocker recognizes these execution modes:

- `run`
- `template`

In other words, empty arguments no longer mean "guess the default YAML file". That choice now belongs to the host.

---

## The `Runner`: Central Orchestrator of Test Executions

The `Runner` class represents the core execution context. It manages one or more `ExecutionBuilder` instances, each representing one logical execution.

A normal `run`, `act`, `assert`, or `template` command usually produces a single execution builder. `execute` and case expansion can produce several execution builders, which are then materialized and run by the same `Runner`.

For more detail about executions, see [QaaS.Framework.Executions](../../framework/projects/executions.md).

### Core Properties

| Property | Description |
|--------|-------------|
| `ExecutionBuilders` | A list of `ExecutionBuilder` instances, each representing a separate execution context. |
| `ExitProcessOnCompletion` | Controls whether `Runner.Run()` terminates the current process after the run completes. Defaults to `true`. Set it to `false` when the host wants Runner to set the process exit code without calling `Environment.Exit`. |
| `LoadVariablesIntoGlobalDict` | Controls whether Runner copies the root YAML `variables` section into the shared runtime global dictionary under `Variables` while building executions. Defaults to `true`. |
| `LastExitCode` | Stores the exit code produced by the most recent successful runner execution. This is useful when the host calls `Run()` or `RunAndGetExitCode()` and wants to inspect the last completed result afterward. |

### Accessing the Runner

```csharp
using QaaS.Runner;

var runner = Bootstrap.New(args);
var executionBuilders = runner.ExecutionBuilders;
```

> **Note**: At this stage, no execution has occurred. The `Runner` is configured and ready for programmatic modification.

If the host should keep control of process termination, disable the default exit behavior before calling `Run()`:

```csharp
var runner = Bootstrap.New(args);
runner.ExitProcessOnCompletion = false;

runner.Run();
var exitCode = runner.LastExitCode;
```

If you do not want YAML `variables` copied into runtime state, disable that before the executions are built:

```csharp
var runner = Bootstrap.New(args);
runner.LoadVariablesIntoGlobalDict = false;
```

---

## ExecutionBuilder: Define a Logical Test Execution

Each `ExecutionBuilder` encapsulates the configuration for a single execution. It composes multiple components that define behavior, data flow, and validation.

| Component | Purpose |
|--------|--------|
| `Sessions` | Defines one or more [SessionBuilder](../functions/builders/sessions.md) instances, each representing a sequence of actions against the system. |
| `Storages` | Configures [Storages](../userInterfaces/runner/configurationSections/storages/overview.md) such as file systems, S3, and databases. |
| `Assertions` | Specifies validation rules and outcome checks through [Assertions](../userInterfaces/runner/configurationSections/assertions/overview.md). |
| `DataSources` | Defines [DataSources](../userInterfaces/runner/configurationSections/dataSources/overview.md), [Generators](../../generators/index.md), and reusable data inputs. |
| `Links` | Integrates external observability systems through [Links](../userInterfaces/runner/configurationSections/links/overview.md) such as Prometheus or Grafana. |

### Accessing Builder Components

```csharp
using QaaS.Framework.SDK.Extensions;

var runner = QaaS.Runner.Bootstrap.New(args);
var executionBuilder = runner.ExecutionBuilders.AsSingle();

var sessionBuilders = executionBuilder.ReadSessions();
var storageBuilders = executionBuilder.ReadStorages();
var assertionBuilders = executionBuilder.ReadAssertions();
var linkBuilders = executionBuilder.ReadLinks();
var dataSourceBuilders = executionBuilder.ReadDataSources();
```

### Reading and Updating Builder State

The current public Runner execution builder surface supports explicit create, read, update, and delete operations:

- sessions: `CreateSession`, `ReadSessions`, `UpdateSession`, `DeleteSession`
- assertions: `CreateAssertion`, `ReadAssertions`, `UpdateAssertion`, `DeleteAssertion`
- storages: `CreateStorage`, `ReadStorages`, `UpdateStorageAt`, `DeleteStorageAt`
- data sources: `CreateDataSource`, `ReadDataSources`, `UpdateDataSource`, `DeleteDataSource`
- links: `CreateLink`, `ReadLinks`, `UpdateLinkAt`, `DeleteLinkAt`

That makes Configuration as Code practical not only for "build from scratch" scenarios, but also for "load from YAML, then modify precisely" scenarios.

When the runtime data you want to share belongs in the execution's mutable state rather than in the immutable YAML tree, use the [Global Dictionary](globalDictionary.md) pattern alongside these builder operations. Runner now bridges those two worlds by default for the root `variables` section, storing it at `["Variables", ...]` in the shared global dictionary.

---

## Modifying Builders: Fluent Configuration via Code

QaaS provides a fluent, type-safe API for modifying configuration programmatically.

### Example: Rename a Session and Set Its Stage

```csharp
using QaaS.Framework.SDK.Extensions;

var runner = QaaS.Runner.Bootstrap.New(args);
var executionBuilder = runner.ExecutionBuilders.AsSingle();

executionBuilder.UpdateSession(
    "ExistingSession",
    session => session
        .Named("NewSessionName")
        .AtStage(2));
```

!!! warning "Important"
    On a session builder, `.AtStage(n)` sets `Stage = n` and `RunUntilStage = n + 1`.
    That is the current fluent-code helper behavior.
    In YAML, `Stage` and `RunUntilStage` are still separate fields.

---

## Configuration Paths in Runner

In practice, Runner configuration as code is usually one of three shapes:

1. **Strictly code-defined**: the host chooses a code-only path and lets configurators build the execution when no YAML file is present.
2. **Hybrid**: YAML provides the base structure and code mutates the loaded builders.
3. **Multi-execution orchestration**: one `Runner` owns several `ExecutionBuilder` instances.

### Strictly Code-Defined Runner Configuration

For Runner, a pure code-defined path still goes through bootstrap. The difference is that the host decides up front that no YAML file is part of the scenario.

The supported path today is:

- call `Bootstrap.New(...)` with an explicit execution mode such as `run`
- let Runner discover one or more `IExecutionBuilderConfigurator` implementations
- allow those configurators to populate the `ExecutionBuilder` when the configuration file is missing

```csharp
using QaaS.Framework.Executions;
using QaaS.Runner;
using QaaS.Runner.Sessions.Session.Builders;

public sealed class MyExecutionConfigurator : IExecutionBuilderConfigurator
{
    public void Configure(ExecutionBuilder executionBuilder)
    {
        executionBuilder.WithMetadata(new MetaDataConfig
        {
            Team = "Docs",
            System = "AdvancedConcepts"
        });

        executionBuilder.CreateSession(
            new SessionBuilder().Named("CodeOnlySession"));
    }
}

var runner = Bootstrap.New(["run"]);
var exitCode = runner.RunAndGetExitCode();
```

Runner discovers configurators from:

- the entry assembly
- already loaded assemblies
- public or nested-public configurator types in copied output DLLs under the application base directory

Two points matter here:

- `Bootstrap.New([])` is **not** the code-only path; empty arguments still print help.
- If the expected YAML file is missing and no configurator is discovered, Runner fails.

### Hybrid Configuration: YAML First, Then Code

Hybrid configuration is the most direct replacement for the older CaC flow: load the execution from YAML, then adjust only what should be dynamic in code.

```csharp
using QaaS.Framework.SDK.Extensions;

var runner = QaaS.Runner.Bootstrap.New(["run", "test.qaas.yaml"]);
var executionBuilder = runner.ExecutionBuilders.AsSingle();

executionBuilder.UpdateSession(
    "RabbitMqExchangeWithFromFileSystemTestData",
    session => session
        .Named("RenamedSession")
        .AtStage(2));
```

This is the right path when:

- YAML is the reviewed baseline
- code fills environment-specific values
- the host wants CLI overlays and YAML structure, but not a fully static run plan

### One Runner, Several Executions

If one logical run should own several executions, prefer **one `Runner` with several `ExecutionBuilder` instances**.

That happens in two current places:

- `execute`, where Runner bootstraps one child command at a time and then flattens the child `ExecutionBuilders` into one outer runner
- case expansion, where one command is expanded into one builder per discovered case

```yaml
Commands:
  - Id: first
    Command: template test.qaas.yaml
  - Id: second
    Command: act test.qaas.yaml
```

```csharp
var runner = QaaS.Runner.Bootstrap.New(["execute", "executable.yaml"]);
var builders = runner.ExecutionBuilders;
```

A few runtime details are important:

- the child runners created by `execute` do **not** run independently; their builders are flattened into the outer runner
- when the outer runner materializes executions, it pushes one shared global dictionary into every execution builder in that runner invocation
- the runner then starts the materialized executions **sequentially**

So if you need several executions that share per-run global state, use one runner with several execution builders rather than several unrelated runner objects.

### Several Runner Instances in One Host

A host can also create several `Runner` instances intentionally. That is a separate orchestration choice.

```csharp
using QaaS.Runner;

var smokeRunner = Bootstrap.New(["run", "smoke.qaas.yaml"]);
var regressionRunner = Bootstrap.New(["run", "regression.qaas.yaml"]);

var smokeExitCode = smokeRunner.RunAndGetExitCode();
var regressionExitCode = regressionRunner.RunAndGetExitCode();
```

The important difference is lifecycle:

- each runner bootstraps and builds independently
- each runner owns its own execution lifecycle
- `Run()` exits the current process by default, so multi-runner hosts should use `RunAndGetExitCode()` or set `ExitProcessOnCompletion = false`

Use several runner instances only when the lifecycles should stay independent. Use one runner when the executions are part of one shared run plan.

---

## Advanced Integration

For more complex integrations, QaaS exposes builder patterns that accept configuration objects directly.

### Example: Add a Kafka Topic Publisher

The example below assumes the execution already contains:

- exactly one session
- a data source named `DataSource`

```csharp
using Confluent.Kafka;
using QaaS.Framework.Protocols.ConfigurationObjects.Kafka;
using QaaS.Framework.SDK.Extensions;
using QaaS.Runner;
using QaaS.Runner.Sessions.Actions.Publishers.Builders;

var runner = Bootstrap.New(args);
var executionBuilder = runner.ExecutionBuilders.AsSingle();
var sessionBuilder = executionBuilder.ReadSessions().AsSingle();

var kafkaPublisher = new PublisherBuilder()
    .Named("KafkaPublisher")
    .Configure(new KafkaTopicSenderConfig
    {
        TopicName = "test-topic",
        Username = "admin",
        Password = "secret",
        HostNames = ["kafka1.example.com", "kafka2.example.com"],
        SaslMechanism = SaslMechanism.ScramSha256,
        SecurityProtocol = SecurityProtocol.SaslPlaintext
    })
    .CreateDataSource("DataSource");

sessionBuilder.CreatePublisher(kafkaPublisher);

runner.Run();
```

> **Benefits**:
>
> - Full access to the C# ecosystem.
> - Dynamic configuration based on environment, runtime state, or external inputs.
> - Reusable, testable, and version-controlled code.

---

## Mocker: Configuration as Code

[QaaS.Mocker](../../mocker/index.md) supports the same general idea, but its runtime shape is simpler: one execution builder, one mocker runner, and a public execution-builder surface that can be built directly in code.

The current Mocker execution builder supports explicit create, read, update, and delete operations for:

- data sources
- transaction stubs
- servers
- controller configuration

That makes two Mocker styles valid today:

- **bootstrap + configurator**: use `QaaS.Mocker.Bootstrap.New(args)` and optionally implement `IExecutionBuilderConfigurator`
- **direct builder path**: create `new QaaS.Mocker.ExecutionBuilder()`, configure it in code, then run it through `new MockerRunner(executionBuilder).Run()`

Use the bootstrap path when you want CLI normalization, overlay handling, and environment-variable behavior. Use the direct builder path when the host already knows it wants a pure code-defined mock runtime.

---

## Custom Runner: Extend and Override Core Behavior

When default behavior is insufficient, QaaS allows you to extend the `Runner` class and override lifecycle methods to implement custom orchestration logic.

### `Runner.Run()` Logic

`Run()` is a lifecycle wrapper around setup, execution building, execution start, teardown, and completion handling. It is responsible for things such as:

- optional Allure results cleanup before execution
- building `Execution` instances from `ExecutionBuilder` instances
- starting the materialized executions
- teardown and optional results serving
- process-exit or exit-code handling

### Inherit from `Runner`

```csharp
using System;
using System.Collections.Generic;
using Autofac;
using Microsoft.Extensions.Logging;
using QaaS.Framework.Executions;
using QaaS.Runner;

public class MyCustomRunner : Runner
{
    public MyCustomRunner(
        ILifetimeScope scope,
        List<ExecutionBuilder> executionBuilders,
        ILogger logger,
        Serilog.ILogger serilogLogger,
        bool emptyResults = false,
        bool serveResults = false)
        : base(scope, executionBuilders, logger, serilogLogger, emptyResults, serveResults)
    {
    }

    protected override void Setup()
    {
        Console.WriteLine("Custom setup: initializing test environment...");
        base.Setup();
    }

    protected override void Teardown()
    {
        Console.WriteLine("Custom teardown: cleaning up resources...");
        base.Teardown();
    }

    protected override List<Execution> BuildExecutions()
    {
        var executions = base.BuildExecutions();
        return executions;
    }
}
```

> **Note**: Use `base.` calls when you want to preserve the built-in behavior and extend it, rather than replace it.

---

## Using the Custom Runner

To activate your custom runner, use the generic `Bootstrap.New<TRunner>` overload:

```csharp
QaaS.Runner.Bootstrap.New<MyCustomRunner>(args).Run();
```

QaaS.Mocker exposes the same pattern through `QaaS.Mocker.Bootstrap.New<TRunner>(args)`, where `TRunner` inherits from `MockerRunner`.

---

## Advanced Use Case: Conditional Test Orchestration

Programmatic orchestration is especially useful when execution order depends on runtime outcome.

### Example: Chaos Engineering Workflow

```csharp
using System.Collections.Generic;

protected override int StartExecutions(List<Execution> executions)
{
    int? finalResult = null;

    var steadyStateResult = executions[0].Start();

    if (steadyStateResult == 0)
    {
        executions[1].Start();
        finalResult = executions[0].Start();

        if (finalResult != 0)
            executions[2].Start();
    }

    return finalResult ?? steadyStateResult;
}
```

> **Benefits**:
>
> - Dynamic decision-making based on real-time outcomes.
> - Support for rollback, retry, or cleanup logic.
> - Full access to execution state and results.

---

## Template Validation

The `template` command is the simplest parity check between YAML and code-defined configuration.

For Runner and Mocker alike:

- YAML remains the easiest reviewed baseline.
- Code can generate the effective YAML-equivalent shape.
- Template output gives you a concrete way to check whether the code-defined path still represents the same runtime structure.

This is especially useful in hybrid projects that keep both a checked-in YAML definition and a code-defined variant of the same scenario.

---

## Keep the Host Process Alive After `Run()`

`Runner.Run()` exits the current process by default when execution completes. In `Runner`, this behavior is controlled by `ExitProcessOnCompletion`, which defaults to `true`.

If you are embedding QaaS.Runner inside another host process, set it to `false` before calling `Run()`:

```csharp
using System;
using QaaS.Runner;

var runner = Bootstrap.New(args);
runner.ExitProcessOnCompletion = false;

runner.Run();

Console.WriteLine($"Runner finished and the host is still alive. ExitCode={Environment.ExitCode}");
```

If you want the exit code without applying the default completion policy, use `RunAndGetExitCode()` instead.

```csharp
using System;
using QaaS.Runner;

var runner = Bootstrap.New(args);
var exitCode = runner.RunAndGetExitCode();

Console.WriteLine($"Runner completed with exit code {exitCode}");
```

With Configuration as Code, configuration is not just defined, it is engineered.
