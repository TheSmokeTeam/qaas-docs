# Create a Mock (Code)

This version keeps `Program.cs` to the bootstrap call only and moves the entire mock configuration into a discovered configurator type.

The completed sample is available in the `code_configuration` branch of [DummyAppMock]({{ links.repository_mocker_quickstart }}/tree/code_configuration).

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

If the file is missing, Mocker logs a warning and continues with discovered code configurators. The sample keeps the file empty so the command stays identical to the YAML sample.

## Local Processor

Use the same `ServerDataProcessor` shown in the YAML quick start.

## Keep `Program.cs` Minimal

`DummyAppMock/Program.cs`

```csharp
QaaS.Mocker.Bootstrap.New(args).Run();
```

## Build the Mock in Code

`DummyAppMock/MockerExecutionBuilderConfigurator.cs`

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
dotnet run -- run mocker.qaas.yaml
```

Then verify it:

```bash
curl http://127.0.0.1:8080/data
```
