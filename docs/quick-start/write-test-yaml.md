# Write a Test in YAML

This example keeps the old quick-start shape on purpose: RabbitMQ in, RabbitMQ out, hermeticity and delay assertions on top.

## Scenario

Assume the application:

- receives JSON arrays from RabbitMQ
- publishes JSON arrays back to RabbitMQ
- should process `50` messages per second on average
- should respond within `5000` ms
- should be fully hermetic for the sampled traffic

## Required Package References

Your project needs:

- `QaaS.Runner`
- `QaaS.Common.Assertions`
- `QaaS.Common.Generators`

If you want setup or teardown side effects, add `QaaS.Common.Probes` too.

## Minimal YAML

```yaml
anchors:
  rabbitMq: &rabbitMq
    Host: ${variables:rabbitmq:Host}
    Username: ${variables:rabbitmq:Username}
    Password: ${variables:rabbitmq:Password}
    Port: ${variables:rabbitmq:Port}
    RoutingKey: /

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
          <<: *rabbitMq
          ExchangeName: input
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        RabbitMq:
          <<: *rabbitMq
          ExchangeName: output
        Deserialize:
          Deserializer: Json

Assertions:
  - Name: Hermeticity
    Assertion: HermeticByInputOutputPercentage
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100

  - Name: Delay
    Assertion: DelayByChunks
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

## Matching Variables File

`Variables/local.yaml`

```yaml
variables:
  rabbitmq:
    Host: localhost
    Username: admin
    Password: admin
    Port: 5672
```

## Why This Works

- `DataSources` loads reusable input data.
- `Sessions` define the traffic shape against the system under test.
- `Policies` control rate, timeout, or count behavior on the action.
- `Assertions` decide pass or fail for the run.

## Next Step

- If the same test must fan out into many variants, continue to [Keep Tests Maintainable](make-test-maintainable.md).
- If the configuration has to be dynamic, move to [Write a Test in Code](write-test-code.md).
