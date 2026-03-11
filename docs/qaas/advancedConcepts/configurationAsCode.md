# Configuration as Code

While YAML offers a concise, human-readable way to define test scenarios, **Configuration as Code (CaC)** lets you harness the full power of C# for dynamic, conditional, and complex test orchestration.

This guide covers initialization, builder APIs, execution control, and advanced patterns.

---

## Initialization: Bootstrap the Runner

The entry point for every QaaS execution is the `Bootstrap` class, which orchestrates the initialization of the framework based on command-line arguments and optional configuration files.

```csharp
using QaaS.Runner;

var runner = Bootstrap.New(args);
```

### Key Responsibilities of `Bootstrap.New(args)`

- Parses command-line arguments (`args`) with support for overrides.
- Loads and merges configuration from a YAML file (if specified).
- Initializes a fully configured `Runner` instance with default behaviors.
- Returns a ready-to-modify `Runner` object, including host-level behaviors such as process exit handling.

> **Best Practice**: Always use `Bootstrap.New(args)` as the standard entry point. It supports hybrid configuration—YAML for structure, CLI for override—ensuring flexibility across environments.

---

## The `Runner`: Central Orchestrator of Test Executions

The `Runner` class represents the core execution context. It manages one or more `ExecutionBuilder` instances, each defining a distinct logical test run. An `Execution` is the combination of actions performed in a single `Case` or `Command` (when using `execute`). When using `run`, `act`, or `assert`, there is a single execution.

See [QaaS.Framework.Executions](REDA/executions/) for more detail.

### Core Properties

| Property | Description |
|--------|-------------|
| `ExecutionBuilders` | A list of `ExecutionBuilder` instances, each representing a separate test execution context. |

### Accessing the Runner

```csharp
using QaaS.Runner;

var runner = Bootstrap.New(args);
var executionBuilders = runner.ExecutionBuilders;
```

> **Note**: At this stage, no test execution has occurred. The `Runner` is configured and ready for programmatic modification.

---

## Process Exit Behavior

By default, `Runner.Run()` terminates the current process with the aggregated exit code after the runner finishes successfully. That default is convenient for command-line entrypoints and CI jobs that execute exactly one runner.

When you embed QaaS inside another application, or when you want to run several runners sequentially in the same process, disable that behavior and let the outer host decide the final process exit code.

### Disable Process Termination

```csharp
using QaaS.Runner;

var runner = Bootstrap.New(args);
runner.ExitProcessOnCompletion = false;

var exitCode = runner.RunAndGetExitCode();
```

### Relevant APIs

| API | Purpose |
|--------|-------------|
| `ExitProcessOnCompletion` | Controls whether `Run()` terminates the current process when the runner completes successfully. Defaults to `true`. |
| `Run()` | Preserves the default CLI-oriented behavior. If `ExitProcessOnCompletion` is `false`, the runner completes without calling `Environment.Exit(...)`. |
| `RunAndGetExitCode()` | Runs the full lifecycle and returns the aggregated exit code without terminating the current process. |
| `LastExitCode` | Stores the exit code from the most recent successful execution. |

> **Recommendation**: In embedded hosts, prefer `RunAndGetExitCode()` over `Run()` so the outer application can aggregate multiple runner results explicitly.

### Multiple Runners In One Host

```csharp
using QaaS.Runner;

var runnerArguments = new[]
{
    new[] { "run", "api.qaas.yaml" },
    new[] { "run", "messaging.qaas.yaml" },
    new[] { "assert", "shared-storage.qaas.yaml" }
};

var finalExitCode = 0;

foreach (var argsForRunner in runnerArguments)
{
    var runner = Bootstrap.New(argsForRunner);
    runner.ExitProcessOnCompletion = false;

    var exitCode = runner.RunAndGetExitCode();
    if (exitCode != 0)
    {
        finalExitCode = 1;
        break; // Or continue if you want a full sweep before reporting failure
    }
}

Environment.ExitCode = finalExitCode;
```

### `execute` Versus Multiple Runners

- Use `execute` when you want one outer runner lifecycle with one setup, one teardown, and one final exit decision.
- Use multiple runner instances in code when you need the outer host to control sequencing, stopping rules, or final exit-code aggregation.

---

## ExecutionBuilder: Define a Logical Test Execution

Each `ExecutionBuilder` encapsulates the configuration for a single test execution. It composes multiple components that define behavior, data flow, and validation.

| Component | Purpose |
|--------|--------|
| `Sessions` | Defines one or more `SessionBuilder` instances, each representing a sequence of actions against the system. |
| `Storages` | Configures data persistence mechanisms (e.g., file systems, S3, databases). |
| `Assertions` | Specifies validation rules and outcome checks. |
| `DataSources` | All generators to generate data. |
| `Links` | Integrates external observability systems (e.g., Prometheus, Grafana). |

### Accessing Builder Components

```csharp
using QaaS.Framework.SDK.Extensions;

var runner = Bootstrap.New(args);
var executionBuilder = runner.ExecutionBuilders.AsSingle(); // Asserts exactly one

var sessionBuilders = executionBuilder.Sessions;
var storageBuilders = executionBuilder.Storages;
var assertionBuilders = executionBuilder.Assertions;
var linkBuilders = executionBuilder.Links;
var dataSourceBuilders = executionBuilder.DataSources;
```

