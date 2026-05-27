---
id: qaas.quickstart.actionselectionplaybook
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner, mocker]
keywords: [qaas, quickstart, actions, sessions, evidence, yaml]
summary: "Choose Runner action types, name evidence consistently, and combine Runner with Mocker for repeatable tests."
---
# Action Selection Playbook

> TL;DR — Pick the action by the evidence it must create: publishers create inputs, consumers create outputs, transactions create both, collectors create time-window outputs, probes prepare infrastructure, and mocker commands control mock behavior.

Use this page before writing a new Runner session. It maps a test intent to the
smallest action type that proves it, then shows naming and YAML patterns that
keep reports, assertions, and Mocker captures readable.

## Action Selection Matrix {: #action-selection-matrix}

| Intent | Use | SessionData result | Typical assertion input |
|---|---|---|---|
| Send an event, message, file, or row and verify it downstream | [Publisher](../userInterfaces/runner/configurationSections/sessions/types/publishers.md) | `Input` named after the publisher | Compare the publisher input with a later consumer output |
| Read from a broker, table, bucket, index, socket, or queue | [Consumer](../userInterfaces/runner/configurationSections/sessions/types/consumers.md) | `Output` named after the consumer | Validate count, schema, content, or latency |
| Call request/response protocols such as HTTP or gRPC | [Transaction](../userInterfaces/runner/configurationSections/sessions/types/transactions.md) | `Input` and `Output` named after the transaction | Validate status, response body, headers, or schema |
| Query observability after a time window | [Collector](../userInterfaces/runner/configurationSections/sessions/types/collectors.md) | `Output` named after the collector | Validate metric values for the run window |
| Prepare or clean test infrastructure | [Probe](../userInterfaces/runner/configurationSections/sessions/types/probes.md) | No interaction data | Check later actions against the prepared state |
| Change, trigger, or consume Mocker behavior from Runner | [Mocker Command](../userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) | Depends on command; `Consume` can create `Input` and `Output` | Validate captured mock traffic or selected stub behavior |

## Naming Contract {: #naming-contract}

Names are the join keys between YAML, session data, reports, and assertions.
Prefer names that describe the business step and the protocol role:

```yaml
Sessions:
  - Name: CreateOrderFlow
    Transactions:
      - Name: HttpCreateOrder
        TimeoutMs: 5000
        Http:
          BaseAddress: http://127.0.0.1
          Port: 8080
          Route: /orders
          Method: Post
    Consumers:
      - Name: KafkaOrderProjected
        TimeoutMs: 10000
        KafkaTopic:
          HostNames: [broker.local:9092]
          Username: qaas
          Password: qaas
          TopicName: orders.projected
          GroupId: qaas-orders-projection
    Collectors:
      - Name: PrometheusOrderLatency
        Prometheus:
          Url: http://prometheus.local:9090
          Expression: qaas_order_projection_latency_seconds
```

Keep these rules:

- One action name represents one proof point.
- Assertion `OutputName` or `InputName` values must match the action name.
- Publisher and transaction names should include the verb.
- Consumer and collector names should include the observed state.
- Mocker command names should include the mock action or capture they control.

## HTTP Transaction Pattern {: #http-transaction-pattern}

Use a transaction when the test sends a request and the response is evidence.

```yaml
MetaData:
  Team: Payments
  System: OrdersApi

Storages:
  - Name: LocalSessions
    StorageConfiguration:
      Type: Local
      Path: ./session-data

Sessions:
  - Name: CreateOrderHttp
    Transactions:
      - Name: HttpCreateOrder
        TimeoutMs: 5000
        Http:
          BaseAddress: http://127.0.0.1
          Port: 8080
          Route: /orders
          Method: Post

Assertions:
  - Name: CreateOrderReturnedCreated
    Assertion: HttpStatus
    SessionNames: [CreateOrderHttp]
    AssertionConfiguration:
      OutputName: HttpCreateOrder
      ExpectedStatus: 201
```

Evidence created:

- `CreateOrderHttp.Inputs.HttpCreateOrder` stores the sent request item.
- `CreateOrderHttp.Outputs.HttpCreateOrder` stores the response.
- The assertion reads `OutputName: HttpCreateOrder`.

## Publish Then Consume Pattern {: #publish-then-consume-pattern}

Use a publisher plus a consumer when the system is asynchronous. The publisher
proves what was sent. The consumer proves what the system emitted later.

