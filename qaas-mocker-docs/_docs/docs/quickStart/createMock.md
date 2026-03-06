# Create Mock

Lets create a simple HTTP mock that answers a health endpoint. This keeps the first example small and matches the way `QaaS.Mocker.Example` is structured in source.

## Mock Spec

The mock should:

- listen on port `8080`
- answer `GET /health`
- return a healthy response from a custom processor

## Create the Project

Create a new mocker project from the template:

```bash
dotnet new qaas.mocker -n DummyAppMock
```

You will get a solution similar to:

```txt
DummyAppMock/
|--NuGet.Config
|--DummyAppMock.sln
|--README.md
|--Dockerfile
|--.gitignore
|--DummyAppMock/
|----DummyAppMock.csproj
|----Program.cs
|----mocker.qaas.yaml
```

## Add a Simple Processor

Create a processor class in the mocker project:

```csharp
using System.Collections.Immutable;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Processor;
using QaaS.Framework.SDK.Session.DataObjects;
using QaaS.Framework.SDK.Session.MetaDataObjects;

public sealed class ExampleProcessor : BaseTransactionProcessor<NoConfiguration>
{
    public override Data<object> Process(IImmutableList<DataSource> dataSourceList, Data<object> requestData)
    {
        return new Data<object>
        {
            Body = "healthy"u8.ToArray(),
            MetaData = new MetaData
            {
                Http = new Http
                {
                    StatusCode = 200,
                    Headers = new Dictionary<string, string>
                    {
                        ["Content-Type"] = "text/plain; charset=utf-8"
                    }
                }
            }
        };
    }
}

public sealed record NoConfiguration;
```

For a first mock, using a project-local processor is easier than depending on a shared processor package.

## Configure `mocker.qaas.yaml`

Minimal YAML:

```yaml
DataSources: []

Stubs:
  - Name: ExampleStub
    Processor: ExampleProcessor

Server:
  Type: Http
  Http:
    Port: 8080
    Endpoints:
      - Path: /health
        Actions:
          - Name: HealthAction
            Method: Get
            TransactionStubName: ExampleStub
```

How it works:

- `Stubs` names the processor-backed behavior you want to reuse
- `Server.Http.Endpoints` exposes paths
- each action maps an HTTP method to a stub

## About Data Sources

This first example does not need a `DataSources` section, but the section is still there because more advanced processors can pull reusable data from generators. Add data sources later when the response body should come from files, schemas, or generated content instead of direct code.
