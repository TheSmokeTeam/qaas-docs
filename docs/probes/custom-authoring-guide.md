---
id: probes.custom-authoring-guide
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes, framework, runner]
keywords: [probes, custom, probe, authoring, sdk, BaseProbe, IProbe]
summary: "Derive a custom probe from BaseProbe<TConfig> in QaaS.Framework.SDK and wire it into a session via the Probes block."
---

# Custom Probes — Authoring Guide

> TL;DR — A probe is an `IProbe` hook that runs inside a session, can read `SessionData` and `DataSources`, and produces no output payload. Derive `BaseProbe<TConfiguration>` and declare it in YAML under `Sessions[].Probes`.

## When to use {#when-to-use}

- The built-in probe catalog (see [Available Probes](index.md)) does not cover the side effect you need.
- You want to poll an external endpoint, mutate environment state, or perform a sanity check inside the session lifecycle.
- You need to express a side effect that does not record interaction data.

## YAML configuration {#yaml}

A probe slot lives inside a session and references the configured probe by name:

```yaml
Sessions:
  - Name: Smoke
    Probes:
      - Name: WaitReady
        Probe: WaitForHttpReady
        ProbeConfiguration:
          Url: http://127.0.0.1:8080/health
          ReadyStatusCode: 200
          BackpressureStatusCode: 503
          TimeoutMs: 30000
          IntervalMs: 500
        Stage: 3
```

The fields `Name`, `Probe`, `ProbeConfiguration`, `Stage`, `DataSourceNames`, and `DataSourcePatterns` are documented in the [Probes section reference](../qaas/userInterfaces/runner/configurationSections/sessions/types/probes.md).

## C# (CAC) usage {#csharp}

Derive `BaseProbe<TConfiguration>` from `QaaS.Framework.SDK.Hooks.Probe`. Override `Run(IImmutableList<SessionData>, IImmutableList<DataSource>)`. Use `Context.Logger` for diagnostics; throw on unrecoverable failure.

```csharp
using System.Collections.Immutable;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Probe;
using QaaS.Framework.SDK.Session.SessionDataObjects;

public sealed class WaitForHttpReady : BaseProbe<WaitForHttpReadyConfig>
{
    public override void Run(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        // Side-effect work goes here. Throw to fail the probe.
    }
}
```

## Minimal example {#example-minimal}

```csharp
public record PingConfig
{
    public string Url { get; set; } = default!;
}

public sealed class PingProbe : BaseProbe<PingConfig>
{
    public override void Run(
        IImmutableList<SessionData> _,
        IImmutableList<DataSource> __)
    {
        Context.Logger.LogInformation("Pinging {Url}", Configuration.Url);
    }
}
```

```yaml
Sessions:
  - Name: Ping
    Probes:
      - Name: Hello
        Probe: PingProbe
        ProbeConfiguration: { Url: http://127.0.0.1:8080/ }
```

## Realistic example {#example-realistic}

Polling an HTTP endpoint that reports `503` while warming up and `200` when ready. The probe retries with a fixed interval until the deadline, then throws.

```csharp
using System.Collections.Immutable;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Probe;
using QaaS.Framework.SDK.Session.SessionDataObjects;

namespace MyTests.Probes;

public record WaitForHttpReadyConfig
{
    [Description("Health URL to poll.")]
    [Required, Url]
    public string Url { get; set; } = default!;

    [Description("Status code interpreted as READY."), DefaultValue(200)]
    [Range(100, 599)]
    public int ReadyStatusCode { get; set; } = 200;

    [Description("Status code interpreted as transient backpressure."), DefaultValue(503)]
    [Range(100, 599)]
    public int BackpressureStatusCode { get; set; } = 503;

    [Description("Maximum total wait time in milliseconds."), DefaultValue(60_000)]
    [Range(100, int.MaxValue)]
    public int TimeoutMs { get; set; } = 60_000;

    [Description("Pause between attempts in milliseconds."), DefaultValue(500)]
    [Range(50, 60_000)]
    public int IntervalMs { get; set; } = 500;
}

public sealed class WaitForHttpReady : BaseProbe<WaitForHttpReadyConfig>
{
    private static readonly HttpClient Http = new() { Timeout = TimeSpan.FromSeconds(5) };

    public override void Run(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        var deadline = DateTime.UtcNow.AddMilliseconds(Configuration.TimeoutMs);
        var attempts = 0;
        var lastStatus = -1;

        while (DateTime.UtcNow < deadline)
        {
            attempts++;
            try
            {
                using var resp = Http.GetAsync(Configuration.Url).GetAwaiter().GetResult();
                lastStatus = (int)resp.StatusCode;
                Context.Logger.LogInformation(
                    "WaitForHttpReady attempt={Attempt} status={Status}",
                    attempts, lastStatus);

                if (lastStatus == Configuration.ReadyStatusCode)
                    return;

                if (lastStatus != Configuration.BackpressureStatusCode)
                    throw new InvalidOperationException(
                        $"Unexpected status {lastStatus} from {Configuration.Url}; " +
                        $"expected {Configuration.ReadyStatusCode} or {Configuration.BackpressureStatusCode}.");
            }
            catch (HttpRequestException ex)
            {
                Context.Logger.LogWarning(ex, "WaitForHttpReady transient error on attempt {Attempt}", attempts);
            }

            Thread.Sleep(Configuration.IntervalMs);
        }

        throw new TimeoutException(
            $"Endpoint {Configuration.Url} did not return {Configuration.ReadyStatusCode} within " +
            $"{Configuration.TimeoutMs}ms after {attempts} attempts (last status {lastStatus}).");
    }
}
```

