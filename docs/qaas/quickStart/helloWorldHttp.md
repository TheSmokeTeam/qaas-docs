---
id: qaas.quickstart.helloworldhttp
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner, mocker]
keywords: [qaas, quickstart, hello-world, http, act, assert, replay]
summary: "Smallest end-to-end QaaS recipe: a runner test against a mocker stub that returns HTTP 200 on /hello, with act/assert replay for fast iteration."
---
# Hello-World HTTP Test

The smallest end-to-end QaaS scenario: a Runner test that calls an HTTP endpoint exposed by a Mocker stub. Useful as a smoke check and as the seed for the [`act`](../userInterfaces/runner/commands/act.md) / [`assert`](../userInterfaces/runner/commands/assert.md) replay workflow.

## TL;DR

> Two YAML files (`hello.qaas.yaml`, `hello.mocker.yaml`), no custom code, three commands: start the mocker, run the test, replay the assertions against captured data.

## When to use

- You want a working baseline before introducing custom assertions, generators, or processors.
- You want a minimal repro to attach to a bug report.
- You want a small target to demonstrate the [`act`](../userInterfaces/runner/commands/act.md) / [`assert`](../userInterfaces/runner/commands/assert.md) split.

## Prerequisites

- .NET SDK 10 installed.
- Two checked-out projects: a Runner host and a Mocker host (see [Installation](installation.md)).

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
  Environment: local

Storages:
  - Name: LocalSessions
    StorageConfiguration:
      Type: Local
      Path: ./session-data

Sessions:
  - Name: HelloSession
    Publishers:
      - Name: CallHello
        Publisher: HttpPublisher
        PublisherConfiguration:
          Uri: http://127.0.0.1:8080/hello
          Method: Get
    Consumers:
      - Name: HelloResponse
        Consumer: HttpConsumer
        ConsumerConfiguration:
          PublisherName: CallHello

Assertions:
  - Name: ReturnedOk
    Assertion: HttpStatus
    SessionNames: [HelloSession]
    AssertionConfiguration:
      OutputName: HelloResponse
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
# 1. Capture once: run the publisher and consumer, persist session data under ./session-data.
dotnet run --project Runner -- act hello.qaas.yaml

# 2. Replay the assertions against captured data. No HTTP call is made.
dotnet run --project Runner -- assert hello.qaas.yaml
```

Repeat step 2 as you iterate on assertion configuration; step 1 only needs to re-run when the publisher, consumer, or system-under-test changes. See [Debug test failure](debugTestFailure.md) for how to interpret a passing-`act` / failing-`assert` outcome.

## Edge cases

- The mocker must be running before `act` or `run`; the publisher does not wait for readiness on its own. Add a [`Probe`](../userInterfaces/runner/configurationSections/sessions/types/probes.md) (`PingProbe` against `/hello`) at stage `0` if your launch order is flaky.
- `StorageConfiguration.Path` is relative to the runner's working directory at the time of `act`. `assert` must run from the same working directory or the captured data will not be found.
- `OutputName` on the assertion matches the consumer's `Name`, not the publisher's.

## See also

- [Run a test](runTest.md)
- [Debug test failure](debugTestFailure.md)
- [`act` command](../userInterfaces/runner/commands/act.md)
- [`assert` command](../userInterfaces/runner/commands/assert.md)
- [Storages overview](../userInterfaces/runner/configurationSections/storages/overview.md)