```yaml
MetaData:
  Team: Payments
  System: OrdersProjection

Storages:
  - Name: LocalSessions
    StorageConfiguration:
      Type: Local
      Path: ./session-data

Sessions:
  - Name: OrderProjectionFlow
    Publishers:
      - Name: PublishOrderCreated
        TimeoutMs: 5000
        KafkaTopic:
          HostNames: [broker.local:9092]
          Username: qaas
          Password: qaas
          TopicName: orders.created
    Consumers:
      - Name: ConsumeProjectedOrder
        TimeoutMs: 10000
        KafkaTopic:
          HostNames: [broker.local:9092]
          Username: qaas
          Password: qaas
          TopicName: orders.projected
          GroupId: qaas-orders-projection

Assertions:
  - Name: ProjectedOrderHasExpectedShape
    Assertion: JsonSchema
    SessionNames: [OrderProjectionFlow]
    AssertionConfiguration:
      OutputName: ConsumeProjectedOrder
      SchemaPath: ./schemas/projected-order.schema.json
```

Review checklist:

- Publisher and consumer use different names.
- The consumer timeout is long enough for the asynchronous hop.
- The assertion reads the consumer output, not the publisher input.
- A separate content assertion can compare fields from `PublishOrderCreated`
  and `ConsumeProjectedOrder` when the projection must preserve data.

## Mocker Control Pattern {: #mocker-control-pattern}

Use Mocker commands when the test must change a dependency during the run or
consume traffic captured by the mock server.

```yaml
Sessions:
  - Name: DependencyBehaviorFlow
    MockerCommands:
      - Name: SwitchPaymentStub
        ServerName: PaymentsMock
        Redis:
          Host: redis.local
          Username: qaas
          Password: qaas
        Command:
          Type: ChangeActionStub
          ChangeActionStub:
            ActionName: AuthorizePayment
            StubName: PaymentApproved
      - Name: ConsumePaymentCapture
        ServerName: PaymentsMock
        Redis:
          Host: redis.local
          Username: qaas
          Password: qaas
        Command:
          Type: Consume
          Consume:
            ActionName: AuthorizePayment
            TimeoutMs: 5000
```

Review checklist:

- `ServerName` matches the Mocker controller server name.
- `ChangeActionStub` runs before the system-under-test calls the dependency.
- `Consume` runs after the call and stores captured mock traffic.
- Tests that depend on captured mock traffic assert against the consume action
  name, not the stub name.

## Time-Window Observation Pattern {: #time-window-observation-pattern}

Use a collector when pass/fail depends on telemetry emitted during the test
window.

```yaml
Sessions:
  - Name: LatencyObservationFlow
    Transactions:
      - Name: HttpCreateOrder
        TimeoutMs: 5000
        Http:
          BaseAddress: http://127.0.0.1
          Port: 8080
          Route: /orders
          Method: Post
    Collectors:
      - Name: PrometheusOrderLatency
        Prometheus:
          Url: http://prometheus.local:9090
          Expression: qaas_order_create_duration_seconds
```

Review checklist:

- The transaction name identifies the action that caused the telemetry.
- The collector name identifies the metric family or observation purpose.
- The collector query uses labels that are stable for the test run.
- Assertions read the collector output and do not infer telemetry from logs.

## Common Mistakes {: #common-mistakes}

| Mistake | Result | Fix |
|---|---|---|
| Using a publisher for request/response HTTP | No response output to assert | Use a transaction |
| Using a consumer to prepare a queue | The test reads instead of preparing state | Use a probe or fixture setup |
| Reusing the same name across actions | Assertions and report attachments become ambiguous | Use one unique name per proof point |
| Asserting on a publisher when the system is asynchronous | The test proves send only, not processing | Add a consumer or collector |
| Putting Mocker setup outside the session evidence path | The report does not show which stub was active | Use Mocker commands in the session |

## See also {: #see-also}

- [Sessions overview](../userInterfaces/runner/configurationSections/sessions/overview.md)
- [Publishers](../userInterfaces/runner/configurationSections/sessions/types/publishers.md)
- [Consumers](../userInterfaces/runner/configurationSections/sessions/types/consumers.md)
- [Transactions](../userInterfaces/runner/configurationSections/sessions/types/transactions.md)
- [Collectors](../userInterfaces/runner/configurationSections/sessions/types/collectors.md)
- [Probes](../userInterfaces/runner/configurationSections/sessions/types/probes.md)
- [Mocker commands](../userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md)
- [Debug test failure](debugTestFailure.md)
