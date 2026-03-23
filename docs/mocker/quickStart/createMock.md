# Create a Mock (YAML)

This version keeps the mock definition in `mocker.qaas.yaml` and uses a small local processor for the response body.

The completed sample is available in the `yaml_configuration` branch of [DummyAppMock]({{ links.repository_mocker_quickstart }}/tree/yaml_configuration).

## Scenario

The mock should:

- listen on `http://127.0.0.1:8080`
- return JSON from `GET /data`
- load the response body from `ServerData/sample.json`

## Create the Project

```bash
dotnet new qaas-mocker -n DummyAppMock
cd DummyAppMock
dotnet add DummyAppMock/DummyAppMock.csproj package QaaS.Common.Generators
```

The sample keeps the response processor local so the quick start stays compatible with the currently published public packages.

## Keep `Program.cs` Minimal

`DummyAppMock/Program.cs`

```csharp
QaaS.Mocker.Bootstrap.New(args).Run();
```

## Add the Local Processor

`DummyAppMock/Processors/ServerDataProcessor.cs`

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
            .Single(dataSource => dataSource.Name == "ServerData")
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
                    ResponseHeaders = new Dictionary<string, string>
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

## Add the Response File

`DummyAppMock/ServerData/sample.json`

```json
{
  "message": "hello from DummyAppMock",
  "source": "yaml_configuration"
}
```

## Configure `mocker.qaas.yaml`

`DummyAppMock/mocker.qaas.yaml`

```yaml
DataSources:
  - Name: ServerData
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: ServerData

Stubs:
  - Name: ServerDataStub
    Processor: ServerDataProcessor
    DataSourceNames: [ServerData]

Servers:
  - Http:
      Port: 8080
      IsLocalhost: true
      Endpoints:
        - Path: /data
          Actions:
            - Name: GetServerData
              Method: Get
              TransactionStubName: ServerDataStub
```

## Run the Mock

From `DummyAppMock/DummyAppMock`:

```bash
dotnet run -- run mocker.qaas.yaml
```

Then verify it:

```bash
curl http://127.0.0.1:8080/data
```
