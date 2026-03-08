# Debug Test Failures

## 1. Increase Log Verbosity

```bat
dotnet run -- run test.qaas.yaml -l Debug
```

Use `-l Verbose` for protocol-level trace output.

## 2. Split Act and Assert

Run the phases independently to isolate failures.

**Act only** (run sessions, write SessionData to storage):

```bat
dotnet run -- act test.qaas.yaml -w Variables/local.yaml
```

**Assert only** (read existing SessionData, run assertions):

```bat
dotnet run -- assert test.qaas.yaml -w Variables/local.yaml
```

Configure `FileSystem` storage to write session data locally:

```yaml
Storage:
  Type: FileSystem
  Path: ./storage
```

## 3. Inspect Session Data

Open the `storage/` folder. Each JSON file is the `SessionData` of one session:

- **Inputs** keyed by publisher name
- **Outputs** keyed by consumer name
- Timestamps on every item (useful for delay assertion debugging)

## 4. View the Allure Report

```bat
allure serve
```

The report shows per-assertion pass/fail, failure reason, session data attachments, and observability links.

## 5. Common Failure Causes

| Symptom | Likely cause |
|---|---|
| Consumer output count is 0 | `TimeoutMs` too short, or SUT is slow |
| Hermetic assertion fails | Messages lost in transit; inspect exchange/queue config |
| `DelayByChunks` fails | System throughput below policy rate |
| Assertion throws an exception | Missing or misspelled config field |
| `OutputDeserializableTo` fails | Output format changed; compare raw bytes in session data |

## 6. Logger Reference

See [Logger](../userInterfaces/logger.md) for full Serilog and Elasticsearch sink configuration.

---

You've completed the Getting Started guide! Next, explore:

- [Runner Architecture](../architecture.md)
- [Advanced Concepts — Stages](../advancedConcepts/stages.md)
- [Mocker Introduction](../../mocker/index.md)
