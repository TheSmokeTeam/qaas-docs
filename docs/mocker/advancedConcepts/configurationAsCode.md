# Configuration as Code

`mocker.qaas.yaml` is the standard way to describe a mocker, but the current runtime also exposes a code-first builder API through `ExecutionBuilder`.

## Build a Mocker in Code

The example below builds a simple HTTP health endpoint in code and validates it in `Lint` mode.

This example assumes the project references `QaaS.Common.Processors` so the `StatusCodeTransactionProcessor` hook is available.

```csharp
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging.Abstractions;
using QaaS.Framework.SDK.ContextObjects;
using QaaS.Mocker;
using QaaS.Mocker.Options;
using QaaS.Mocker.Servers.ConfigurationObjects;
using QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs;
using QaaS.Mocker.Stubs.ConfigurationObjects;
using HttpMethod = QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs.HttpMethod;

var context = new InternalContext
{
    Logger = NullLogger.Instance,
    RootConfiguration = new ConfigurationBuilder().Build()
};

var builder = new ExecutionBuilder()
    .WithContext(context)
    .WithExecutionMode(ExecutionMode.Lint)
    .CreateStub(new TransactionStubBuilder()
        .Named("HealthStub")
        .HookNamed("StatusCodeTransactionProcessor")
        .Configure(new { StatusCode = 200 }))
    .ReplaceServer(new ServerConfig
    {
        Type = ServerType.Http,
        Http = new HttpServerConfig
        {
            Port = 8080,
            Endpoints =
            [
                new HttpEndpointConfig
                {
                    Path = "/health",
                    Actions =
                    [
                        new HttpEndpointActionConfig
                        {
                            Name = "HealthAction",
                            Method = HttpMethod.Get,
                            TransactionStubName = "HealthStub"
                        }
                    ]
                }
            ]
        }
    });

var exitCode = builder.Build().Start();
```

## Builder Operations

`ExecutionBuilder` exposes CRUD-style methods for the main mocker sections:

- `CreateDataSource`, `ReadDataSource`, `UpdateDataSource`, `DeleteDataSource`
- `CreateStub`, `ReadStub`, `UpdateStub`, `DeleteStub`
- `CreateServer`, `ReadServer`, `UpdateServer`, `ReplaceServer`
- `AddServer`, `ReadServers`, `ReplaceServers`
- `CreateController`, `ReadController`, `UpdateController`, `ReplaceController`, `DeleteController`

## Execution Modes

Use `WithExecutionMode(...)` to choose the runtime behavior:

- `ExecutionMode.Run` starts the configured runtime
- `ExecutionMode.Lint` validates and builds without starting listeners
- `ExecutionMode.Template` generates the effective YAML template

You can also use:

- `RunLocally()` to allow a local `Run` execution to stop on key press when console input is not redirected
- `WithTemplateOutputFolder(...)` to write template output to a folder in `Template` mode

## Single Server vs Multiple Servers

Use `ReplaceServer(...)` or `CreateServer(...)` when the mocker hosts one runtime.

Use `AddServer(...)` or `ReplaceServers(...)` when the mocker hosts several runtimes from the same process. In that case, action names must stay unique across all configured servers.

## Choosing How to Start It

There are two useful code-first entry points:

- `builder.Build().Start()` returns the exit code to the current process
- `new Mocker(builder).Run()` builds, starts, and then exits the current process with the resulting exit code