> **Tip**: Use `AsSingle()` only when you are certain there is exactly one `ExecutionBuilder`. For flexibility, use `First()`, `FirstOrDefault()`, or indexing (`[0]`) when handling dynamic configurations.

---

## Modifying Builders: Fluent Configuration via Code

QaaS provides a fluent, type-safe API for modifying test configurations programmatically. This enables dynamic, conditional, and reusable test logic.

### Example: Rename Session and Set Stage

```csharp
var sessionBuilder = executionBuilder.Sessions.AsSingle();
sessionBuilder.Named("NewSessionName");
sessionBuilder.AtStage(2);
```

> **Pro Tip**: Leverage IntelliSense (`Ctrl+Space`) to explore available methods and discover configuration options.

---

## Advanced Integration

For complex integrations — QaaS allows full C# control via builder patterns that accept complex configuration objects.

### Example: Add a Kafka Topic Publisher

```csharp
using Confluent.Kafka;
using QaaS.Framework.Protocols.ConfigurationObjects.Kafka;
using QaaS.Framework.SDK.Extensions;
using QaaS.Runner;
using QaaS.Runner.Sessions.Actions.Publishers.Builders;

var runner = Bootstrap.New(args);
var executionBuilder = runner.ExecutionBuilders.AsSingle();
var sessionBuilder = executionBuilder.Sessions.AsSingle();

// Configure Kafka sender
var kafkaTopicConfig = new KafkaTopicSenderConfig
{
    TopicName = "test-topic",
    Username = "admin",
    Password = "secret",
    HostNames = ["kafka1.example.com", "kafka2.example.com"],
    SaslMechanism = SaslMechanism.ScramSha256,
    SecurityProtocol = SecurityProtocol.SaslPlaintext
};

// Build and attach publisher
var kafkaPublisher = new PublisherBuilder()
    .Named("KafkaPublisher")
    .Configure(kafkaTopicConfig).WithDataSource("DataSource");

sessionBuilder.AddPublisher(kafkaPublisher);

// Execute
runner.Run();
```

> **Benefits**:
>
> - Full access to C# ecosystem.
> - Dynamic configuration based on environment, runtime state, or external inputs.
> - Reusable, testable, and version-controlled code.

---

## Custom Runner: Extend and Override Core Behavior

When default behavior is insufficient, QaaS allows you to **extend the `Runner` class** and override key lifecycle methods to implement custom orchestration logic.

## `Runner.Run()` Logic

The `Run()` method is composed of a series of methods that execute one after the other and are responsible for the actions performed before or after the executions are run (such as clearing the `allure-results` folder before the tests run and wiring the resutls to it after the tests finish). Along with those `Run` contains the logic for building the `Execution`s from the `ExecutionBuilder`s and starting the `Execution`s. To view the methods run order and signatures, open the default `Runner` class and go to `Run()` method.

### Inherit from `Runner`

```csharp
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
        Console.WriteLine("Custom setup: Initializing test environment...");
        // Add custom pre-execution logic (e.g., start services, warm caches)
        base.Setup(); // Optional: preserve base behavior
    }

    protected override void Teardown()
    {
        Console.WriteLine("Custom teardown: Cleaning up resources...");
        // Add post-execution cleanup (e.g., stop containers, export logs)
        base.Teardown(); // Optional: preserve base behavior
    }

    protected override List<Execution> BuildExecutions()
    {
        // Customize execution construction
        var executions = base.BuildExecutions();
        // Add, filter, or modify executions dynamically
        return executions;
    }
}
```

> **Note**: All `virtual` methods in `Runner` are designed for extension. Use `base.` calls when you want to preserve default behavior.

---

## Using the Custom Runner

To activate your custom runner, use the generic `Bootstrap.New<TRunner>` overload:

```csharp
QaaS.Runner.Bootstrap.New<MyCustomRunner>(args).Run();
```

> This enables **full control** over the test lifecycle while retaining all built-in functionality of QaaS.

---

## Advanced Use Case: Conditional Test Orchestration

Leverage programmatic logic to implement sophisticated workflows — such as chaos engineering, rollback strategies, or multiphase validation.

### Example: Chaos Engineering Workflow

```csharp
protected override int StartExecutions(List<Execution> executions)
{
    int? finalResult = null;

    // Step 1: Validate steady state
    var steadyStateResult = executions.First().Start();

    // Step 2: Proceed only if steady state is healthy
    if (steadyStateResult == 0)
    {
        // Step 3: Execute experiment
        executions[1].Start();

        // Step 4: Validate post-experiment state
        finalResult = executions.First().Start();

        // Step 5: Rollback if experiment failed
        if (finalResult != 0)
        {
            executions[2].Start(); // Rollback phase
        }
    }

    // Step 6: Return final outcome
    return finalResult ?? steadyStateResult;
}
```

> **Benefits**:
>
> - Dynamic decision-making based on real-time test outcomes.
> - Support for rollback, retry, or cleanup logic.
> - Full access to execution state and results.
> - Maintainable, testable, and version-controlled.

---

With Configuration as Code, configuration is not just defined — it is engineered.
