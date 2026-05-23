---
id: qaas.recipes.storage-and-save-data
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner]
keywords: [recipes, storage, savedata, jsonstorageformat, session-data]
summary: "Configure FileSystem storage with SaveData so captured session data can be inspected, archived, and replayed."
---
# Storage And SaveData

> TL;DR — `Storages` declares where session artifacts go; `SaveData: true` on a session writes the captured outputs there.

## When to use {: #when-to-use}

- You want to keep run artifacts for archival or post-mortem.
- You want to enable the [act/assert replay](act-assert-replay.md) loop.
- You want to publish artifacts to an HTTP results endpoint.

## Files to create {: #files}

`test.qaas.yaml`:

```yaml
MetaData:
  Name: storage-demo

Storages:
  - Name: FileStorage
    Storage: FileSystem
    Configuration:
      Path: ./qaas-out
      JsonStorageFormat: Indented
  - Name: ResultsStorage
    Storage: Http
    Configuration:
      Url: http://localhost:5060/results
      Method: POST
      JsonStorageFormat: Compact

Sessions:
  - Name: HttpSession
    SaveData: true
    StorageNames: [FileStorage, ResultsStorage]
    Publishers:
      - Name: HelloPublisher
        Publisher: Http
        Configuration:
          Url: http://localhost:5050/hello
          Method: GET
```

## Template {: #template}

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- template test.qaas.yaml --no-env
```

## Run {: #run}

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- run test.qaas.yaml
```

Expected output shape:

- `qaas-out/<run-id>/sessions/HttpSession.json` written.
- A POST to `http://localhost:5060/results` containing the JSON payload.
- Exit code `0`.

## JsonStorageFormat {: #json-format}

- `Indented` — human-friendly, used for archival and replay.
- `Compact` — minimal bytes, used for HTTP transport and ingest pipelines.

## Storage placement {: #placement}

`StorageNames` accepts more than one storage. The Runner writes the session payload to each declared target. Failures in one storage do not silently skip the others; check the run log for per-target outcomes.

## Replay {: #replay}

`assert` reads from FileSystem storage; HTTP storages are write-only. To replay, point `assert` at the FileSystem directory:

```powershell
dotnet run --project D:\QaaS\QaaS.Runner\QaaS.Runner -- assert test.qaas.yaml --session-data ./qaas-out/<run-id>
```

## Cleanup {: #cleanup}

```powershell
Remove-Item -Recurse -Force .\qaas-out
```

## Failure modes {: #failures}

| Symptom | Cause | Fix |
|---|---|---|
| No files in `qaas-out` | `SaveData: false` | Set `SaveData: true` on the session |
| HTTP 4xx from results endpoint | Wrong content type or auth | Inspect the run log; align with the endpoint contract |
| Replay fails to find session | Wrong run id | Use the run id printed by the most recent `run` |

## See also {: #see-also}

- [Storages overview](../userInterfaces/runner/configurationSections/storages/overview.md)
- [Act/Assert replay](act-assert-replay.md)
- [Debug failures](../quickStart/debugTestFailure.md)
