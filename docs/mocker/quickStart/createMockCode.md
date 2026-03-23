# Create a Mock (Code)

Use code configuration when the mock should be assembled with helper methods, conditionals, or reusable C# building blocks instead of one static YAML file. The runtime concepts are still the same as the YAML guide: a data source feeds a stub, and a server action points to that stub.

The completed sample is available in the `code_configuration` branch of [DummyAppMock]({{ links.mocker_quickstart_repository }}/tree/code_configuration).

## Scenario

The code-first sample keeps the same behavior as the YAML sample:

- listen on `http://127.0.0.1:8080`
- return JSON from `GET /data`
- read the response body from `ServerData/sample.json`

## Packages

```bash
dotnet new qaas-mocker -n DummyAppMock
cd DummyAppMock
dotnet add DummyAppMock/DummyAppMock.csproj package QaaS.Common.Generators
```

## Keep `mocker.qaas.yaml` Empty

`DummyAppMock/mocker.qaas.yaml`

```yaml
```

The current public `QaaS.Mocker` package does not auto-discover code configurators yet, so this quick start builds the execution directly in `Program.cs`. The empty file stays in the project so the folder layout still mirrors the YAML quick start.

## Reuse the Same Local Processor

Use the same `ServerDataProcessor` shown in the YAML quick start.

## Use a Small Host in `Program.cs`

`DummyAppMock/Program.cs`

```csharp
var executionBuilder = new QaaS.Mocker.ExecutionBuilder();
var configurator = new DummyAppMock.MockerExecutionBuilderConfigurator();

configurator.Configure(executionBuilder);

new QaaS.Mocker.MockerRunner(executionBuilder).Run();
```

This host stays small, but it is honest about where the configuration lives: the execution builder is created in code and then passed straight to `MockerRunner`.

## Build the Data Source First

Create `DummyAppMock/MockerExecutionBuilderConfigurator.cs` and begin with the part that loads the response payload from disk.

```csharp
using DummyAppMock.Processors;
using QaaS.Common.Generators.ConfigurationObjects.FromExternalSourceConfigurations;
using QaaS.Common.Generators.FromExternalSourceGenerators;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Mocker;
using QaaS.Mocker.Servers.ConfigurationObjects;
using QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs;
using QaaS.Mocker.Stubs.ConfigurationObjects;
using HttpMethod = QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs.HttpMethod;

namespace DummyAppMock;

public sealed class MockerExecutionBuilderConfigurator
{
    public void Configure(ExecutionBuilder executionBuilder)
    {
        executionBuilder.CreateDataSource(new DataSourceBuilder()
            .Named("ServerData")
            .HookNamed(nameof(FromFileSystem))
            .Configure(new FromFileSystemConfig
            {
                DataArrangeOrder = DataArrangeOrder.AsciiAsc,
                FileSystem = new FileSystemConfig
                {
                    Path = "ServerData"
                }
            }));
```

This is the code equivalent of the YAML `DataSources` section.

## Add the Stub

Next connect the incoming request to your local processor.

Append this code inside `Configure`:

```csharp
        executionBuilder.CreateStub(new TransactionStubBuilder()
            .Named("ServerDataStub")
            .HookNamed(nameof(ServerDataProcessor))
            .AddDataSourceName("ServerData"));
```

The stub says: "when this action runs, invoke `ServerDataProcessor` and give it access to the `ServerData` data source."

## Add the HTTP Server

Finally configure the HTTP endpoint and route `GET /data` to the stub.

Append this code inside `Configure`:

```csharp
        executionBuilder.ReplaceServers(
            new ServerConfig
            {
                Http = new HttpServerConfig
                {
                    Port = 8080,
                    IsLocalhost = true,
                    Endpoints =
                    [
                        new HttpEndpointConfig
                        {
                            Path = "/data",
                            Actions =
                            [
                                new HttpEndpointActionConfig
                                {
                                    Name = "GetServerData",
                                    Method = HttpMethod.Get,
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

At this point the code-first mock describes the same flow as the YAML version, but with normal C# builders.

## Full `MockerExecutionBuilderConfigurator.cs`

```csharp
using DummyAppMock.Processors;
using QaaS.Common.Generators.ConfigurationObjects.FromExternalSourceConfigurations;
using QaaS.Common.Generators.FromExternalSourceGenerators;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Mocker;
using QaaS.Mocker.Servers.ConfigurationObjects;
using QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs;
using QaaS.Mocker.Stubs.ConfigurationObjects;
using HttpMethod = QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs.HttpMethod;

namespace DummyAppMock;

public sealed class MockerExecutionBuilderConfigurator
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
                        Path = "ServerData"
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
                        IsLocalhost = true,
                        Endpoints =
                        [
                            new HttpEndpointConfig
                            {
                                Path = "/data",
                                Actions =
                                [
                                    new HttpEndpointActionConfig
                                    {
                                        Name = "GetServerData",
                                        Method = HttpMethod.Get,
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

## Full `Program.cs`

```csharp
var executionBuilder = new QaaS.Mocker.ExecutionBuilder();
var configurator = new DummyAppMock.MockerExecutionBuilderConfigurator();

configurator.Configure(executionBuilder);

new QaaS.Mocker.MockerRunner(executionBuilder).Run();
```

## Add the Response File

`DummyAppMock/ServerData/sample.json`

```json
{
  "message": "hello from DummyAppMock",
  "source": "code_configuration"
}
```

## Run

From `DummyAppMock/DummyAppMock`:

```bash
dotnet run
```

Then verify it:

```bash
curl http://127.0.0.1:8080/data
```
