# Create a Mock (Code)

This sample builds the same mock as the YAML quick start, but assembles the mock configuration in `Program.cs`.

The completed sample is available at [DummyAppMock (Code)]({{ links.repository_mocker_quickstart_code }}).

## Create the Project

```bash
dotnet new qaas-mocker -n DummyAppMock
cd DummyAppMock
dotnet add DummyAppMock/DummyAppMock.csproj package QaaS.Mocker
dotnet add DummyAppMock/DummyAppMock.csproj package QaaS.Common.Generators
```

## Add the Response File

`DummyAppMock/ServerData/sample.json`

```json
{
  "message": "hello from DummyAppMock",
  "source": "dummy_app_mock"
}
```

## Reuse the Same Local Processor

Use the same `ServerDataProcessor` shown in the YAML quick start. The code-first sample keeps the processor identical so the only difference is how the mock is configured.

## Build `Program.cs` in Small Pieces

`DummyAppMock/Program.cs`

### Start with the Imports

```csharp
using DummyAppMock.Processors;
using QaaS.Common.Generators.ConfigurationObjects.FromExternalSourceConfigurations;
using QaaS.Common.Generators.FromExternalSourceGenerators;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Extensions;
using QaaS.Mocker;
using QaaS.Mocker.Servers.ConfigurationObjects;
using QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs;
using QaaS.Mocker.Stubs.ConfigurationObjects;
using HttpMethod = QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs.HttpMethod;
```

### Start from the Standard Bootstrap Host

The sample now starts with the normal Mocker bootstrap flow, then pulls out the single execution builder that the host created. When you run without arguments it defaults to `run mocker.qaas.yaml`, so the app keeps the same startup contract as the YAML sample while still adding the mock structure in code.

```csharp
var bootstrapArguments = args.Length > 0 ? args : ["run", "mocker.qaas.yaml"];
var runner = Bootstrap.New(bootstrapArguments);
var executionBuilder = runner.ExecutionBuilders.AsSingle();
```

### Create the Data Source

Start by describing where the response body comes from. This block gives the mock a named data source called `ServerData` that reads files from the local `ServerData` folder.

```csharp
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
```

### Create the Stub

Next connect the incoming request flow to the local processor. The stub says "when this action runs, execute `ServerDataProcessor` and give it the `ServerData` source."

```csharp
var stub = new TransactionStubBuilder()
    .Named("ServerDataStub")
    .HookNamed(nameof(ServerDataProcessor))
    .AddDataSourceName("ServerData");
```

### Create the Server

Now define the mock surface itself. This server listens on port `8080` and maps `GET /data` to the stub you just created.

```csharp
var server = new ServerConfig
{
    Http = new HttpServerConfig
    {
        Port = 8080,
        IsLocalhost = false,
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
};
```

### Add Everything to the Bootstrapped Execution

Finally attach each piece to the bootstrapped `ExecutionBuilder`, then run the host.

```csharp
executionBuilder
    .AddDataSource(dataSource)
    .AddStub(stub)
    .AddServer(server);

runner.Run();
```

## Full `Program.cs`

This is the complete file exactly as it appears in the sample repository.

`DummyAppMock/Program.cs`

```csharp
using DummyAppMock.Processors;
using QaaS.Common.Generators.ConfigurationObjects.FromExternalSourceConfigurations;
using QaaS.Common.Generators.FromExternalSourceGenerators;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Extensions;
using QaaS.Mocker;
using QaaS.Mocker.Servers.ConfigurationObjects;
using QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs;
using QaaS.Mocker.Stubs.ConfigurationObjects;
using HttpMethod = QaaS.Mocker.Servers.ConfigurationObjects.HttpServerConfigs.HttpMethod;

var bootstrapArguments = args.Length > 0 ? args : ["run", "mocker.qaas.yaml"];
var runner = Bootstrap.New(bootstrapArguments);
var executionBuilder = runner.ExecutionBuilders.AsSingle();

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
        IsLocalhost = false,
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
};

executionBuilder
    .AddDataSource(dataSource)
    .AddStub(stub)
    .AddServer(server);

runner.Run();
```

This `Program.cs` still maps directly to the YAML quick start: one `FromFileSystem` data source, one stub, and one HTTP server endpoint. The difference is only where that configuration is defined.

## Run the Code Path

From `DummyAppMock/DummyAppMock`:

```bash
dotnet run
```

Then verify it:

```bash
curl http://127.0.0.1:8080/data
```

The mock keeps running after the check. Stop it with `Ctrl+C` when you are done.
