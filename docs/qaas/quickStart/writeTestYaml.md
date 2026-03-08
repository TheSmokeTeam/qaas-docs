# Write a Test (YAML)

This tutorial builds a complete test for a RabbitMQ-based application called **DummyApp**. The finished project is available [here](REDA/examples/dummyapptests/), with a companion Helm chart [here](REDA/qaas-quickstart-dummyapp-helm-chart).

## Application Spec

DummyApp must satisfy:

- **100 % hermetic** — every input produces exactly one output.
- **50 msg/s** average throughput.
- **< 5 s** I/O delay.
- Input: JSON array → Output: JSON array with the same item count.

```
Host: rabbitmq    Port: 5672
Username: admin   Password: admin
Input Exchange: input    Output Exchange: output    Routing Key: /
```

---

## 1. Scaffold the Project

```bash
dotnet new qaas.test -n DummyAppTests
```

Result:

```
DummyAppTests/
├── NuGet.Config
├── DummyAppTests.sln
├── DummyAppTests/
│   ├── DummyAppTests.csproj
│   ├── Program.cs
│   ├── test.qaas.yaml
│   └── Variables/
│       ├── local.yaml
│       └── k8s.yaml
```

We'll ignore `Variables/` for now — it's covered in [Maintainable Tests](makeTestMoreMaintainable.md).

Create a `TestData/` folder under `DummyAppTests/DummyAppTests/` and add your JSON sample files there.

## 2. Add Plugins

Hooks are C# classes auto-discovered by class name. QaaS ships three plugin packages:

| Plugin | Hooks |
|---|---|
| [`QaaS.Common.Generators`](REDA/v3/) | Data generators (`FromFileSystem`, `Json`, etc.) |
| [`QaaS.Common.Assertions`](REDA/v3/) | Validation assertions (`HermeticByInputOutputPercentage`, `DelayByChunks`, etc.) |
| [`QaaS.Common.Probes`](REDA) | Environment probes (Redis flush, S3 cleanup, K8s ops, etc.) |

Add them to your `.csproj`:

```xml
<ItemGroup>
  <PackageReference Include="QaaS.Common.Assertions" Version="x.x.x" />
  <PackageReference Include="QaaS.Common.Generators" Version="x.x.x" />
  <PackageReference Include="QaaS.Common.Probes" Version="x.x.x" />
</ItemGroup>
```

!!! tip "Version compatibility"
    All plugins must share the same (or compatible newer) `QaaS.Framework.SDK` version as `QaaS.Runner`.

---

## 3. Configure `test.qaas.yaml`

### DataSources

A **DataSource** loads input data through a Generator hook. Here we use `FromFileSystem` to read files from `TestData/`:

```yaml
DataSources:
  - Name: FromFileSystemTestData
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: TestData
```

### Sessions

A **Session** groups publishers and consumers into a named communication workflow.

- The publisher sends data at 50 msg/s (via `LoadBalance` policy) to the `input` exchange.
- The consumer listens on the `output` exchange with a 5 s timeout and JSON deserialization.

```yaml
Sessions:
  - Name: RabbitMqExchangeWithFromFileSystemTestData
    Publishers:
      - Name: Publisher
        DataSourceNames: [FromFileSystemTestData]
        Policies:
          - LoadBalance:
              Rate: 50
        RabbitMq:
          Host: rabbitmq
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: input
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          Host: rabbitmq
          Username: admin
          Password: admin
          RoutingKey: /
          Port: 5672
          ExchangeName: output
        Deserialize:
          Deserializer: Json
```

!!! note "Serialization"
    `FromFileSystem` loads raw `byte[]` — already serialized. The consumer needs `Deserializer: Json` to parse the output.

### Assertions

Two assertions validate our application spec:

```yaml
Assertions:
  # 100% hermetic — every input has a matching output
  - Assertion: HermeticByInputOutputPercentage
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100

  # I/O delay under 5 seconds per message
  - Assertion: DelayByChunks
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
    AssertionConfiguration:
      Output:
        Name: Consumer
        ChunkSize: 1
      Input:
        Name: Publisher
        ChunkSize: 1
      MaximumDelayMs: 5000
```

---

## 4. Complete Configuration

??? example "Full `test.qaas.yaml`"
    ```yaml
    anchors: {}

    DataSources:
      - Name: FromFileSystemTestData
        Generator: FromFileSystem
        GeneratorConfiguration:
          DataArrangeOrder: AsciiAsc
          FileSystem:
            Path: TestData

    Sessions:
      - Name: RabbitMqExchangeWithFromFileSystemTestData
        Publishers:
          - Name: Publisher
            DataSourceNames: [FromFileSystemTestData]
            Policies:
              - LoadBalance:
                  Rate: 50
            RabbitMq:
              Host: rabbitmq
              Username: admin
              Password: admin
              RoutingKey: /
              Port: 5672
              ExchangeName: input
        Consumers:
          - Name: Consumer
            TimeoutMs: 5000
            RabbitMq:
              Host: rabbitmq
              Username: admin
              Password: admin
              RoutingKey: /
              Port: 5672
              ExchangeName: output
            Deserialize:
              Deserializer: Json

    Assertions:
      - Assertion: HermeticByInputOutputPercentage
        SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
        AssertionConfiguration:
          OutputNames: [Consumer]
          InputNames: [Publisher]
          ExpectedPercentage: 100
      - Assertion: DelayByChunks
        SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
        AssertionConfiguration:
          Output:
            Name: Consumer
            ChunkSize: 1
          Input:
            Name: Publisher
            ChunkSize: 1
          MaximumDelayMs: 5000
    ```

## 5. Validate with Template

Preview the fully resolved configuration (with default values filled in):

```bash
dotnet run -- template test.qaas.yaml
```

!!! warning
    The template output may not be runnable — it only shows what the loader resolved.  
    If the config is invalid, `template` logs a fatal error but still prints what it can.

## Next Step

[Write the same test in code →](writeTestCode.md)
