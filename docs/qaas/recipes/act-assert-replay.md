---
id: qaas.recipes.act-assert-replay
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner]
keywords: [recipes, act, assert, replay, sessiondata]
summary: "Capture session data once with act, then replay assertions repeatedly with assert. Useful when actions are slow, networked, or expensive."
---
# Act/Assert Replay

> TL;DR — `act` captures session data; `assert` replays assertions against the captured data. Use this loop when actions are expensive and you want to iterate on assertion rules.

## When to use {: #when-to-use}

- The action phase requires a live dependency that is slow to set up.
- You are tuning a new assertion against a fixed recording.
- You are diagnosing a flaky assertion without re-running the action.

## Files to create {: #files}

`test.qaas.yaml`:

```yaml
MetaData:
  Name: act-assert-demo

Storages:
  - Name: SessionStorage
    Storage: FileSystem
    Configuration:
      Path: ./qaas-out
      JsonStorageFormat: Indented

Sessions:
  - Name: HttpSession
    SaveData: true
    Publishers:
      - Name: HelloPublisher
        Publisher: Http
        Configuration:
          Url: http://localhost:5050/hello
          Method: GET

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

Expected: a `template.qaas.yaml` view of the effective configuration with `SaveData: true` preserved.

## Capture (act) {: #act}

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- act test.qaas.yaml
```

Expected output shape: exit code `0`, `qaas-out/<run-id>/sessions/HttpSession.json` written with the captured action data, no assertions executed.

## Replay (assert) {: #assert}

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- assert test.qaas.yaml --session-data ./qaas-out/<run-id>
```

Expected: exit code `0` when the captured `HttpStatus` equals 200; non-zero when it does not. The replay does not call the live endpoint.

## Cleanup {: #cleanup}

```powershell
Remove-Item -Recurse -Force .\qaas-out
```

## Failure modes {: #failures}

| Symptom | Cause | Fix |
|---|---|---|
| `assert` reports missing storage | `SaveData: false` during `act` | Re-run `act` with `SaveData: true` |
| `assert` cannot find session data | Run id mismatch | Pass the correct directory under `qaas-out/` |
| `assert` fails on rule change | Assertion configuration drifted | Update the rule, rerun `assert` without rerunning `act` |

## See also {: #see-also}

- [Storage and SaveData](storage-and-save-data.md)
- [`act` command](../userInterfaces/runner/commands/act.md)
- [`assert` command](../userInterfaces/runner/commands/assert.md)
- [Debug failures](../quickStart/debugTestFailure.md)
