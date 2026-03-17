# Maintainable Test

We now have a working test that has produced results. However, the test file has several issues:

- The `.yaml` file is lengthy and hard to read.
- There is no clear distinction between configuration values that are fixed and those that vary by environment.
- Changes to common settings (e.g., RabbitMQ host) require updates in multiple locations—such as four places in the example (two publishers and two consumers).

To address these issues, we can use **anchors**, **placeholders**, and **overwriting files** to improve maintainability and reduce duplication.

---

## Anchors

Anchors allow us to define reusable configuration blocks that are expanded when the YAML is rendered. They help eliminate duplication by creating "macros" for repeated structures.

### Anchors Syntax

Define an anchor:

```yaml
anchor: &anchorName anchorValue
```

Use an anchor:

```yaml
UseAnchor: *anchorName
```

### Example: Refactoring with Anchors

We identify duplicated sections in the `Sessions` and `Assertions` sections. We create anchors for these and use the YAML merge key (`<<`) to incorporate them.

```yaml
anchors:
  rabbitMqExchangeAnchor: &rabbitMqExchangeAnchor
    Host: rabbitmq
    Username: admin
    Password: admin
    RoutingKey: /
    Port: 5672
  sessionAnchor: &sessionAnchor
    Publishers:
      - &sessionPublisherAnchor
        Name: Publisher
        Policies:
          - LoadBalance:
              Rate: 50
        RabbitMq: &publisherRabbitMqExchangeAnchor
          <<: *rabbitMqExchangeAnchor
          ExchangeName: input
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        Deserialize:
          Deserializer: Json
        RabbitMq:
          <<: *rabbitMqExchangeAnchor
          ExchangeName: output
  hermeticAssertionAnchor: &hermeticAssertionAnchor
    Assertion: HermeticByInputOutputPercentage
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100
  delayAssertionAnchor: &delayAssertionAnchor
    Assertion: DelayByChunks
    AssertionConfiguration:
      Output:
        Name: Consumer
        ChunkSize: 1
      Input:
        Name: Publisher
        ChunkSize: 1
      MaximumDelayMs: 5000

DataSources:
  - Name: FromFileSystemTestData
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem:
        Path: TestData
  - Name: 10Samples
    Generator: JsonArrayGenerator
    GeneratorConfiguration:
      Count: 10
      NumberOfItemsPerArray: 5

Sessions:
  - <<: *sessionAnchor
    Name: RabbitMqExchangeWithFromFileSystemTestData
    Publishers:
      - <<: *sessionPublisherAnchor
        DataSourceNames: [FromFileSystemTestData]
  - <<: *sessionAnchor
    Name: RabbitMqExchangeWith10Samples
    Publishers:
      - <<: *sessionPublisherAnchor
        Serialize:
          Serializer: Json
        DataSourceNames: [10Samples]
        RabbitMq:
          <<: *publisherRabbitMqExchangeAnchor

Assertions:
  - <<: *hermeticAssertionAnchor
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
  - <<: *delayAssertionAnchor
    SessionNames: [RabbitMqExchangeWithFromFileSystemTestData]
  - <<: *hermeticAssertionAnchor
    SessionNames: [RabbitMqExchangeWith10Samples]
  - <<: *delayAssertionAnchor
    SessionNames: [RabbitMqExchangeWith10Samples]
  - Assertion: LengthAssertion
    SessionNames: [RabbitMqExchangeWith10Samples]
    AssertionConfiguration:
      OutputName: Consumer
      ExpectedLength: 5
```

### Best Practices for Anchors

- Place all anchors under the `anchors` section to keep them separate from active configurations.
- Use `camelCase` for anchor names.
- Use anchors only for complex values (dictionaries or lists).
- Anchors do not work with overwriting files—changes to an anchor are not propagated to its references in overwritten files.

---

## Placeholders

Placeholders allow dynamic value substitution within YAML configurations. They are especially useful for environment-specific settings.

### Placeholders Syntax

```yaml
${variables:rabbitmq:host}
```

Supports:

- Default values: `${variables:rabbitmq:host??localhost}`
- Partial value inclusion: `${variables:rabbitmq:host}-prod`

### Example: Using Placeholders

Move environment-specific values into the `variables` section:

```yaml
variables:
  rabbitmq:
    host: rabbitmq
    port: 5672

anchors:
  rabbitMqExchangeAnchor: &rabbitMqExchangeAnchor
    <<: ${variables:rabbitmq}
    Username: admin
    Password: admin
    RoutingKey: /
```

