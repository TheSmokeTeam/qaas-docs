# v2 Dogfood — Custom Probe (HttpRetry503Probe)

Date: 2026-05-22. Budget: ~25 min. No repo edits.

## Goal
Author from scratch a custom Probe that GETs a URL and retries on 503 up to N times. Wire in YAML.

## 1. Docs consulted
- `D:/QaaS/qaas-docs/docs/probes/custom-authoring-guide.md` (primary).
- `D:/QaaS/qaas-docs/docs/probes/index.md` (catalog landing, listed only).
- `D:/QaaS/qaas-docs/docs/probes/availableProbes/CreateS3Bucket/configuration/tableView.md` (ProbeConfiguration column convention).
- Cross-ref of IProbe interface contract from prior indexed `iprobe-full` (Framework SDK).

## 2. Base class to extend
`QaaS.Framework.SDK.Hooks.Probe.BaseProbe<TConfiguration>` — public abstract, implements `IProbe : IHook`. Exposes:
- `Context Context { get; set; }` (→ `Context.Logger`)
- `TConfiguration Configuration { get; set; }` (where `TConfiguration : new()`)
- `void Run(IImmutableList<SessionData>, IImmutableList<DataSource>)` — override.

Required usings (mirroring `BaseRabbitMqManagementProbe`):
```csharp
using System.Collections.Immutable;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Probe;
using QaaS.Framework.SDK.Session.SessionDataObjects;
```

## 3. C# class skeleton — `HttpRetry503Probe.cs`
```csharp
using System.Collections.Immutable;
using System.Net;
using Microsoft.Extensions.Logging;
using QaaS.Framework.SDK.DataSourceObjects;
using QaaS.Framework.SDK.Hooks.Probe;
using QaaS.Framework.SDK.Session.SessionDataObjects;

namespace MyTests.Probes;

public sealed class HttpRetry503Probe : BaseProbe<HttpRetry503ProbeConfig>
{
    private static readonly HttpClient Http =
        new() { Timeout = TimeSpan.FromSeconds(10) };

    public override void Run(
        IImmutableList<SessionData> sessionDataList,
        IImmutableList<DataSource> dataSourceList)
    {
        var c = Configuration;
        var deadline = DateTime.UtcNow + TimeSpan.FromMilliseconds(c.TotalTimeoutMs);

        for (int attempt = 1; attempt <= c.MaxRetries + 1; attempt++)
        {
            using var req = new HttpRequestMessage(HttpMethod.Get, c.Url);
            using var resp = Http.Send(req);

            if ((int)resp.StatusCode == c.SuccessStatusCode)
            {
                Context.Logger.LogInformation(
                    "HttpRetry503Probe success {Url} after {Attempt} attempts",
                    c.Url, attempt);
                return;
            }

            if ((int)resp.StatusCode != c.BackpressureStatusCode)
                throw new InvalidOperationException(
                    $"Unexpected status {resp.StatusCode} from {c.Url}");

            if (attempt > c.MaxRetries || DateTime.UtcNow >= deadline)
                throw new TimeoutException(
                    $"{c.Url} kept returning {c.BackpressureStatusCode} after {attempt} attempts");

            Context.Logger.LogWarning(
                "{Url} returned {Status}; backing off {IntervalMs}ms (attempt {Attempt}/{Max})",
                c.Url, (int)resp.StatusCode, c.IntervalMs, attempt, c.MaxRetries);
            Thread.Sleep(c.IntervalMs);
        }
    }
}
```

## 4. ProbeConfig skeleton — `HttpRetry503ProbeConfig.cs`
```csharp
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MyTests.Probes;

public sealed class HttpRetry503ProbeConfig
{
    [Description("Target URL to GET."), Required]
    public string Url { get; set; } = string.Empty;

    [Description("Status code interpreted as success."), DefaultValue(200)]
    [Range(100, 599)]
    public int SuccessStatusCode { get; set; } = 200;

    [Description("Status code interpreted as transient backpressure."), DefaultValue(503)]
    [Range(100, 599)]
    public int BackpressureStatusCode { get; set; } = 503;

    [Description("Maximum retry attempts after the first request."), DefaultValue(5)]
    [Range(0, 100)]
    public int MaxRetries { get; set; } = 5;

    [Description("Pause between attempts in milliseconds."), DefaultValue(500)]
    [Range(50, 60_000)]
    public int IntervalMs { get; set; } = 500;

    [Description("Hard ceiling on total time spent retrying (ms)."), DefaultValue(30_000)]
    [Range(100, 600_000)]
    public int TotalTimeoutMs { get; set; } = 30_000;
}
```

