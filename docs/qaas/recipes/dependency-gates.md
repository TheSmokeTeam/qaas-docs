---
id: qaas.recipes.dependency-gates
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner, probes]
keywords: [recipes, dependency, readiness, probes, stages, cleanup]
summary: "Gate a Runner test on dependency readiness using probes and stages, then clean up at the end."
---
# Dependency Gates

> TL;DR — Use probes plus stages to refuse to run actions until dependencies are ready, then clean up isolated resources at the end.

## When to use {: #when-to-use}

- A dependency (HTTP service, Redis, Kafka) is provisioned out of band and may not be ready when the test starts.
- You want one hard barrier between readiness and action.
- You want to clean up test-owned resources without leaking state.

## Files to create {: #files}

`test.qaas.yaml`:

```yaml
MetaData:
  Name: dependency-gate-demo

Sessions:
  - Name: WaitForApp
    Stage: 1
    Probes:
      - Name: AppReady
        Probe: HttpReadiness
        ProbeConfiguration:
          Url: http://localhost:5050/healthz
          ExpectedStatus: 200
          TimeoutSeconds: 30
          IntervalSeconds: 1

  - Name: HttpSession
    Stage: 2
    SaveData: true
    Publishers:
      - Name: HelloPublisher
        Publisher: Http
        Configuration:
          Url: http://localhost:5050/hello
          Method: GET

  - Name: Cleanup
    Stage: 3
    Probes:
      - Name: ClearCache
        Probe: HttpReadiness
        ProbeConfiguration:
          Url: http://localhost:5050/admin/cache/clear
          Method: POST
          ExpectedStatus: 204
          TimeoutSeconds: 5
          IntervalSeconds: 1

Assertions:
  - Name: HelloIs200
    Assertion: HttpStatus
    SessionNames: [HttpSession]
    AssertionConfiguration:
      OutputName: HelloPublisher
      ExpectedStatus: 200
```

## Template {: #template}

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- template test.qaas.yaml --no-env
```

## Run with hard barrier {: #run}

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- run test.qaas.yaml
```

Expected ordering:

1. Stage 1 runs `WaitForApp` to completion. If the probe times out, stages 2 and 3 do not run.
2. Stage 2 runs `HttpSession`. The probe in stage 1 is a hard barrier: stage 2 starts only after stage 1 finishes.
3. Stage 3 runs `Cleanup` regardless of pass or fail in stage 2 when `RunUntilStage` is not set.

To stop after stage 2 and skip cleanup explicitly:

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- run test.qaas.yaml --run-until-stage 2
```

## Cleanup {: #cleanup}

The cleanup session is part of the test. For local debugging:

```powershell
curl -X POST http://localhost:5050/admin/cache/clear
```

## Failure modes {: #failures}

| Symptom | Cause | Fix |
|---|---|---|
| Stage 2 starts before dependency is ready | Probe missing in stage 1 | Add the probe and the correct stage number |
| Cleanup skipped on a pass | `--run-until-stage` stopped early | Remove the flag or raise the value |
| Probe never succeeds | Wrong URL, port, or method | Run the URL manually first |

## See also {: #see-also}

- [Stages](../advancedConcepts/stages.md)
- [Probes catalog](../../probes/index.md)
- [Custom probe authoring guide](../../probes/custom-authoring-guide.md)
