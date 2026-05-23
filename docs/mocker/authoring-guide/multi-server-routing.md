---
id: mocker.authoring-guide.multi-server-routing
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker]
keywords: [mocker, multi-server, routing, ServerInstanceName, channels]
summary: "Expose multiple named HTTP servers from a single mocker process so a runner can target each one deterministically by name and instance."
---

# Mocker — Multi-Server Routing

> TL;DR — One mocker binary, multiple logical servers on different ports; each server owns its stubs and exposes a deterministic channel name so multiple runners can target specific servers without cross-talk.

## When to use {: #when-to-use}

- Your system-under-test calls several downstream services that you want to mock independently in one process.
- You want each mock to have its own response shape, latency, and failure mode without spinning up three containers.
- You need a worked example of the `Servers` (plural) YAML root and the channel-name convention.

## YAML configuration {: #yaml}

```yaml
DataSources:
  - Name: OrderResponses
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem: { Path: Fixtures/orders }
  - Name: PaymentResponses
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem: { Path: Fixtures/payments }
  - Name: CatalogResponses
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem: { Path: Fixtures/catalog }

Stubs:
  - Name: OrdersStub
    Processor: DataSourceResponse
    DataSourceNames: [OrderResponses]
    ProcessorConfiguration: { StatusCode: 200 }
  - Name: PaymentsStub
    Processor: DataSourceResponse
    DataSourceNames: [PaymentResponses]
    ProcessorConfiguration: { StatusCode: 200 }
  - Name: CatalogStub
    Processor: DataSourceResponse
    DataSourceNames: [CatalogResponses]
    ProcessorConfiguration: { StatusCode: 200 }

Servers:
  - Name: orders
    InstanceName: primary
    Http:
      Port: 8081
      IsLocalhost: false
      Endpoints:
        - Path: /orders/{id}
          Actions:
            - { Name: GetOrder,    Method: Get,  TransactionStubName: OrdersStub }
        - Path: /orders
          Actions:
            - { Name: CreateOrder, Method: Post, TransactionStubName: OrdersStub }

  - Name: payments
    InstanceName: primary
    Http:
      Port: 8082
      IsLocalhost: false
      Endpoints:
        - Path: /payments
          Actions:
            - { Name: Charge, Method: Post, TransactionStubName: PaymentsStub }

  - Name: catalog
    InstanceName: primary
    Http:
      Port: 8083
      IsLocalhost: false
      Endpoints:
        - Path: /catalog/{sku}
          Actions:
            - { Name: GetItem, Method: Get, TransactionStubName: CatalogStub }
```

## C# (CAC) usage {: #csharp}

No custom processor is required for pure routing. The mocker is fully YAML-driven once `Bootstrap` runs:

```csharp
QaaS.Mocker.Bootstrap.New(args).Run();
```

Add custom processors per stub when you need behaviour beyond `DataSourceResponse` — see [Processors — custom authoring guide](../../processors/custom-authoring-guide.md).

## Minimal example {: #example-minimal}

A single server with one endpoint, copied from one fixture file:

```yaml
DataSources:
  - Name: OrderResponses
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem: { Path: Fixtures/orders }
Stubs:
  - Name: OrdersStub
    Processor: DataSourceResponse
    DataSourceNames: [OrderResponses]
    ProcessorConfiguration: { StatusCode: 200 }
Servers:
  - Name: orders
    InstanceName: primary
    Http:
      Port: 8081
      IsLocalhost: false
      Endpoints:
        - Path: /orders
          Actions:
            - { Name: CreateOrder, Method: Post, TransactionStubName: OrdersStub }
```

## Realistic example {: #example-realistic}

Two instances of the same logical server (blue/green) on different ports, so runners can deliberately split traffic to test cutovers:

```yaml
Servers:
  - Name: orders
    InstanceName: blue
    Http: { Port: 8081, IsLocalhost: false, Endpoints: [ ] }   # blue stubs here
  - Name: orders
    InstanceName: green
    Http: { Port: 8181, IsLocalhost: false, Endpoints: [ ] }   # green stubs here
```

Runner A points at `http://localhost:8081` (instance `blue`); Runner B points at `:8181` (instance `green`). Both can run in parallel against the same mocker process without cross-contamination.

## Edge cases {: #edge-cases}

- `Server:` (singular) and `Servers:` (plural) are mutually exclusive. Use plural the moment you need more than one.
- Ports must be unique across `Servers[*].Http.Port`; the mocker fails fast at startup if not.
- `Name` is required when there is more than one server; the runner uses it to disambiguate channels.
- `InstanceName` defaults to a deterministic value when omitted, but pinning it explicitly makes channel names predictable in CI logs.
- `IsLocalhost: false` binds to `0.0.0.0` (reachable from sibling containers). Set `true` for laptop dev to stay on `127.0.0.1`.

## See also {: #see-also}

- [Mocker — Servers reference](../userInterfaces/mocker/configurationSections/server/overview.md)
- [Mocker — Stubs reference](../userInterfaces/mocker/configurationSections/stubs/overview.md)
- [Processors — custom authoring guide](../../processors/custom-authoring-guide.md)
