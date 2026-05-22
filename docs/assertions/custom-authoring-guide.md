---
id: assertions.custom-authoring-guide
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [assertions, framework, runner, mocker]
keywords: [assertions, custom, assertion, authoring, sdk, BaseAssertion, IAssertion]
summary: "Derive a custom assertion from BaseAssertion<TConfig> in QaaS.Framework.SDK and wire it into an Assertions[] entry."
---

# Custom Assertions — Authoring Guide

> TL;DR — An assertion is an `IAssertion` hook that inspects accumulated `SessionData`, sets `AssertionTrace` / `AssertionMessage`, and returns `bool`. Derive `BaseAssertion<TConfiguration>` and reference it from an `Assertions[]` entry.

## When to use {#when-to-use}

- The built-in assertion catalog (see [Available Assertions](index.md)) does not cover your invariant.
- You need a domain-specific check (size bounds, structural rules, business rules) over collected interactions.
- You need to publish custom traces or attachments into the reporter pipeline.

## YAML configuration {#yaml}

```yaml
Assertions:
  - Name: PayloadSize
    Assertion: HasMinimumPayloadSize
    SessionNames: [HttpSession]
    AssertionConfiguration:
      OutputName: HttpConsumer
      MinimumBytes: 512
```

## C# (CAC) usage {#csharp}

Derive `BaseAssertion<TConfiguration>` from `QaaS.Framework.SDK.Hooks.Assertion`. Override `Assert(IImmutableList<SessionData>, IImmutableList<DataSource>)`. Use `AssertionMessage` to describe the failure; the runner converts it into a red Allure step.

```csharp
using System.Collections.Immutable;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Assertion;
using QaaS.Framework.SDK.Session.SessionDataObjects;

public sealed class MyAssertion : BaseAssertion<MyConfig>
{
    public override bool Assert(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        AssertionMessage = "ok";
        return true;
    }
}
```

## Minimal example {#example-minimal}

```csharp
public record NonEmptyConfig { public string OutputName { get; set; } = default!; }

public sealed class NonEmpty : BaseAssertion<NonEmptyConfig>
{
    public override bool Assert(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> _)
    {
        var n = sessionDataList.SelectMany(s => s.GetOutputByName(Configuration.OutputName).Data).Count();
        AssertionMessage = n > 0 ? $"observed {n}" : "no data";
        return n > 0;
    }
}
```

## Realistic example {#example-realistic}

A payload-size assertion paired with a mocker stub that returns fixed-size responses. The runner asserts every observed payload meets a minimum byte threshold; the mocker generates payloads of a configurable size.

The custom assertion (runner side):

```csharp
using System.Collections.Immutable;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Assertion;
using QaaS.Framework.SDK.Session.SessionDataObjects;

namespace MyTests.Assertions;

public record HasMinimumPayloadSizeConfig
{
    [Description("Consumer output to inspect.")]
    [Required]
    public string OutputName { get; set; } = default!;

    [Description("Inclusive minimum payload size in bytes.")]
    [Range(1, int.MaxValue)]
    public int MinimumBytes { get; set; }
}

public sealed class HasMinimumPayloadSize : BaseAssertion<HasMinimumPayloadSizeConfig>
{
    public override bool Assert(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        var observed = sessionDataList
            .SelectMany(s => s.GetOutputByName(Configuration.OutputName).Data)
            .ToImmutableList();

        if (observed.Count == 0)
        {
            AssertionMessage = $"No data observed on '{Configuration.OutputName}'.";
            return false;
        }

        var smallest = observed.Min(d => d.Body?.Length ?? 0);
        AssertionTrace = $"Observed {observed.Count} payloads; smallest={smallest}B; threshold={Configuration.MinimumBytes}B.";

        if (smallest < Configuration.MinimumBytes)
        {
            AssertionMessage = $"Smallest payload {smallest}B < required {Configuration.MinimumBytes}B.";
            return false;
        }

        AssertionMessage = $"All payloads >= {Configuration.MinimumBytes}B.";
        return true;
    }
}
```

The matching mocker stub (mocker side):