Paired YAML:

```yaml
DataSources:
  - Name: Inputs
    Generator: FromFileSystem
    GeneratorConfiguration:
      DataArrangeOrder: AsciiAsc
      FileSystem: { Path: TestData }

Sessions:
  - Name: HappyPath
    Probes:
      - Name: WaitReady
        Probe: WaitForHttpReady
        Stage: 1
        ProbeConfiguration:
          Url: http://127.0.0.1:8080/health
          ReadyStatusCode: 200
          BackpressureStatusCode: 503
          TimeoutMs: 30000
          IntervalMs: 500
    Publishers:
      - Name: Publisher
        DataSourceNames: [Inputs]
        Policies: [{ LoadBalance: { Rate: 5 } }]
        Http:
          Url: http://127.0.0.1:8080/data
          Method: Get
    Consumers:
      - Name: Consumer
        HttpResponseFrom: Publisher
        Deserialize: { Deserializer: Json }

Assertions:
  - Name: Hermetic
    Assertion: HermeticByInputOutputPercentage
    SessionNames: [HappyPath]
    AssertionConfiguration:
      OutputNames: [Consumer]
      InputNames: [Publisher]
      ExpectedPercentage: 100
```

## Logging {#logging}

`Context.Logger` is a `Microsoft.Extensions.Logging.ILogger`. Use the standard structured-logging methods — `LogInformation`, `LogWarning`, `LogError`, `LogDebug` — with named placeholders. Source probes in `QaaS.Common.Probes` (`BaseOsUpdatePodsProbe`, `BaseRabbitMqManagementProbe`) follow this pattern.

```csharp
Context.Logger.LogInformation("Probing {Url}", Configuration.Url);
Context.Logger.LogWarning(ex, "Transient failure on attempt {Attempt}", attempt);
```

Do not call Serilog-style methods such as `Information(...)` or `Warning(...)`; they do not exist on `ILogger`.

## Registration and discovery {#registration}

Custom probes are discovered by short type name. The runner scans referenced assemblies for types deriving from `BaseProbe<>`. To wire a probe in:

1. Place the probe class in any namespace inside an assembly the runner loads (your test project, or a referenced library).
2. Reference the assembly from the project that hosts your YAML.
3. In YAML, set `Probe:` to the **simple type name** (e.g. `PingProbe`), not the fully-qualified name.

```yaml
Sessions:
  - Name: Smoke
    Probes:
      - Name: HitHealth
        Probe: PingProbe        # simple type name
        ProbeConfiguration: { Url: http://127.0.0.1:8080/ }
```

Two types with the same simple name across assemblies will collide; rename one. Configuration validation (`[Required]`, `[Range]`, `[Url]`) runs before `Run` is invoked.

## Retry and long-running probes {#retry}

Probes that loop with backoff are common (health checks, queue drains, eventual-consistency waits). Pattern:

- Use `HttpClient.Send` (sync) inside `Run`. `Run` is not async; do not wrap it in `Task.Run`.
- Use `Thread.Sleep` between attempts. Honor a configured total-deadline so the suite cannot hang.
- Treat one status code as "ready", one as "transient backpressure". Any other status throws.
- Log every attempt at `LogInformation` and every transient retry at `LogWarning`.

The `WaitForHttpReady` example above is the canonical retry skeleton. For a stricter variant that distinguishes retry-budget exhaustion from total-time exhaustion, add a `MaxRetries` config field and check `attempt > MaxRetries || DateTime.UtcNow >= deadline` before sleeping.

## Edge cases {#edge-cases}

- `IProbe.Run` is synchronous. Do not wrap it in `Task.Run` — the runner's iteration scheduler controls concurrency.
- Reuse `HttpClient` statically. Creating one per `Run` call leaks sockets under load.
- Unhandled exceptions from `Run` fail the probe, which fails the session and the suite. That is the intended way to surface "endpoint never became ready".
- The `[Url]` data annotation rejects bare `localhost` at config-load time; provide a scheme.
- Configuration is null before `LoadAndValidateConfiguration` runs. Never read `Configuration` in a constructor.

## See also {#see-also}

- [Probes — Introduction](index.md)
- [Probes — Available probes](availableProbes/UploadRabbitMqDefinitions/overview.md)
- [Sessions — Probes type reference](../qaas/userInterfaces/runner/configurationSections/sessions/types/probes.md)
