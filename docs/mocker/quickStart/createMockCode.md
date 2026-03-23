# Create a Mock (Code)

Use code configuration when the mock should be assembled with normal C# builders instead of one static YAML file. The runtime concepts stay the same as the YAML guide: a data source feeds a stub, and a server action points to that stub.

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

## Keep the Configuration in Code

The stable `QaaS.Mocker` package already supports building the mock directly from C# builder objects, so this guide keeps the runtime configuration entirely inside `Program.cs`.

## Reuse the Same Local Processor

Use the same `ServerDataProcessor` shown in the YAML quick start.

## Build the Mock in `Program.cs`

`DummyAppMock/Program.cs`

```csharp
using DummyAppMock.Processors;
using QaaS.Common.Generators.ConfigurationObjects.FromExternalSourceConfigurations;
using QaaS.Common.Generators.FromExternalSourceGenerators;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Mocker;
using QaaS.Mocker.Servers.ConfigurationObjects;
using QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs;
using QaaS.Mocker.Stubs.ConfigurationObjects;

Directory.SetCurrentDirectory(AppContext.BaseDirectory);

var executionBuilder = new ExecutionBuilder()
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
                                Method = QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs.HttpMethod.Get,
                                TransactionStubName = "ServerDataStub"
                            }
                        ]
                    }
                ]
            }
        });

new MockerRunner(executionBuilder).Run();
```

This keeps the runtime behavior aligned with the YAML guide:

- `ExecutionBuilder` uses the same builder methods as the YAML sample: data source, stub, then server.
- `MockerRunner` runs the resulting mock exactly as defined in `Program.cs`.

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

The mock keeps running after the check. Stop it with `Ctrl+C` when you are done.
