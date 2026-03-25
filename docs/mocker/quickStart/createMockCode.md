# Create a Mock (Code)

Use code configuration when the mock should be assembled with normal C# builders instead of one static YAML file. The runtime concepts stay the same as the YAML guide: a data source feeds a stub, and a server action points to that stub.

The completed sample is available at [DummyAppMock (Code)]({{ links.repository_mocker_quickstart_code }}).

## Keep `mocker.qaas.yaml` Empty

`DummyAppMock/mocker.qaas.yaml`

```yaml
# Intentionally blank. ProgramConfigurator builds the mock definition after bootstrap starts.
```

## Add the Response File

`DummyAppMock/ServerData/sample.json`

```json
{
  "message": "hello from DummyAppMock",
  "source": "code_configuration"
}
```

## Reuse the Same Local Processor

Use the same `ServerDataProcessor` shown in the YAML quick start.

## Keep `Program.cs` Minimal

`DummyAppMock/Program.cs`

```csharp
QaaS.Mocker.Bootstrap.New(args).Run();
```

## Add the Execution Configurator

`DummyAppMock/ProgramConfigurator.cs`

```csharp
using DummyAppMock.Processors;
using QaaS.Common.Generators.ConfigurationObjects.FromExternalSourceConfigurations;
using QaaS.Common.Generators.FromExternalSourceGenerators;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Mocker;
using QaaS.Mocker.Servers.ConfigurationObjects;
using QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs;
using QaaS.Mocker.Stubs.ConfigurationObjects;

internal sealed class ProgramConfigurator : IExecutionBuilderConfigurator
{
    public void Configure(ExecutionBuilder executionBuilder)
    {
        executionBuilder
            .CreateDataSource(new DataSourceBuilder()
                .Named("ServerData")
                .HookNamed(nameof(FromFileSystem))
                .Configure(new FromFileSystemConfig
                {
                    DataArrangeOrder = DataArrangeOrder.AsciiAsc,
                    FileSystem = new FileSystemConfig
                    {
                        Path = Path.Combine(AppContext.BaseDirectory, "ServerData")
                    }
                }))
            .CreateStub(new TransactionStubBuilder()
                .Named("ServerDataStub")
                .HookNamed(nameof(ServerDataProcessor))
                .AddDataSourceName("ServerData"))
            .ReplaceServers(
                new ServerConfig
                {
                    Http = new HttpServerConfig
                    {
                        Port = 8080,
                        IsLocalhost = false,
                        Endpoints = [
                            new HttpEndpointConfig
                            {
                                Path = "/data",
                                Actions = [
                                    new HttpEndpointActionConfig
                                    {
                                        Name = "GetServerData",
                                        Method = QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs.HttpMethod.Get,
                                        TransactionStubName = "ServerDataStub"
                                    }
                                ]
                            }
                        ]
                    }
                });
    }
}
```

This keeps the runtime behavior aligned with the YAML guide while preserving the normal bootstrap flow:

- `Program.cs` stays on the normal `Bootstrap.New(args).Run()` entry point.
- `ProgramConfigurator` is discovered automatically from the entry assembly.
- The configurator uses the same builder sequence as the YAML sample: data source, stub, then server.
- The conventional empty `mocker.qaas.yaml` keeps `dotnet run` and `dotnet run -- run` on the standard default path without extra argument wrappers.

## Run

From the repository root:

```bash
dotnet run --project DummyAppMock/DummyAppMock.csproj --no-launch-profile
```

Then verify it:

```bash
curl http://127.0.0.1:8080/data
```

The mock keeps running after the check. Stop it with `Ctrl+C` when you are done.
