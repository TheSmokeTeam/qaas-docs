# Live Action-Based Generators

In advanced scenarios you may need a generator that reads real-time data from a running action (e.g. a consumer). This allows generator logic to react dynamically to live processing results.

---

## How Generators Run in Flow

When you define a generator and use it in a `DataSource`, the generator's code executes **when the publisher starts**, not when the session begins. This means:

- The generator runs in the context of the **current session**.
- To access real-time data from another action (e.g., a consumer), you must ensure the correct session context is used.

> **Key Insight**: Always verify which session your generator is running under — especially when accessing live outputs.

---

## Creating a Live Action Based Generator

You can create a generator that pulls real-time data from a running action (like a consumer) and publishes it live.

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
    /// <inheritdoc />
    public override IEnumerable<Data<object>> Generate(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        // Access the currently running session
        var consumerLiveData = Context.CurrentRunningSessions.GetAllSessions().AsSingle()
            .GetOutputByName(Configuration.ConsumerName).GetData();

        foreach (var item in consumerLiveData)
        {
            yield return item;
        }
    }
}
```

### Key Points

- `Context.CurrentRunningSessions.GetAllSessions()` → Gets all active sessions (current + background).
- `.AsSingle()` → Extracts the **current session** (safe for single-session contexts).
- `GetOutputByName(Configuration.ConsumerName)` → Retrieves the live output of the specified consumer.
- `.GetData()` → Returns the real-time stream of data from that action.

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

> **Note: Real-Time Generators Must Be Lazy**  
> If `Lazy: false`, the publisher waits for the consumer to finish before publishing — defeating the purpose of real-time processing.  
> Set `Lazy: true` to enable concurrent execution.

Then use the data source in a publisher:

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
- A `PublisherBasedOnConsumer` that **streams live data** from the consumer via the generator.

---

## Important Warning: Avoid Flakiness

> **Use Each Live Generator Instance Only Once**

Creating multiple publishers using the same live generator instance can lead to:

- Race conditions
- Duplicate or lost data
- Unpredictable behavior

**Best Practice**: Use one generator per live data stream, and one publisher per generator.

---

## Cancelling a Running Action via Generator

You can also use a generator to **cancel** a running action based on conditions.

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
            {
                // Cancel the running consumer
                liveConsumer.DataCancellationTokenSource.Cancel();
            }
        }
    }
}
```

### Key Mechanism

- `liveConsumer.DataCancellationTokenSource.Cancel()` → Signals the consumer to stop processing.
- This works because the generator runs in the same session context as the consumer.

> Useful for testing failure scenarios, rate limiting, or early termination.
