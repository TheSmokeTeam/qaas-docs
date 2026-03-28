# Live Action Based Generators

In certain advanced scenarios, you may need to access real-time data from a currently running action within your [QaaS.Common.Generators](../../generators/index.md). This allows your generator logic to react dynamically to live processing results.

This pattern is useful when a publisher or another live action must respond to data that is still being produced. It is not the normal path for completed session data; use it when you specifically need live behavior.

---

## How Generators Run in Flow

When you define a generator and use it in a [DataSource](../userInterfaces/runner/configurationSections/dataSources/overview.md), the generator code executes **when the publisher starts**, not when the session begins. This means:

- The generator runs in the context of the **current [Session](../userInterfaces/runner/configurationSections/sessions/overview.md)**.
- To access real-time data from another action, you must make sure you are reading from the correct running session.

> **Key Insight**: Always verify which session your generator is running under, especially when accessing live outputs.

---

## Creating a Live Action Based Generator

You can create a generator that pulls real-time data from a running action such as a consumer and republishes it live.

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
    [Required] public string ConsumerName { get; set; }
}

public class FromConsumerGenerator : BaseGenerator<FromConsumerGeneratorConfig>
{
    public override IEnumerable<Data<object>> Generate(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        var consumerLiveData = Context.CurrentRunningSessions.GetAllSessions().AsSingle()
            .GetOutputByName(Configuration.ConsumerName)
            .GetData();

        foreach (var item in consumerLiveData)
            yield return item;
    }
}
```

### Key Points

- `Context.CurrentRunningSessions.GetAllSessions()` -> gets all active running sessions.
- `.AsSingle()` -> selects the current session when exactly one running session is relevant.
- `GetOutputByName(Configuration.ConsumerName)` -> retrieves the live output of the specified action.
- `.GetData()` -> returns the live stream of data from that running action.

---

## Using the Generator in a Session

### YAML Configuration

```yaml
DataSources:
  - Name: FromConsumerGenerator
    Generator: FromConsumerGenerator
    GeneratorConfiguration:
      ConsumerName: Consumer
    Lazy: true
```

!!! warning "⚠️ Important"
    Real-time generators must be lazy.
    If `Lazy: false`, the publisher waits for the consumer to finish before publishing, which defeats the purpose of real-time processing.
    Set `Lazy: true` to enable concurrent execution.

Then use the data source in a [Publisher](../userInterfaces/runner/configurationSections/sessions/types/publishers.md):

```yaml
- Name: Session
  SaveData: true
  Publishers:
    - Name: Publisher
      DataSourceNames: [ SomeDataSource ]
      RabbitMq:
        <<: *rabbitmq
        ExchangeName: test

    - Name: PublisherBasedOnConsumer
      DataSourceNames: [ FromConsumerGenerator ]
      RabbitMq:
        <<: *rabbitmq
        ExchangeName: test-live

  Consumers:
    - Name: Consumer
      TimeoutMs: 3000
      RabbitMq:
        <<: *rabbitmq
        ExchangeName: test
```

Now you have:

- A `Consumer` processing messages.
- A `PublisherBasedOnConsumer` that **streams live data** from the consumer through the generator.

---

!!! warning "⚠️ Important"
    Use each live generator instance only once.

Creating multiple publishers from the same live generator instance can lead to:

- race conditions
- duplicate or lost data
- unpredictable behavior

**Best Practice**: use one generator per live data stream, and one publisher per generator.

---

## Cancelling a Running Action via Generator

You can also use a generator to **cancel** a running action when a condition is met.

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
    [Required] public string ConsumerName { get; set; }
}

public class CancelConsumerGenerator : BaseGenerator<CancelConsumerGeneratorConfig>
{
    public override IEnumerable<Data<object>> Generate(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        var itemsPublished = 0;
        var liveConsumer = Context.CurrentRunningSessions.GetAllSessions().AsSingle()
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

- `liveConsumer.DataCancellationTokenSource.Cancel()` -> signals the running action to stop processing.
- This works because the generator runs in the same session context as the action it is reading from.

> Useful for testing failure scenarios, rate limiting, or early termination.
