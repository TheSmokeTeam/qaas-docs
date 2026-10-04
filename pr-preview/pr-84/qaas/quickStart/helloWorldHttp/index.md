# Hello-World HTTP Test

> TL;DR — Build a smallest end-to-end Runner plus Mocker HTTP smoke test that returns HTTP 200 on `/hello`.

The smallest end-to-end QaaS scenario: a Runner test that calls an HTTP endpoint exposed by a Mocker stub. Useful as a smoke check and as the seed for the [`act`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/act/index.md) / [`assert`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/assert/index.md) replay workflow.

## TL;DR

> Two YAML files (`hello.qaas.yaml`, `hello.mocker.yaml`), no custom code, three commands: start the mocker, run the test, replay the assertions against captured data.

## When to use

- You want a working baseline before introducing custom assertions, generators, or processors.
- You want a minimal repro to attach to a bug report.
- You want a small target to demonstrate the [`act`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/act/index.md) / [`assert`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/assert/index.md) split.

## Prerequisites

- .NET SDK 10 installed.
- Two checked-out projects: a Runner host and a Mocker host (see [Installation](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/installation/index.md)).

## Mocker YAML

```yaml
# hello.mocker.yaml
Servers:
  - Http:
      Port: 8080
      Endpoints:
        - Path: /hello
          Actions:
            - Name: HelloOk
              Method: Get
              TransactionStubName: HelloStub

Stubs:
  - Name: HelloStub
    Processor: StaticResponseProcessor
    TransactionData:
      MetaData:
        Http:
          StatusCode: 200
      Body: "hello"
```

Start the mocker:

```bash
dotnet run --project Mocker -- run hello.mocker.yaml
```

## Runner YAML

```yaml
# hello.qaas.yaml
MetaData:
  Team: Smoke
  System: HelloWorld

Storages:
  - Name: LocalSessions
    StorageConfiguration:
      Type: Local
      Path: ./session-data

Sessions:
  - Name: HelloSession
    Transactions:
      - Name: CallHello
        TimeoutMs: 5000
        Http:
          BaseAddress: http://127.0.0.1
          Port: 8080
          Route: /hello
          Method: Get

Assertions:
  - Name: ReturnedOk
    Assertion: HttpStatus
    SessionNames: [HelloSession]
    AssertionConfiguration:
      OutputName: CallHello
      ExpectedStatus: 200
```

## End-to-end run

```bash
dotnet run --project Runner -- run hello.qaas.yaml
```

Expected: exit `0`, one green session, one green assertion in `allure-results/`.

## Act / assert replay

Once the run is green, split the same scenario for fast iteration on assertions:

```bash
# 1. Capture once: run the transaction, persist session data under ./session-data.
dotnet run --project Runner -- act hello.qaas.yaml

# 2. Replay the assertions against captured data. No HTTP call is made.
dotnet run --project Runner -- assert hello.qaas.yaml
```

Repeat step 2 as you iterate on assertion configuration; step 1 only needs to re-run when the transaction or system-under-test changes. See [Debug test failure](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/debugTestFailure/index.md) for how to interpret a passing-`act` / failing-`assert` outcome.

## Edge cases

- The mocker must be running before `act` or `run`; the transaction does not wait for readiness on its own. Add a [`Probe`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/types/probes/index.md) (`PingProbe` against `/hello`) at stage `0` if your launch order is flaky.
- `StorageConfiguration.Path` is relative to the runner's working directory at the time of `act`. `assert` must run from the same working directory or the captured data will not be found.
- `OutputName` on the assertion matches the transaction's `Name`.

## See also

- [Run a test](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/runTest/index.md)
- [Debug test failure](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/debugTestFailure/index.md)
- [`act` command](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/act/index.md)
- [`assert` command](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/assert/index.md)
- [Storages overview](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/storages/overview/index.md)