## 5. YAML usage
```yaml
Sessions:
  - Name: WaitBackend
    Probes:
      - Name: WaitForApi
        Probe: HttpRetry503Probe
        ProbeConfiguration:
          Url: http://127.0.0.1:8080/health
          MaxRetries: 8
          IntervalMs: 750
          TotalTimeoutMs: 15000
```

## 6. Doc pages consulted (final list)
1. `docs/probes/custom-authoring-guide.md` — sole authoring reference; contains PingProbe + WaitForHttpReady examples.
2. `docs/probes/index.md` — catalog index (only the landing copy).
3. `docs/probes/availableProbes/CreateS3Bucket/configuration/tableView.md` — ProbeConfiguration row format.
4. (Implicit, from prior session index) `iprobe-full` excerpt of `QaaS.Framework.SDK.Hooks.Probe.IProbe` & `BaseProbe<>` body.

## 7. Questions the docs did NOT answer
- Is `Run` synchronous only, or is an `async`/`RunAsync` override supported by the SDK? Guide shows only sync `void Run`.
- Is `Thread.Sleep` acceptable inside `Run`, or is there a cancellation token / `Context.CancellationToken` to honor?
- Where is `Context.Logger` typed (`ILogger` from MS.Extensions vs. Serilog ILogger)? Guide uses `.Information(...)`, MS extension uses `.LogInformation(...)` — ambiguous.
- How to inject `HttpClient` via `IHttpClientFactory` from Context (DI surface not documented).
- Registration story: do probe assemblies need to be referenced by the runner only, or registered via attribute/assembly scan? Not stated.
- Schema generation: does `[JsonSchema]` flow automatically because `BaseProbe<>` has the attribute, or must `HttpRetry503Probe`/its config be annotated?
- Validation: are `[Range]` / `[Required]` enforced before `Run`, or must the probe re-validate?
- Naming: `Probe:` field in YAML — does it accept FQTN, simple type name, or attribute-given alias? Guide shows simple name `PingProbe`.
- Exception semantics: guide says "throw to fail" — which exception types map to fail vs. error vs. abort session?

## 8. Source-fidelity check vs. `D:/QaaS/QaaS.Common.Probes`
Verified against `BaseElasticProbe.cs`, `BaseRabbitMqManagementProbe.cs`, `BaseProbe<>` body.

Matches:
- `BaseProbe<T>` from `QaaS.Framework.SDK.Hooks.Probe` ✓
- `public override void Run(IImmutableList<SessionData>, IImmutableList<DataSource>)` signature ✓
- `Configuration` property usage ✓
- Namespacing convention (`QaaS.Common.Probes.<Domain>Probes`) — sample uses `MyTests.Probes`, fine for user code.

Mismatches / risks found:
- Guide uses `Context.Logger.Information(...)` (Serilog-style). Real code (`BaseRabbitMqManagementProbe`) uses `Microsoft.Extensions.Logging` + `LogInformation`. Skeleton above follows the source (`LogInformation`/`LogWarning`).
- Guide example uses `new HttpClient()` at static scope; QaaS source uses per-instance client built with handler. Either works; static is sufficient for read-only GET but doesn't honor TLS-skip toggles.
- No `IDisposable` story shown in guide; `BaseOsProbe`/`BaseRedisProbe` implement `IDisposable`. Skeleton has no disposables — OK.
- `HttpClient.Send` (sync) is used in skeleton; guide hints async unclear — acceptable for `void Run`.

## 9. Self-rank 0-10
- time-to-skeleton: **7** (one authoring guide; had to cross-check source for logging API).
- source fidelity: **6** (guide's logger call doesn't match source; status-code/`Range` patterns do match).
- example density: **6** (two examples: PingProbe, WaitForHttpReady — neither shows retry/loop/cancellation).
- copy-pastability: **7** (skeletons compile-shape correct; user must add `MyTests.Probes` namespace and reference `QaaS.Framework.SDK`).
- confidence: **6** (registration, async support, cancellation, validation behavior all unverified from docs).

## 10. Three specific docs fixes
1. Add a section "Logging" to `custom-authoring-guide.md` clarifying that `Context.Logger` is `Microsoft.Extensions.Logging.ILogger` and showing `LogInformation`/`LogWarning` — fix the existing `Information(...)` snippet to match source.
2. Add a section "Registration & Discovery" stating exactly how the runner finds custom probes (assembly reference? scan path? attribute?) and which value goes in YAML `Probe:` (simple type name vs. FQTN vs. alias).
3. Add a "Retry / Long-running probes" recipe with cancellation, async/sync guidance (`HttpClient.Send` vs. `SendAsync`, `Thread.Sleep` vs. `Task.Delay`, honoring a `Context.CancellationToken`). Currently no doc page covers loop-with-backoff probes despite that being a primary use case.
