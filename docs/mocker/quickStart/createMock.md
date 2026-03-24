# Create a Mock (YAML)

Use YAML when the mock shape is mostly declarative and you want the runtime definition to stay easy to scan: where the data comes from, which stub processes it, and which server endpoint exposes it. QaaS.Mocker reads those sections into the same execution builder concepts you will use in larger mocks later.

This version keeps the mock definition in `mocker.qaas.yaml` and uses a small local processor for the response body.

The completed sample is available at [DummyAppMock (YAML)]({{ links.repository_mocker_quickstart_yaml }}).

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

The YAML file will only describe the mock flow. The actual response body is produced by a small local processor that loads the JSON payload from the data source and returns it with an HTTP 200 response.

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

## Start with the `DataSources` Section

Begin by telling Mocker where the response payload lives.

`DummyAppMock/mocker.qaas.yaml`

```yaml
DataSources:
  - Name: ServerData
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: ServerData
```

This means: "load files from the local `ServerData` folder and expose them as a named data source called `ServerData`."

## Add the `Stubs` Section

Next add the transaction stub that connects the incoming request to your local processor.

Append this section to `mocker.qaas.yaml`:

```yaml
Stubs:
  - Name: ServerDataStub
    Processor: ServerDataProcessor
    DataSourceNames: [ServerData]
```

The stub says that when a request reaches this action, Mocker should call `ServerDataProcessor` and give it the `ServerData` data source.

## Add the `Servers` Section

Finally define the HTTP server and map `GET /data` to the stub you just created.

Append this section to `mocker.qaas.yaml`:

```yaml
Servers:
  - Http:
      Port: 8080
      IsLocalhost: false
      Endpoints:
        - Path: /data
          Actions:
            - Name: GetServerData
              Method: Get
              TransactionStubName: ServerDataStub
```

This is the actual mock surface: open port `8080`, listen locally, and route `GET /data` to the stub named `ServerDataStub`.

## Full `mocker.qaas.yaml`

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
      IsLocalhost: false
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

The mock keeps running after the check. Stop it with `Ctrl+C` when you are done.
