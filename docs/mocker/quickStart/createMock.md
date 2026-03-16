# Create a Mock

The fastest way to start is the `qaas-mocker` template. After the template pack is installed:

```bash
dotnet new qaas-mocker -n MyCompany.QaaS.Mocker
```

## What the Template Gives You

The generated project starts with:

- a `Program.cs` entry point that runs `QaaS.Mocker.Bootstrap.New(...)`
- a default `mocker.qaas.yaml`
- a minimal HTTP `/health` action backed by `StatusCodeTransactionProcessor`
- a `Dockerfile`, `NuGet.config`, and GitHub Actions workflow

The default configuration looks like this:

```yaml
DataSources: []

Stubs:
  - Name: HealthStub
    Processor: StatusCodeTransactionProcessor
    ProcessorSpecificConfiguration:
      StatusCode: 200

Server:
  Type: Http
  Http:
    Port: 8080
    IsLocalhost: false
    Endpoints:
      - Path: /health
        Actions:
          - Name: HealthAction
            Method: Get
            TransactionStubName: HealthStub
```

## Extend the Mock

- Add `DataSources` when a processor or socket broadcast action needs generated input.
- Add `Stubs` to bind names to `ITransactionProcessor` hooks.
- Point server actions to stubs with `TransactionStubName`.
- Use `Server` for one runtime or `Servers` to start several runtimes from the same process.
- Add `Controller` only when Runner tests need runtime mocker commands.

## Custom Processors

Transaction stubs are backed by `ITransactionProcessor`. You can:

- reference processors from companion packages such as `QaaS.Common.Processors`
- implement a processor in the mock project and reference it by class name

## Run the Generated Mock

From the project directory:

```bash
dotnet run -- run mocker.qaas.yaml
```

Then call the default health endpoint. The template configuration returns HTTP `200`.

```bash
curl -i http://localhost:8080/health
```
