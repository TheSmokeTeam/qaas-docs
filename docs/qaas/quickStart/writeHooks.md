# Write Custom Hooks

Hooks are C# classes discovered automatically by name from your project assembly (and any NuGet plugin DLL).
There are four hook types: **Generator**, **Assertion**, **Probe**, and **Processor**.

**Dependency**:

```xml
<PackageReference Include="QaaS.Framework.SDK" Version="x.x.x" />
```

---

## Generator

Produces `Data<object>` items fed to session publishers.

```csharp
using QaaS.Framework.SDK.Hooks.Generator;
using QaaS.Framework.SDK.Session.DataObjects;
using QaaS.Framework.SDK.DataSourceObjects;
using System.Collections.Immutable;
using System.ComponentModel.DataAnnotations;

public record JsonArrayConfig
{
    [Required] public uint? Count { get; set; }
    public uint ItemsPerArray { get; set; } = 5;
}

public class JsonArrayGenerator : BaseGenerator<JsonArrayConfig>
{
    public override IEnumerable<Data<object>> Generate(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        for (var i = 0; i < Configuration.Count; i++)
            yield return new Data<object> { Body = Enumerable.Range(0, (int)Configuration.ItemsPerArray).ToArray() };
    }
}
```

YAML reference:

```yaml
DataSources:
  - Name: MySource
    Generator: JsonArrayGenerator
    Configuration:
      Count: 100
      ItemsPerArray: 5
```

---

## Assertion

Validates `SessionData` after the act phase.

```csharp
using QaaS.Framework.SDK.Hooks.Assertion;
using QaaS.Framework.SDK.Session.SessionDataObjects;
using System.ComponentModel.DataAnnotations;

public record LengthConfig
{
    [Required] public string InputName  { get; set; } = default!;
    [Required] public string OutputName { get; set; } = default!;
}

public class LengthAssertion : BaseAssertion<LengthConfig>
{
    public override AssertionStatus Assert(SessionData sessionData)
    {
        var inputs  = sessionData.Inputs[Configuration.InputName];
        var outputs = sessionData.Outputs[Configuration.OutputName];
        return inputs.Count == outputs.Count ? AssertionStatus.Pass : AssertionStatus.Fail;
    }
}
```

YAML reference:

```yaml
Assertions:
  - Name: LengthCheck
    Assertion: LengthAssertion
    AssertionConfiguration:
      InputName: Publisher
      OutputName: Consumer
```

---

## Probe

Performs side-effects (setup/teardown) without returning data.

```csharp
using QaaS.Framework.SDK.Hooks.Probe;
using QaaS.Framework.SDK.Session.SessionDataObjects;
using System.Collections.Immutable;

public record PrintTimeConfig { }

public class PrintCurrentTimeProbe : BaseProbe<PrintTimeConfig>
{
    public override Task ExecuteAsync(IImmutableList<SessionData> sessionDataList)
    {
        Console.WriteLine($"Probe executed at {DateTime.UtcNow:O}");
        return Task.CompletedTask;
    }
}
```

YAML reference:

```yaml
Sessions:
  - Name: Setup
    Probes:
      - Name: PrintTime
        Probe: PrintCurrentTimeProbe
```

---

## Processor (Mocker)

Inspects or mutates Mocker stub request/response pairs.

```csharp
using QaaS.Framework.SDK.Hooks.Processor;
using QaaS.Framework.SDK.Session.CommunicationDataObjects;

public record NoConfig { }

public class EchoProcessor : BaseTransactionProcessor<NoConfig>
{
    public override Task<CommunicationData> ProcessAsync(CommunicationData request)
        => Task.FromResult(new CommunicationData { Body = request.Body });
}
```

---

## Hook Discovery

QaaS scans all loaded assemblies at startup. The **class name** is the identifier used in YAML — no registration needed.
See [Plugins](../addOns/plugins.md) to package hooks as a reusable NuGet plugin.

## Next Step

[Run your first test →](runTest.md)
