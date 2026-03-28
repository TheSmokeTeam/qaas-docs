# Live Action Based Generators

In certain advanced scenarios, you may need to access data from a currently running action inside your [QaaS.Common.Generators](../../generators/index.md). This allows generator logic to react to live processing results instead of waiting for completed session data.

This pattern is useful when a publisher, transaction, or probe must consume output that is still being produced by another running action.

---

## How Live Generators Actually Become Live

The important detail is that publishers are **prepared** before the session starts running actions.

That means generator timing depends on the data source's laziness:

- if the data source is **not lazy**, QaaS materializes the generator output during session preparation
- if the data source **is lazy**, QaaS keeps the generator deferred and the publisher iterates it while the session is already running

So a live action based generator is only truly live when the data source is lazy.

!!! warning "Important"
    Real-time generators must be lazy.
    Use `Lazy: true` in YAML or `.IsLazy()` in code.
    Without that, the generator is evaluated during preparation and the action is no longer live from the generator's point of view.

---

## Resolving the Correct Running Session

The runtime stores currently running sessions in `Context.CurrentRunningSessions`.

Use the lookup that matches your runtime shape:

- `GetAllSessions().AsSingle()` when exactly one relevant session can be running
- `GetSessionByName("...")` when more than one session may overlap

In a multi-session execution, `GetSessionByName(...)` is the safer choice because it selects the intended running session directly.

---

## Creating a Live Action Based Generator

You can create a generator that reads a running consumer and republishes that data while the consumer is still active.

### Step 1: Define the Generator

```csharp
using System.Collections.Immutable;
using System.ComponentModel.DataAnnotations;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Extensions;
using QaaS.Framework.SDK.Hooks.Generator;
using QaaS.Framework.SDK.Session.DataObjects;
using QaaS.Framework.SDK.Session.SessionDataObjects;

namespace FromConsumerGenerators;

public record FromConsumerGeneratorConfig
{
    [Required] public string SessionName { get; set; }
    [Required] public string ConsumerName { get; set; }
}

public class FromConsumerGenerator : BaseGenerator<FromConsumerGeneratorConfig>
{
    public override IEnumerable<Data<object>> Generate(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        var liveConsumer = Context.CurrentRunningSessions
            .GetSessionByName(Configuration.SessionName)
            .GetOutputByName(Configuration.ConsumerName);

        foreach (var item in liveConsumer.GetData())
        {
            yield return new Data<object>
            {
                Body = item.Body,
                MetaData = item.MetaData with { RabbitMq = null }
            };
        }
    }
}
```

### Key Points

- `GetSessionByName(Configuration.SessionName)` resolves the intended running session directly.
- `GetOutputByName(Configuration.ConsumerName)` retrieves the live output channel of that action.
- `GetData()` streams the action output as it is produced.
- the example creates a new `Data<object>` instead of yielding the consumer item directly, so transport metadata can be adjusted safely

If you are in a true single-session flow, `Context.CurrentRunningSessions.GetAllSessions().AsSingle()` is still valid.

---

## Republishing Through RabbitMQ

When a generator republishes data that originally came from a RabbitMQ consumer, one detail matters:

- the RabbitMQ sender uses the item's `MetaData.RabbitMq.RoutingKey` when it exists
- if you yield the consumer item directly, the publisher can reuse the **source** routing key instead of its configured **target** routing key

That can create a feedback loop where the original consumer receives the republished message again.

That is why the example above clears the RabbitMQ metadata:

```csharp
yield return new Data<object>
{
    Body = item.Body,
    MetaData = item.MetaData with { RabbitMq = null }
};
```

If you want to preserve RabbitMQ metadata, replace it with the metadata that matches the target publisher instead of clearing it.

This exact pattern was validated locally against RabbitMQ: a running consumer streamed data into a lazy generator, that generator republished the data to a different route, and a second consumer received the republished messages successfully.

---

## Using the Generator in a Session

### YAML Configuration

```yaml
DataSources:
  - Name: FromConsumerGenerator
    Generator: FromConsumerGenerator
    GeneratorConfiguration:
      SessionName: LiveSession
      ConsumerName: Consumer
    Lazy: true

Sessions:
  - Name: LiveSession
    SaveData: true
    Publishers:
      - Name: SeedPublisher
        DataSourceNames: [ SomeDataSource ]
        RabbitMq:
          <<: *rabbitmq
          ExchangeName: amq.direct
          RoutingKey: source-route

      - Name: PublisherBasedOnConsumer
        Stage: 1
        DataSourceNames: [ FromConsumerGenerator ]
        RabbitMq:
          <<: *rabbitmq
          ExchangeName: amq.direct
          RoutingKey: target-route

    Consumers:
      - Name: Consumer
        Stage: 0
        TimeoutMs: 3000
        RabbitMq:
          <<: *rabbitmq
          ExchangeName: amq.direct
          RoutingKey: source-route

      - Name: LiveConsumer
        Stage: 2
        TimeoutMs: 3000
        RabbitMq:
          <<: *rabbitmq
          ExchangeName: amq.direct
          RoutingKey: target-route
```

Now you have:

- a `Consumer` that reads the source route
- a lazy generator that reads that consumer's live output
- a `PublisherBasedOnConsumer` that republishes the live data to the target route
- a `LiveConsumer` that reads the republished data

---

## One Live Stream, One Consumer Path

The runtime backs `GetData()` with one shared live communication object for that running action.

In practice, the safest pattern is:

- one live generator per live stream
- one publisher or transaction consuming that live generator

If you fan out the same live stream to several consumers without verifying the behavior carefully, treat duplicate or missing items as a real risk.

---

## Cancelling a Running Action via Generator

You can also use a generator to cancel a running action when a condition is met.

### Example: Cancel Consumer After 50 Items

```csharp
using System.Collections.Immutable;
using System.ComponentModel.DataAnnotations;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Extensions;
using QaaS.Framework.SDK.Hooks.Generator;
using QaaS.Framework.SDK.Session.DataObjects;
using QaaS.Framework.SDK.Session.SessionDataObjects;

namespace QaaS.Runner.E2ETests.Generators.CancelConsumerGenerator;

public record CancelConsumerGeneratorConfig
{
    [Required] public string SessionName { get; set; }
    [Required] public string ConsumerName { get; set; }
}

public class CancelConsumerGenerator : BaseGenerator<CancelConsumerGeneratorConfig>
{
    public override IEnumerable<Data<object>> Generate(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        var itemsPublished = 0;
        var liveConsumer = Context.CurrentRunningSessions
            .GetSessionByName(Configuration.SessionName)
            .GetOutputByName(Configuration.ConsumerName);

        foreach (var item in liveConsumer.GetData())
        {
            itemsPublished++;
            yield return item;

            if (itemsPublished == 50)
                liveConsumer.DataCancellationTokenSource.Cancel();
        }
    }
}
```

### Key Mechanism

- `liveConsumer.DataCancellationTokenSource.Cancel()` signals the running action to stop
- this works because the generator is reading the same running communication object that the action is writing to

That makes live generators useful not only for republishing, but also for early termination, failure-path testing, and rate-based control flows.