This allows the same configuration to be reused across environments by simply changing the values in the variables file.

### Best Practices

- Place placeholder values under the `variables` section.
- Use `camelCase` for variable keys.
- Use placeholders for non-logical, environment-dependent values.

---

## Overwriting Files

QaaS supports merging multiple YAML files, allowing you to separate configuration from logic. This is ideal for managing environment-specific settings.

### File Structure

```plaintext
DummyAppTests/
|-- test.qaas.yaml
|-- Variables/
|   |-- local.yaml
|   |-- k8s.yaml
|-- Cases/
|-- TestData/...
```

### Environment-Specific Variables

#### **Variables/local.yaml**

```yaml
variables:
  rabbitmq:
    host: REDA
    port: REDA
```

#### **Variables/k8s.yaml**

```yaml
variables:
  rabbitmq:
    host: rabbitmq
    port: 5672
```

### Running the Test

To run the test with a specific environment:

```bash
dotnet run -- run test.qaas.yaml -w Variables/local.yaml
```

```bash
dotnet run -- run test.qaas.yaml -w Variables/k8s.yaml
```

This approach enables clean separation of concerns and allows the same test logic to be reused across different environments.

> Note: Variable files use the `.yaml` extension because they contain only configuration data, not QaaS-specific structures.

---

## Cases: Handling Repetitive Test Variants

When you have many similar test cases that differ only slightly (e.g., different data sources or assertions), use the `cases` feature.

### Step 1: Create a Generic Template

Refactor `test.qaas.yaml` to be generic, using placeholders and minimal configuration:

```yaml
anchors:
  rabbitMqExchangeAnchor: &rabbitMqExchangeAnchor
    <<: ${variables:rabbitmq}
    Username: admin
    Password: admin
    RoutingKey: /

DataSources:
  - Name: DataSource

Sessions:
  - Name: Session
    Publishers:
      - Name: Publisher
        DataSourceNames: [ DataSource ]
        Policies:
          - LoadBalance:
              Rate: 50
        RabbitMq:
          <<: *rabbitMqExchangeAnchor
          ExchangeName: input
    Consumers:
      - Name: Consumer
        TimeoutMs: 5000
        Deserialize:
          Deserializer: Json
        RabbitMq:
          <<: *rabbitMqExchangeAnchor
          ExchangeName: output

Assertions:
  - Assertion: HermeticByInputOutputPercentage
    SessionNames: [Session]
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100
  - Assertion: DelayByChunks
    SessionNames: [Session]
    AssertionConfiguration:
      Output:
        Name: Consumer
        ChunkSize: 1
      Input:
        Name: Publisher
        ChunkSize: 1
      MaximumDelayMs: 5000
```

### Step 2: Define Case Files

Create a `Cases` directory with individual case files:

#### **Cases/externalData.yaml**

```yaml
DataSources:0:
  Generator: FromFileSystem
  GeneratorConfiguration:
    DataArrangeOrder: AsciiAsc
    FileSystem:
      Path: TestData
```

#### **Cases/jsonArrayGenerator.yaml**

```yaml
DataSources:0:
  Generator: JsonArrayGenerator
  GeneratorConfiguration:
    Count: 10
    NumberOfItemsPerArray: 5

Sessions:0:Publishers:0:Serialize:Serializer: Json

Assertions:2:
  Assertion: LengthAssertion
  SessionNames: [Session]
  AssertionConfiguration:
    OutputName: Consumer
    ExpectedLength: 5
```

### Key Features of Case Files

- Use full path notation (e.g., `DataSources:0:`) to access and modify specific elements.
- Access list items by index using the index number as a key.
- Overwrite variables using `${}` placeholders.
- Support nested modifications without requiring indentation.

### Running with Cases

Use the `-c` flag to specify the cases directory:

```bash
dotnet run -- run test.qaas.yaml -w Variables/local.yaml -c Cases -s
```

- `-c Cases`: Loads all case files from the `Cases` directory.
- `-s`: Runs cases in ASCII order by filename.
- Each case generates a separate test run.

### Allure Results

Allure reports will group assertions under suites named by the case file path:

```plaintext
Cases/externalData.yaml
Cases/jsonArrayGenerator.yaml
```

This provides clear traceability and reporting for each test variant.