```csharp
using System.Collections.Immutable;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Processor;
using QaaS.Framework.SDK.Session.DataObjects;
using QaaS.Framework.SDK.Session.MetaDataObjects;

namespace MyMock.Processors;

public record FixedSizeResponseConfig
{
    [Description("Exact payload size in bytes.")]
    [Range(1, 1_048_576)]
    public int SizeBytes { get; set; } = 1024;

    [Description("HTTP status to return."), DefaultValue(200)]
    public int StatusCode { get; set; } = 200;
}

public class FixedSizeResponse : BaseTransactionProcessor<FixedSizeResponseConfig>
{
    public override Data<object> Process(
        IImmutableList<DataSource> _,
        Data<object> __)
    {
        var bytes = new byte[Configuration.SizeBytes];
        Array.Fill<byte>(bytes, (byte)'x');

        return new Data<object>
        {
            Body = bytes,
            MetaData = new MetaData
            {
                Http = new Http
                {
                    StatusCode = Configuration.StatusCode,
                    ResponseHeaders = new Dictionary<string, string>
                    {
                        ["Content-Type"] = "application/octet-stream",
                        ["Content-Length"] = bytes.Length.ToString(),
                    },
                },
            },
        };
    }
}
```

Test YAML (runner side):

```yaml
DataSources:
  - Name: Inputs
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem: { Path: TestData }
Sessions:
  - Name: HttpSession
    Publishers:
      - Name: HttpPublisher
        DataSourceNames: [Inputs]
        Policies: [{ LoadBalance: { Rate: 5 } }]
        Http:
          Url: http://127.0.0.1:8080/data
          Method: Get
    Consumers:
      - Name: HttpConsumer
        HttpResponseFrom: HttpPublisher
        Deserialize: { Deserializer: None }
Assertions:
  - Name: PayloadSize
    Assertion: HasMinimumPayloadSize
    SessionNames: [HttpSession]
    AssertionConfiguration:
      OutputName: HttpConsumer
      MinimumBytes: 512
```

Mocker YAML:

```yaml
Stubs:
  - Name: FixedKb
    Processor: FixedSizeResponse
    ProcessorConfiguration: { SizeBytes: 1024, StatusCode: 200 }
Servers:
  - Http:
      Port: 8080
      IsLocalhost: false
      Endpoints:
        - Path: /data
          Actions:
            - Name: GetFixed
              Method: Get
              TransactionStubName: FixedKb
```

## Registration and discovery {#registration}

Custom assertions are discovered by short type name. The runner scans referenced assemblies for types deriving from `BaseAssertion<>`. To wire one in:

1. Place the class in any namespace inside an assembly the runner loads (your test project, or a referenced library).
2. Reference the assembly from the project that hosts the YAML — a project reference or a NuGet package both work.
3. In YAML, set `Assertion:` to the **simple type name** (e.g. `HasMinimumPayloadSize`), not the fully-qualified name.

```yaml
Assertions:
  - Name: PayloadSize
    Assertion: HasMinimumPayloadSize      # simple type name
    SessionNames: [HttpSession]
```

Two assertions with the same simple name across assemblies will collide; rename one. The runner only discovers types whose assembly is already loaded in its `AppDomain` — a transitive dependency that nothing references will not be visible. Custom data annotations on `TConfiguration` (`[Required]`, `[Range]`, `[Url]`) are validated before `Assert` runs.

After adding or renaming a custom assertion, regenerate the YAML schema so editors pick up the new enum value. See [Schema extensions](../qaas/userInterfaces/runner/schema-extensions.md) for the regeneration command and the `bin/` cache flush.

## Edge cases {#edge-cases}

- `Configuration` is null before `LoadAndValidateConfiguration` runs. Do not read it in a constructor.
- `Assert` returns `bool`; do not throw to signal a failure. Set `AssertionMessage` and return `false`.
- Stub responses are byte arrays. Pre-allocate buffers for size-sensitive scenarios.
- The mocker stub must have a unique `Name`; the runner references it via `TransactionStubName`.
- Runner and mocker must restore packages from the same feed so schema validation accepts both sides.

## See also {#see-also}

- [Assertions — Introduction](index.md)
- [Sessions — Assertions reference](../qaas/userInterfaces/runner/configurationSections/assertions/overview.md)
- [Processors — custom authoring guide](../processors/custom-authoring-guide.md)
