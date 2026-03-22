# Create a Mock (Code)

This variant keeps the same mock behavior as the YAML quick start, but builds the entire mock configuration in `Program.cs`.

The completed sample is available in the `code_configuration` branch of [qaas-mocker-quickstart]({{ links.mocker_quickstart_repository }}/tree/code_configuration).

## Mock Spec

The mock should:

- listen on port `80`
- return JSON data on `GET /data/`
- load that JSON data from files stored under `ServerData`

## Project Structure

```txt
DummyAppMock/
|-- NuGet.Config
|-- DummyAppMock.sln
|-- README.md
|-- Dockerfile
|-- .github/
|-- DummyAppMock/
|   |-- DummyAppMock.csproj
|   |-- Program.cs
|   |-- Processors/
|   |   `-- ServerDataProcessor.cs
|   `-- ServerData/
|       `-- sample.json
```

## Package References

```xml
<ItemGroup>
  <PackageReference Include="QaaS.Mocker" Version="*" />
  <PackageReference Include="QaaS.Common.Generators" Version="*" />
</ItemGroup>
```

## Local Processor

Use the same processor as the YAML version:

`Processors/ServerDataProcessor.cs`

```csharp
using System.Collections.Immutable;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Processor;
using QaaS.Framework.SDK.Session.DataObjects;
using QaaS.Framework.SDK.Session.MetaDataObjects;

namespace DummyAppMock.Processors;

public sealed class ServerDataProcessor : BaseTransactionProcessor<NoConfiguration>
{
    public override Data<object> Process(IImmutableList<DataSource> dataSourceList, Data<object> requestData)
    {
        var response = dataSourceList
            .Single(dataSource => dataSource.Name == "FromFileSystemServerData")
            .Retrieve()
            .FirstOrDefault();

        return new Data<object>
        {
            Body = response?.Body ?? "{}"u8.ToArray(),
            MetaData = new MetaData
            {
                Http = new Http
                {
                    StatusCode = 200,
                    Headers = new Dictionary<string, string>
                    {
                        ["Content-Type"] = "application/json"
                    }
                }
            }
        };
    }
}

public sealed record NoConfiguration;
```

## Build the Mock in `Program.cs`

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
    .Named("FromFileSystemServerData")
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
    .AddDataSourceName("FromFileSystemServerData");

var server = new ServerConfig
{
    Http = new HttpServerConfig
    {
        Port = 80,
        Endpoints =
        [
            new HttpEndpointConfig
            {
                Path = "/data/",
                Actions =
                [
                    new HttpEndpointActionConfig
                    {
                        Name = "DataFromFileSystemAction",
                        Method = HttpMethod.Get,
                        TransactionStubName = "ServerDataStub"
                    }
                ]
            }
        ]
    }
};

new MockerRunner(
    new ExecutionBuilder()
        .CreateDataSource(dataSource)
        .CreateStub(stub)
        .CreateServer(server))
    .Run();
```

## Run the Mock

```bash
dotnet run
```

This code-first version does not rely on `mocker.qaas.yaml`. All of the mock behavior is created directly in C#.
