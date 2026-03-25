# Configuration as Code

QaaS supports both declarative YAML and programmatic C# configuration. YAML is still the best fit for static scenarios and checked-in test cases. Configuration as Code is the better option when the host needs branching logic, reusable helpers, shared conventions, or dynamic values that are awkward to express in YAML.

The important part is to separate two different questions:

1. how QaaS resolves configuration when you run through the normal CLI/bootstrap flow
2. how your host chooses between a code-defined path and a YAML-defined path before it calls that flow

## Start With Resolution Rules

When you stay on the normal CLI/bootstrap path, the resolution model is:

1. choose the execution mode from the command line: `run`, `act`, `assert`, `template`, or `execute` for Runner, `run` or `template` for Mocker
2. resolve the base configuration file from the explicit file path or from the product default name
3. apply the normal overwrite and merge inputs for that command
4. apply environment variable overrides unless `--no-env` was passed
5. materialize the execution builder and run or template it

For the conventional default file names:

- Runner uses `test.qaas.yaml`
- Mocker uses `mocker.qaas.yaml`

That means these commands stay entirely on the YAML/bootstrap path:

```csharp
QaaS.Runner.Bootstrap.New(args).Run();
QaaS.Mocker.Bootstrap.New(args).Run();
```

And from the shell:

```bash
dotnet run -- run test.qaas.yaml
dotnet run -- run mocker.qaas.yaml
```

If your host chooses a code-defined no-args path before it delegates to bootstrap, that invocation bypasses the YAML resolution path unless you explicitly bootstrap from a file yourself.

That is exactly how the public quick-start code samples are structured:

- `dotnet run` uses the code-defined path
- `dotnet run -- run ...` uses the YAML-defined path
- `dotnet run -- template` on the code branches prints the YAML-equivalent shape of the code-defined configuration so it can be diffed against the checked-in YAML sample

## Runner: Practical Public-Package Pattern

For Runner, the practical public-package pattern is:

1. keep using `Bootstrap.New(args)` so the normal command-line pipeline still handles explicit YAML runs
2. on the no-args path, bootstrap from a temporary empty file and then populate `runner.ExecutionBuilders.Single()`
3. on the explicit YAML path, do not mutate the builder and let the normal loader resolution stand

That is why the current Runner code quick start uses one `Program.cs` file with two branches:

- no args: code-defined execution
- explicit `run ...`: YAML-defined execution

`IExecutionBuilderConfigurator` is available in the current public Runner package, but the quick-start sample intentionally keeps the code path in `Program.cs` because it makes the code-vs-YAML split completely explicit in one place.

## Mocker: Practical Public-Package Pattern

For the currently published public packages, the practical Mocker pattern is different.

The full HTTP server sample shown in the public quick start still uses:

```csharp
var executionBuilder = new ExecutionBuilder()
    // data source, stub, and server wiring
    ;

new MockerRunner(executionBuilder).Run();
```

The reason is that the currently published public `QaaS.Mocker` package line used by the direct code sample exposes the builder path that can create the full HTTP server shape shown in the docs. The newer configurator-oriented public surface is not yet sufficient for that same end-to-end sample server definition, so the public quick-start sample stays on the direct builder path and pins the matching package versions in its project setup.

That is why the current Mocker code quick start uses:

- no args: direct code-built `ExecutionBuilder`
- explicit `run ...`: normal YAML/bootstrap flow
- `template` with no file: the host prints the YAML-equivalent shape of the code-defined mock

## Keep YAML Next to Code

The public sample repos keep the authored YAML file even on the code branches. That is intentional.

It gives you three useful capabilities:

- explicit YAML runs still work from the same host
- the code-defined path can be validated against a checked-in YAML baseline
- the docs can show a code sample and a YAML sample that stay in sync

In other words, the hybrid host is not “half configured.” It is one host that deliberately exposes two entry paths:

- code path for `dotnet run`
- YAML path for `dotnet run -- run ...`

## When to Choose Each Style

Choose YAML when:

- the scenario is mostly static
- you want the runtime shape to stay easy to diff and review
- the configuration is part of the checked-in artifact you want others to edit directly

Choose code when:

- you need helper methods, branching, loops, or shared composition
- values come from runtime decisions that are awkward to encode declaratively
- you want one host to offer both a code path and an explicit YAML path

## Template Validation

The public quick-start samples use `template` as the parity check:

- the code branches render the YAML-equivalent shape of the code-defined configuration
- the YAML branches keep the authored YAML file that the code output is meant to match

That gives you a concrete validation loop: if the code branch template output diverges from the checked-in YAML baseline, the two variants are no longer representing the same configuration.

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
