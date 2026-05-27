# Dogfood: Write a QaaS HTTP GET Test from Docs Only

## 1. Spec translation

- Goal: one HTTP GET to `https://httpbin.org/status/200`, assert status==200 via `HttpStatus`, FileSystem storage for replay, 2 stages, 1 session.
- Interpretation of "2 stages, 1 session": only one Session, so the 2 stages must be **action stages** inside that session (per `advancedConcepts/stages.md`). I picked Stage 0 = Transaction (fires GET), Stage 1 = a no-op Probe placeholder. (Docs do not show an idiomatic way to satisfy "2 stages" with only one logical action — see gaps.)

## 2. YAML (`test.qaas.yaml`)

```yaml
MetaData:
  Team: Smoke
  System: HttpBinPing

Storages:
  - Configuration:
    JsonStorageFormat: Indented
    FileSystem:
      Path: ./qaas-storage

Sessions:
  - Name: HttpBinSession
    SaveData: true
    Transactions:
      - Name: GetStatus
        Stage: 0
        Http:
          BaseAddress: https://httpbin.org
          Method: Get
          Route: /status/200
          Port: 443
    Probes:
      - Name: NoOpBarrier
        Stage: 1
    Assertions:
      - Name: HttpStatusIs200
        Assertion: HttpStatus
        AssertionConfiguration:
          StatusCode: 200
          OutputNames: [GetStatus]
```

Note: I am NOT certain the assertion belongs under `Sessions[].Assertions` vs a top-level `Assertions:` list. The HttpStatus `overview.md` shows it inside `Sessions[].Assertions`; the quickstart `writeTestYaml.md` shows top-level `Assertions:`. Both might be accepted. I went with the one closest to the HttpStatus example.

## 3. CLI

Run full flow:
```bash
dotnet run -- run test.qaas.yaml
```

Replay assertions against stored data:
```bash
dotnet run -- act test.qaas.yaml
dotnet run -- assert test.qaas.yaml
```

## 4. Doc pages consulted (in order)

1. `docs/qaas/quickStart/writeTestYaml.md`
2. `docs/assertions/availableAssertions/HttpStatus/overview.md`
3. `docs/assertions/availableAssertions/HttpStatus/configuration/yamlView.md`
4. `docs/assertions/availableAssertions/HttpStatus/configuration/tableView.md`
5. `docs/qaas/advancedConcepts/stages.md`
6. `docs/qaas/advancedConcepts/liveSessionData.md` (skimmed for SaveData usage)
7. `docs/qaas/userInterfaces/runner/configurationSections/storages/configurations/yamlView.md`
8. `docs/qaas/userInterfaces/runner/configurationSections/storages/configurations/tableView.md`
9. `docs/qaas/userInterfaces/runner/commands/commands.md`
10. `docs/qaas/userInterfaces/runner/commands/act.md`
11. `docs/qaas/userInterfaces/runner/configurationSections/sessions/types/transactions-yamlView.md`

## 5. Questions I could not answer from docs (doc gaps)

a. **Which action type fires an HTTP request?** Quickstart uses RabbitMQ Publisher/Consumer. Only by grepping I found `Http:` lives under Transactions. No quickstart for "I just want one HTTP call".
b. **HTTPS / port 443.** Transaction `Http` has `Port` and `BaseAddress` but no doc says whether scheme in `BaseAddress` is honoured or `Port` is required for TLS. Guessed `Port: 443`.
c. **Where does `HttpStatus.OutputNames` point?** Names of Consumers? Transactions? `tableView.md` says only "names of the outputs to check". I assumed Transaction name acts as an output.
d. **Top-level `Assertions:` vs per-session `Assertions:`.** Two examples in docs disagree.
e. **How to wire Storage to act/assert.** `Storages` schema exists but no page links `act → store → assert` end-to-end. `act.md` mentions "save all sessionData" but never shows the Storage config feeding it.
f. **"2 stages" semantics with 1 session.** Docs say action stages don't form hard barriers; the task's "2 stages" is ambiguous. No canonical recipe for "two-stage single-action test".
g. **Required `SaveData: true` for replay?** Mentioned once in `liveSessionData.md`, never in the storage docs or `act` docs.
h. **`JsonStorageFormat` placement.** `yamlView` puts it at the `Storages[]` item level but indentation is ambiguous — appears as a sibling of `Configuration:`, which itself is empty.
i. **No `httpbin`-style worked example anywhere.** Closest thing is `assertions/custom-authoring-guide.md` snippet, which uses `Http:` under a Publisher (different shape than Transaction).

## 6. Source-repo verification

Greps run against `D:/QaaS/QaaS.*`:

- `Http:` under Transaction → confirmed (`QaaS.Runner` Transaction config has `BaseAddress`, `Method`, `Route`, `Port`, `Headers`).
- `HttpStatus` assertion source path matches doc (`QaaS.Common.Assertions/HttpMetaDataLogic/HttpStatus.cs`).
- `Storages[].FileSystem.Path` — confirmed required string in schema.
- `Storages[].Configuration` empty key in yamlView appears to be a doc-gen artifact; in source the storage entry has flat keys, no nested `Configuration:` block. **Likely doc mismatch.**
- `SaveData` exists on Session (boolean).
- `act` / `assert` commands and positional `<config-file>` confirmed.
- `OutputNames` on `HttpStatus` accepts Transaction names (Transactions are treated as Output-bearing actions); confirmed by schema enum referencing action names.

Mismatches found:
1. `Storages` `yamlView.md` has an empty `Configuration:` key with the rest of fields outdented under the array item — not what the schema actually expects. Confusing.
2. No doc page mentions that to enable replay you must set `SaveData: true` AND configure `Storages`. Both are required in source.

## 7. Ranking (0–10)

| Dimension | Score | Notes |
|---|---|---|
| Time-to-first-test | 4 | Took ~20 min and required guessing 4+ shapes. |
| Discoverability | 5 | Nav is OK; full-text search would have helped. No "HTTP quickstart" page. |
| Source fidelity | 7 | Mostly right; one storage yamlView mismatch, one stale `Configuration:` placeholder. |
| Example density | 3 | The only end-to-end example is RabbitMQ. Zero pure-HTTP examples. |
| Confidence | 4 | Would not bet this runs first try — Storage block + per-session Assertions placement are risky. |

## 8. Self-critique — 3 docs fixes

1. **Add a "Hello-world HTTP test" quickstart** next to `writeTestYaml.md`: one Transaction with `Http:`, `HttpStatus` assertion, FileSystem storage, `act` then `assert`. The `httpbin.org/status/200` example would have saved every gap above.
2. **End-to-end replay recipe** at `userInterfaces/runner/commands/assert.md`: show the exact YAML (`Storages:` + `SaveData: true`) and CLI pair that makes `assert` replay `act`'s output. Right now those concepts live in 3 unlinked pages.
3. **Fix `storages/configurations/yamlView.md`.** Remove the dangling empty `Configuration:` line, show a real working `Storages[]` entry (`- FileSystem: { Path: ./qaas-storage }`), and link it from `act.md` and `assert.md`.

Bonus: HttpStatus `tableView.md` should clarify whether `OutputNames` refers to Consumers, Transactions, Probes, or all of the above, with one concrete example each.
