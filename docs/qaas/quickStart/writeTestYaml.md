# Write a Test (YAML)

This sample tests the `DummyAppMock` quick-start mock by calling `GET /data` and asserting that the response status code is `200`.

The completed sample is available in the `yaml_configuration` branch of [DummyAppTests]({{ links.runner_quickstart_repository }}/tree/yaml_configuration).

## Create the Project

```bash
dotnet new qaas-runner -n DummyAppTests
cd DummyAppTests
dotnet add DummyAppTests/DummyAppTests.csproj package QaaS.Common.Assertions
dotnet add DummyAppTests/DummyAppTests.csproj package QaaS.Common.Generators
```

## Load Plugin Assemblies

For the YAML sample, explicitly load the assertion and generator packages before bootstrap.

`DummyAppTests/Program.cs`

```csharp
using System.Reflection;

Directory.SetCurrentDirectory(AppContext.BaseDirectory);
Assembly.Load("QaaS.Common.Assertions");
Assembly.Load("QaaS.Common.Generators");
QaaS.Runner.Bootstrap.New(args).Run();
```

## Add the Request Input

The HTTP transaction is a `GET`, so the request body is ignored. The sample still keeps one file in `Requests` so the data source has one item to drive one transaction.

`DummyAppTests/Requests/request.json`

```json
{}
```

## Configure `test.qaas.yaml`

`DummyAppTests/test.qaas.yaml`

```yaml
MetaData:
  Team: Smoke
  System: DummyApp

DataSources:
  - Name: RequestData
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: Requests

Sessions:
  - Name: DummyAppSession
    Transactions:
      - Name: GetServerData
        DataSourceNames: [RequestData]
        TimeoutMs: 5000
        Http:
          BaseAddress: http://127.0.0.1
          Method: Get
          Port: 8080
          Route: data

Assertions:
  - Name: GetServerDataReturns200
    Assertion: HttpStatus
    SessionNames: [DummyAppSession]
    AssertionConfiguration:
      StatusCode: 200
      OutputNames: [GetServerData]
```

`Route` should be `data`, not `/data/`, so the final request resolves to `http://127.0.0.1:8080/data`.

## Result

When this file runs against the local mock, Runner performs one HTTP transaction and the `HttpStatus` assertion verifies the `200` response.
