# Configuration as Code

QaaS supports both declarative YAML and programmatic C# configuration. YAML is still the best fit for static scenarios and checked-in test cases. Configuration as Code is the better option when the execution needs branching logic, reusable helpers, shared conventions, or dynamic values that are awkward to express in YAML.

The current recommended model is:

1. keep using the normal `Bootstrap.New(...)` entry point
2. keep the conventional configuration file when you want a YAML baseline or the default no-args startup path
3. implement `IExecutionBuilderConfigurator` in the entry assembly or a copied dependency
4. let Runner or Mocker discover that configurator automatically and apply it after the loader has resolved the YAML input, if any

## Bootstrap First

Start from the standard bootstrap path instead of constructing runners manually.

```csharp
QaaS.Runner.Bootstrap.New(args).Run();
QaaS.Mocker.Bootstrap.New(args).Run();
```

Bootstrap now handles the common default cases directly:

- Runner: if `args` is empty and `test.qaas.yaml` exists in the app output directory, bootstrap treats that as `run <absolute path to test.qaas.yaml>`.
- Mocker: if `args` is empty and either `mocker.qaas.yaml` exists in the app output directory or a discovered `IExecutionBuilderConfigurator` can build the execution in code, bootstrap treats that as `run <absolute path to mocker.qaas.yaml>`.
- For both products, passing a bare configuration path such as `test.qaas.yaml`, `mocker.qaas.yaml`, or `configs/local.yaml` still implies `run <path>`.

Mocker has one extra detail that matters for real hosts: when the selected configuration file name is exactly `mocker.qaas.yaml`, the loader resolves that default file from `AppContext.BaseDirectory`. Other relative file names still resolve from the current working directory. If the default file is missing but a code configurator was discovered, the loader logs a warning and continues with the code-built execution instead of failing immediately.

This keeps CLI behavior, logging, overrides, and environment handling aligned with the normal runtime path.

## Keep the YAML File When It Helps

Runner and Mocker still use their normal configuration file names as the conventional entry point for YAML loading. In code-first scenarios that file can stay empty or contain only the static baseline that you want to keep in YAML.

Use the conventional file names:

- Runner: `test.qaas.yaml`
- Mocker: `mocker.qaas.yaml`

In practice:

- keep `test.qaas.yaml` next to a Runner host when you want `Bootstrap.New(args)` with empty args to take the standard default path
- keep `mocker.qaas.yaml` next to a Mocker host when you want the same default path without a warning, or when you want `run` without an explicit file name to load a concrete YAML baseline
- omit `mocker.qaas.yaml` only when the mock is fully defined in code and you are comfortable with the loader warning that YAML was skipped

That gives you a practical hybrid model:

- YAML for defaults, shared structure, or checked-in examples
- C# for computed values, composition, and conditional behavior

## Implement a Configurator

Runner and Mocker both discover `IExecutionBuilderConfigurator` implementations automatically.

Runner:

```csharp
using QaaS.Runner;

public sealed class RunnerExecutionBuilderConfigurator : IExecutionBuilderConfigurator
{
    public void Configure(ExecutionBuilder executionBuilder)
    {
        // add or replace builder state here
    }
}
```

Mocker:

```csharp
using QaaS.Mocker;

public sealed class MockerExecutionBuilderConfigurator : IExecutionBuilderConfigurator
{
    public void Configure(ExecutionBuilder executionBuilder)
    {
        // add or replace builder state here
    }
}
```

The configurator runs after the loader has created the execution builder, so it can extend or replace the state that came from YAML, or populate the builder from scratch when YAML loading was skipped.

When you refer to local files from code, prefer paths rooted at `AppContext.BaseDirectory` so the host does not depend on the caller's working directory.

## What the Configurator Should Own

Use the configurator to express the parts of the runtime that benefit from code:

- build data sources from reusable helpers
- attach sessions, assertions, links, storages, or stubs conditionally
- compute metadata or policies from environment-specific inputs
- apply conventions that should stay consistent across many tests or mocks

Typical Runner example:

