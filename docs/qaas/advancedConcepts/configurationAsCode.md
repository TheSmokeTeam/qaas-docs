# Configuration as Code

While YAML offers a concise, human-readable way to define test scenarios, **Configuration as Code (CaC)** lets you harness the full power of C# for dynamic, conditional, and reusable test orchestration.

This guide keeps the original Configuration as Code mental model, but updates it to match the current behavior of QaaS.Runner and QaaS.Mocker.

---

## Initialization: Bootstrap the Runner

The entry point for a normal QaaS.Runner startup flow is the `Bootstrap` class, which initializes the framework from command-line style arguments and optional configuration files.

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

### Accessing the Runner

```csharp
using QaaS.Runner;

var runner = Bootstrap.New(args);
var executionBuilders = runner.ExecutionBuilders;
```

> **Note**: At this stage, no execution has occurred. The `Runner` is configured and ready for programmatic modification.

---

## ExecutionBuilder: Define a Logical Test Execution

Each `ExecutionBuilder` encapsulates the configuration for a single execution. It composes multiple components that define behavior, data flow, and validation.

| Component | Purpose |
|--------|--------|
| `Sessions` | Defines one or more `SessionBuilder` instances, each representing a sequence of actions against the system. |
| `Storages` | Configures data persistence mechanisms such as file systems, S3, and databases. |
| `Assertions` | Specifies validation rules and outcome checks. |
| `DataSources` | Defines generators and reusable data inputs. |
| `Links` | Integrates external observability systems such as Prometheus or Grafana. |

### Accessing Builder Components

```csharp
using System.Linq;

var runner = QaaS.Runner.Bootstrap.New(args);
var executionBuilder = runner.ExecutionBuilders.Single();

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

---

## Modifying Builders: Fluent Configuration via Code

QaaS provides a fluent, type-safe API for modifying configuration programmatically.

### Example: Rename a Session and Set Its Stage

```csharp
using System.Linq;

var runner = QaaS.Runner.Bootstrap.New(args);
var executionBuilder = runner.ExecutionBuilders.Single();
var sessionBuilder = executionBuilder.ReadSessions().Single();

sessionBuilder.Named("NewSessionName");
sessionBuilder.AtStage(2);
```

> **Important**: On a session, `.AtStage(n)` also sets `RunUntilStage` to `n + 1`. Use `RunSessionUntilStage(n)` only when the session must stay active long enough to block a later stage.

---

## Runner: Code-Only and Hybrid Hosts

In practice, Configuration as Code in Runner is usually used in one of three ways:

1. Load YAML through bootstrap, then mutate the loaded `ExecutionBuilder`.
2. Use `IExecutionBuilderConfigurator` so Runner can build or extend the execution in code during the normal bootstrap flow.
3. Let the host decide between an explicit YAML path and an explicit code path before calling bootstrap.

### `IExecutionBuilderConfigurator`

Runner supports discovered configurators through `IExecutionBuilderConfigurator`:

```csharp
using QaaS.Runner;

public sealed class MyExecutionConfigurator : IExecutionBuilderConfigurator
{
    public void Configure(ExecutionBuilder executionBuilder)
    {
        // Add or modify sessions, data sources, storages, assertions, and links here.
    }
}
```

Runner discovers configurators from:

- the entry assembly
- already loaded assemblies
- public types in copied output DLLs under the application base directory

This is the current built-in mechanism that allows a normal bootstrap path to continue even when the expected YAML file is not present.

### Choosing the Host Strategy

The host should decide explicitly which startup path it wants:

- **YAML-first host**: call `Bootstrap.New(args)` with `run <file>`, `run`, or another explicit execution mode.
- **Code-first host**: decide that path in `Program.cs`, then either rely on discovered configurators or build the execution manually.
- **Hybrid host**: keep both paths, but make the choice explicit so an empty argument list does not silently mean two different things.

---

## Advanced Integration

For more complex integrations, QaaS exposes builder patterns that accept configuration objects directly.

### Example: Add a Kafka Topic Publisher

The example below assumes the execution already contains:

- exactly one session
- a data source named `DataSource`

```csharp
using System.Linq;
using Confluent.Kafka;
using QaaS.Framework.Protocols.ConfigurationObjects.Kafka;
using QaaS.Runner;
using QaaS.Runner.Sessions.Actions.Publishers.Builders;

var runner = Bootstrap.New(args);
var executionBuilder = runner.ExecutionBuilders.Single();
var sessionBuilder = executionBuilder.ReadSessions().Single();

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
    .AddDataSource("DataSource");

sessionBuilder.AddPublisher(kafkaPublisher);

runner.Run();
```

> **Benefits**:
>
> - Full access to the C# ecosystem.
> - Dynamic configuration based on environment, runtime state, or external inputs.
> - Reusable, testable, and version-controlled code.

---

## Mocker: Configuration as Code

QaaS.Mocker supports the same general idea, but its runtime shape is simpler: one execution builder, one mocker runner, and a public execution-builder surface that can be built directly in code.

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
using System.Linq;

protected override int StartExecutions(List<Execution> executions)
{
    int? finalResult = null;

    var steadyStateResult = executions.First().Start();

    if (steadyStateResult == 0)
    {
        executions[1].Start();
        finalResult = executions.First().Start();

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

With Configuration as Code, configuration is not just defined - it is engineered.
