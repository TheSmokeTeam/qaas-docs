# Write Custom Hooks

Use custom hooks when the common packages do not already solve the problem.

## Hook Types

| Hook type | Interface family | Use it for |
| --- | --- | --- |
| Generator | `IGenerator` / `BaseGenerator<TConfig>` | Produce input data |
| Assertion | `IAssertion` / `BaseAssertion<TConfig>` | Decide pass or fail |
| Probe | `IProbe` / `BaseProbe<TConfig>` | Perform side effects with no returned data |

## Custom Generator Example

```csharp
public record JsonArrayGeneratorConfiguration
{
    [Required]
    public uint? Count { get; set; }

    public uint NumberOfItemsPerArray { get; set; } = 5;
}

public class JsonArrayGenerator : BaseGenerator<JsonArrayGeneratorConfiguration>
{
    public override IEnumerable<Data<object>> Generate(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        for (var i = 0; i < Configuration.Count; i++)
        {
            var body = new JsonArray();
            for (var item = 0; item < Configuration.NumberOfItemsPerArray; item++)
                body.Add("SomeItem");

            yield return new Data<object> { Body = body };
        }
    }
}
```

YAML usage:

```yaml
DataSources:
  - Name: JsonSamples
    Generator: JsonArrayGenerator
    GeneratorConfiguration:
      Count: 10
      NumberOfItemsPerArray: 5
```

## Custom Assertion Example

```csharp
public record LengthAssertionConfiguration
{
    [Required]
    public uint? ExpectedLength { get; set; }

    [Required]
    public string? OutputName { get; set; }
}

public class LengthAssertion : BaseAssertion<LengthAssertionConfiguration>
{
    public override bool Assert(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        var output = sessionDataList.AsSingle()
            .GetOutputByName(Configuration.OutputName!)
            .CastCommunicationData<JsonArray>();

        var invalidItems = output.Data.Count(item => item.Body?.Count != Configuration.ExpectedLength);
        AssertionMessage = $"Outputs with unexpected length: {invalidItems}";
        return invalidItems == 0;
    }
}
```

## Custom Probe Example

```csharp
public class PrintCurrentTimeProbe : BaseProbe<object>
{
    public override void Run(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        Console.WriteLine($"Current UTC time: {DateTime.UtcNow:O}");
    }
}
```

YAML usage:

```yaml
Sessions:
  - Name: SessionA
    Probes:
      - Name: LogClock
        Probe: PrintCurrentTimeProbe
```

## Hook Resolution Rules

- Generators and assertions are resolved by configured name.
- Probes are session-scoped internally, so probe names must still be unique within the session.
- The simplest way to keep discovery reliable is to compile the hook classes into the same test project that runs them.
