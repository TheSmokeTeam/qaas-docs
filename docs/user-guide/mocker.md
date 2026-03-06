# Mocker Usage

`QaaS.Mocker` is the optional runtime you use when real downstream dependencies are too expensive, unstable, or unsafe for a test.

## CLI Shape

`MockerOptions` exposes:

| Flag | Meaning |
| --- | --- |
| positional `ConfigurationFile` | Base mocker YAML file. Defaults to `mocker.qaas.yaml`. |
| `-m, --mode` | `Run`, `Lint`, or `Template`. |
| `-w, --overwrite-files` | Ordered overwrite files. |
| `-r, --overwrite-arguments` | Inline configuration overrides. |
| `--no-env` | Disables environment-variable resolution. |
| `-o, --output-folder` | Where templated output is written. |
| `--run-locally` | Keeps the process interactive for local runs. |

## Root YAML Sections

| Section | Purpose |
| --- | --- |
| `DataSources` | Optional upstream data sources used by processors |
| `Stubs` | Named transaction stub definitions |
| `Server` | One active server family: HTTP, gRPC, or socket |
| `Controller` | Optional Redis control plane for runner-issued commands |

## Minimal HTTP Example

Based on `QaaS.Mocker.Example/mocker.qaas.yaml`:

```yaml
DataSources: []

Stubs:
  - Name: ExampleStub
    Processor: ExampleProcessor

Server:
  Type: Http
  Http:
    Port: 8443
    IsLocalhost: true
    IsSecuredSchema: true
    CertificatePath: Certificates/devcert.pfx
    CertificatePassword: qaas-dev-cert
    Endpoints:
      - Path: /health
        Actions:
          - Name: HealthAction
            Method: Get
            TransactionStubName: ExampleStub
```

## Minimal gRPC Example

Based on `QaaS.Mocker.Example/mocker.grpc.qaas.yaml`:

```yaml
DataSources: []

Stubs:
  - Name: GrpcEchoStub
    Processor: GrpcEchoProcessor

Server:
  Type: Grpc
  Grpc:
    Port: 50051
    IsLocalhost: true
    IsSecuredSchema: true
    CertificatePath: Certificates/devcert.pfx
    CertificatePassword: qaas-dev-cert
    Services:
      - ServiceName: EchoService
        ProtoNamespace: QaaS.Mocker.Example.Grpc
        AssemblyName: QaaS.Mocker.Example
        Actions:
          - Name: EchoAction
            RpcName: Echo
            TransactionStubName: GrpcEchoStub
```

## How Runner and Mocker Connect

When you use runner `MockerCommands`:

1. the test session sends a Redis command through `QaaS.Mocker.CommunicationObjects`
2. `QaaS.Mocker.Controller` receives it
3. the mock runtime updates the targeted action or consumes runtime data

That is why runner and mocker must agree on:

- Redis connection settings
- server name
- communication object package version

## When to Reach for Mocker

Use it when:

- the downstream system is not available in development
- you need deterministic HTTP, gRPC, or socket behavior
- the test must switch responses during execution

Do not add mocker just to avoid writing a generator or assertion. Those belong in the runner side.