```csharp
public sealed class RunnerExecutionBuilderConfigurator : IExecutionBuilderConfigurator
{
    public void Configure(ExecutionBuilder executionBuilder)
    {
        executionBuilder
            .WithMetadata(new MetaDataConfig
            {
                Team = "Smoke",
                System = "DummyApp"
            })
            .AddDataSource(new DataSourceBuilder()
                .Named("Inputs")
                .HookNamed(nameof(FromFileSystem))
                .Configure(new FromFileSystemConfig
                {
                    FileSystem = new FileSystemConfig
                    {
                        Path = Path.Combine(AppContext.BaseDirectory, "TestData")
                    }
                }));
    }
}
```

Typical Mocker example:

```csharp
public sealed class MockerExecutionBuilderConfigurator : IExecutionBuilderConfigurator
{
    public void Configure(ExecutionBuilder executionBuilder)
    {
        executionBuilder
            .CreateDataSource(new DataSourceBuilder()
                .Named("ServerData")
                .HookNamed(nameof(FromFileSystem))
                .Configure(new FromFileSystemConfig
                {
                    FileSystem = new FileSystemConfig
                    {
                        Path = Path.Combine(AppContext.BaseDirectory, "ServerData")
                    }
                }))
            .CreateStub(new TransactionStubBuilder()
                .Named("ServerDataStub")
                .HookNamed(nameof(ServerDataProcessor))
                .AddDataSourceName("ServerData"));
    }
}
```

## Discovery Rules

The configurator loaders scan:

- the entry assembly
- already loaded assemblies
- copied `.dll` files in the output directory

That means you can keep configurators inside the app itself or move them into reusable helper assemblies that are copied to the output folder.

If the configuration file path does not exist but one or more configurators are discovered, the loaders continue and log a warning instead of failing immediately. That is what makes the empty-file bootstrap pattern work.

## Prefer Configurators Over Mutating `runner.ExecutionBuilders`

Older examples often showed:

```csharp
var runner = Bootstrap.New(args);

foreach (var executionBuilder in runner.ExecutionBuilders)
{
    // mutate execution builders here
}

runner.Run();
```

That approach is no longer the recommended starting point. It couples your host code to the loader output shape and spreads configuration behavior outside the discovery pipeline.

Prefer `IExecutionBuilderConfigurator` instead because it:

- keeps the host minimal
- composes cleanly with YAML
- works for both Runner and Mocker
- is covered by the current loader tests

## When a Custom Runner Still Makes Sense

Extending `Runner` is still useful when you want to change lifecycle behavior rather than just configuration shape. Examples:

- custom setup or teardown
- orchestration across multiple execution phases
- custom exit-code handling
- domain-specific execution sequencing

Use `Bootstrap.New<TRunner>(...)` for that case, but keep configuration concerns in configurators unless you truly need lifecycle control.

## Practical Guidance

- Start with YAML when the scenario is static and easy to read.
- Move to code when you need reuse, composition, branching, or shared conventions.
- Keep the entry point thin.
- Put runtime shape into `IExecutionBuilderConfigurator`.
- Let bootstrap keep ownership of loading, overrides, logging, and environment resolution.

The quick-start pages for [Write a Test (Code)](../quickStart/writeTestCode.md) and [Create a Mock (Code)](../../mocker/quickStart/createMockCode.md) show the current recommended pattern end to end.

## Keep the Host Process Alive After `Run()`

`Runner.Run()` exits the current process by default when execution completes. In `Runner.cs` this is controlled by `ExitProcessOnCompletion`, which defaults to `true`.

If you are embedding QaaS Runner inside another host process, set it to `false` before calling `Run()`. That changes completion behavior from `Environment.Exit(exitCode)` to just setting `Environment.ExitCode` and returning control to your code.

```csharp
using QaaS.Runner;

var runner = Bootstrap.New(args);
runner.ExitProcessOnCompletion = false;

runner.Run();

Console.WriteLine($"Runner finished and the host is still alive. ExitCode={Environment.ExitCode}");
```

This is useful when QaaS is only one step inside a larger process, for example:

- a custom test host that runs several tools in sequence
- an IDE or service that should keep running after the QaaS execution ends
- integration tests that want to execute the full runner lifecycle without terminating the test process

In other words:

- `ExitProcessOnCompletion = true`: `Run()` completes by terminating the process
- `ExitProcessOnCompletion = false`: `Run()` completes by setting `Environment.ExitCode` and returning

If you want to decide yourself what to do with the exit code, an even more explicit option is `runner.RunAndGetExitCode()`, which returns the computed exit code directly without applying the default completion policy for you.
