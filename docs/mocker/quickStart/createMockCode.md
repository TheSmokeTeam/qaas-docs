# Create a Mock (Code)

This version builds the same mock directly in `Program.cs`.

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

## Local Processor

Use the same `ServerDataProcessor` shown in the YAML quick start.

## Build the Mock in Code

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

var dataSource = new DataSourceBuilder()
    .Named("ServerData")
    .HookNamed(nameof(FromFileSystem))
    .Configure(new FromFileSystemConfig
    {
        DataArrangeOrder = DataArrangeOrder.AsciiAsc,
        FileSystem = new FileSystemConfig
        {
            Path = "ServerData"
        }
    });

var stub = new TransactionStubBuilder()
    .Named("ServerDataStub")
    .HookNamed(nameof(ServerDataProcessor))
    .AddDataSourceName("ServerData");

var server = new ServerConfig
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
};

new MockerRunner(new ExecutionBuilder()
        .CreateDataSource(dataSource)
        .CreateStub(stub)
        .CreateServer(server))
    .Run();
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

```bash
dotnet run --project DummyAppMock/DummyAppMock.csproj
```

Then verify it:

```bash
curl http://127.0.0.1:8080/data
```
