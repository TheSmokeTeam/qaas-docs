# Create a Mock (YAML)

> TL;DR — Use YAML to define mock data sources, stubs, and servers in a declarative mock configuration.

Use YAML when the mock shape is mostly declarative and you want the runtime definition to stay easy to scan: where the [DataSources](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/dataSources/overview/index.md) come from, which [Stub](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/overview/index.md) processes them, and which [Server](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/server/overview/index.md) endpoint exposes them. QaaS.Mocker reads those sections into the same execution builder concepts you will use in larger mocks later.

This version keeps the mock definition in `mocker.qaas.yaml` and uses a small local processor for the response body.

The completed sample is available at [DummyAppMock (YAML)](https://github.com/TheSmokeTeam/DummyAppMock/tree/yaml_configuration).

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

The sample keeps the response [Processor](https://TheSmokeTeam.github.io/qaas-docs/processors/index.md) local so the quick start stays compatible with the currently published public packages.

## Keep `Program.cs` Minimal

`DummyAppMock/Program.cs`

```csharp
QaaS.Mocker.Bootstrap.New(args).Run();
```

This host is YAML-only. Empty program arguments therefore show help text, so the run command must pass `run mocker.qaas.yaml` explicitly.

## Add the Local Processor

The YAML file will only describe the mock flow. The actual response body is produced by a small local processor that loads the JSON payload from the data source and returns it with an HTTP 200 response.

`DummyAppMock/Processors/ServerDataProcessor.cs`

```csharp
using System.Collections.Immutable;
using System.ComponentModel;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Extensions;
using QaaS.Framework.SDK.Hooks.Processor;
using QaaS.Framework.SDK.Session.DataObjects;
using QaaS.Framework.SDK.Session.MetaDataObjects;

namespace DummyAppMock.Processors;

public record ServerDataProcessorConfig
{
    [Description("Status code to return"), DefaultValue("200")]
    public int StatusCode { get; set; } = 200;
}

public class ServerDataProcessor : BaseTransactionProcessor<ServerDataProcessorConfig>
{
    public override Data<object> Process(IImmutableList<DataSource> dataSourceList, Data<object> requestData)
    {
        var response = dataSourceList
            .GetDataSourceByName("ServerData")
            .Retrieve()
            .FirstOrDefault();

        return new Data<object>
        {
            Body = response?.Body ?? "{}"u8.ToArray(),
            MetaData = new MetaData
            {
                Http = new Http
                {
                    StatusCode = Configuration.StatusCode,
                    ResponseHeaders = new Dictionary<string, string>
                    {
                        ["Content-Type"] = "application/json"
                    }
                }
            }
        };
    }
}
```

## Add the Response File

`DummyAppMock/ServerData/sample.json`

```json
{
  "message": "hello from DummyAppMock",
  "source": "dummy_app_mock"
}
```

## Start with the `DataSources` Section

Begin by telling Mocker where the response payload lives through [DataSources](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/dataSources/overview/index.md).

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

The [Stub](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/overview/index.md) says that when a request reaches this action, Mocker should call `ServerDataProcessor` and give it the `ServerData` data source.

## Add the `Servers` Section

Finally define the [Server](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/server/overview/index.md) and map `GET /data` to the stub created in the previous step.

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

## See also

- [Create a mock in code](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/createMockCode/index.md)
- [Deploy a mock](https://TheSmokeTeam.github.io/qaas-docs/mocker/quickStart/deployMock/index.md)
- [DataSources](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/dataSources/overview/index.md)
- [Stubs](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/stubs/overview/index.md)
- [Servers](https://TheSmokeTeam.github.io/qaas-docs/mocker/userInterfaces/mocker/configurationSections/server/overview/index.md)
