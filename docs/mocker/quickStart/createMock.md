# Create a Mock (YAML)

This quick start keeps the mock behavior in `mocker.qaas.yaml` and uses a small custom processor class for the HTTP response logic.

The completed sample is available in the `yaml_configuration` branch of [qaas-mocker-quickstart]({{ links.mocker_quickstart_repository }}/tree/yaml_configuration).

## Mock Spec

The mock should:

- listen on port `80`
- return JSON data on `GET /data/`
- load that JSON data from files stored under `ServerData`

## Create the Project

```bash
dotnet new qaas-mocker -n DummyAppMock
```

The quick-start project looks like this:

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
|   |-- mocker.qaas.yaml
|   |-- Processors/
|   |   `-- ServerDataProcessor.cs
|   `-- ServerData/
|       `-- sample.json
```

## Add the Generator Package

The YAML configuration uses the `FromFileSystem` generator from [QaaS.Common.Generators]({{ links.repository_generators }}).

`DummyAppMock.csproj`

```xml
<ItemGroup>
  <PackageReference Include="QaaS.Common.Generators" Version="*" />
</ItemGroup>
```

## Add a Local Processor

`QaaS.Common.Processors` is retired. The only built-in processor that remains is the framework status hook, so this quick start keeps the file-backed response behavior in a local processor class.

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

## Configure `mocker.qaas.yaml`

The preferred configuration format is `Servers`, even when you only have one server.

```yaml
DataSources:
  - Name: FromFileSystemServerData
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: ServerData

Stubs:
  - Name: ServerDataStub
    Processor: ServerDataProcessor
    DataSourceNames: [FromFileSystemServerData]

Servers:
  - Http:
      Port: 80
      Endpoints:
        - Path: /data/
          Actions:
            - Name: DataFromFileSystemAction
              Method: Get
              TransactionStubName: ServerDataStub
```

## Validate and Run

Validate the configuration first:

```bash
dotnet run -- lint mocker.qaas.yaml
```

Then start the mock:

```bash
dotnet run -- run mocker.qaas.yaml
```

If port `80` is reserved on your machine, you can keep the YAML unchanged and override it locally:

```bash
dotnet run -- run mocker.qaas.yaml --overwrite-arguments "Servers:0:Http:Port=8080"
```
