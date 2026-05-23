---
id: mocker.authoring-guide.controller-recipe-redis
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [mocker, runner]
keywords: [mocker, controller, redis, runner, mockercommands, recipe]
summary: "End-to-end Runner + Mocker recipe wired through a Redis-backed Controller: readiness probe, channel naming, ack/timeout behavior, and a full MockerCommands block."
---
# Runner + Mocker Controller (Redis) Recipe

> TL;DR — Use the Redis-backed Controller when Runner must coordinate actions against a running Mocker instance.

End-to-end example of a Runner test that drives a Mocker through its [Controller](../userInterfaces/mocker/configurationSections/controller/overview.md). The two hosts communicate over Redis; the Runner issues [Mocker Commands](../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) (swap a stub, trigger an action, consume cached transactions) while the test is running.

## TL;DR {: #tldr}

> Start Redis, start the Mocker with `Controller.Redis` configured, run the test with a [`MockerCommand`](../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) action. Two channel names must match across the YAMLs.

## When to use {: #when-to-use}

- The test needs to change Mocker behavior mid-run (e.g. swap a `200` stub for a `503` stub between two publish phases).
- The test needs to drain cached Mocker transactions through the Runner instead of asserting against the SUT.

## Prerequisites {: #prerequisites}

- A reachable Redis instance (local container is fine).
- Two host projects: one Runner, one Mocker, both able to resolve the Redis host.

## Step 1: Redis {: #step-1-redis}

```bash
docker run --rm -d --name qaas-redis -p 6379:6379 redis:7-alpine
```

## Step 2: Mocker YAML {: #step-2-mocker-yaml}

```yaml
# controller.mocker.yaml
Controller:
  ServerName: HelloMocker
  Redis:
    Host: 127.0.0.1
    Port: 6379

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
  - Name: HelloFail
    Processor: StaticResponseProcessor
    TransactionData:
      MetaData:
        Http:
          StatusCode: 503
      Body: "unavailable"
```

`Controller.ServerName` is the channel root the Runner addresses. It must match the `MockerCommands[].ServerName` value used on the Runner side (step 3). If `Controller` is omitted or `Redis` is unreachable, the servers still start but no Mocker Commands will route — this is a frequent silent-fail mode.

## Step 3: Runner YAML {: #step-3-runner-yaml}

```yaml
# controller.qaas.yaml
MetaData:
  Team: Smoke
  System: HelloMocker

Sessions:
  - Name: ControlSession
    Probes:
      - Name: WaitForMocker
        Probe: PingProbe
        ProbeConfiguration:
          Url: http://127.0.0.1:8080/hello
        Stage: 0
    Transactions:
      - Name: CallHelloOk
        Stage: 1
        TimeoutMs: 5000
        Http:
          BaseAddress: http://127.0.0.1
          Port: 8080
          Route: /hello
          Method: Get
      - Name: CallHelloAfterSwap
        Stage: 3
        TimeoutMs: 5000
        Http:
          BaseAddress: http://127.0.0.1
          Port: 8080
          Route: /hello
          Method: Get
    MockerCommands:
      - Name: SwapToFailure
        ServerName: HelloMocker
        Stage: 2
        Redis:
          Host: 127.0.0.1:6379
        Command:
          ChangeActionStub:
            ActionName: HelloOk
            StubName: HelloFail
      - Name: ReadCachedTransactions
        ServerName: HelloMocker
        Stage: 4
        Redis:
          Host: 127.0.0.1:6379
        Command:
          Consume:
            TimeoutMs: 5000
            ActionName: HelloOk

Assertions:
  - Name: FirstCallOk
    Assertion: HttpStatus
    SessionNames: [ControlSession]
    AssertionConfiguration:
      OutputName: CallHelloOk
      ExpectedStatus: 200
  - Name: SecondCallFailed
    Assertion: HttpStatus
    SessionNames: [ControlSession]
    AssertionConfiguration:
      OutputName: CallHelloAfterSwap
      ExpectedStatus: 503
```

## Step 4: Run {: #step-4-run}

```bash
dotnet run --project Mocker -- run controller.mocker.yaml &
dotnet run --project Runner -- run controller.qaas.yaml
```

Expected ordering inside `ControlSession`:

1. `WaitForMocker` (stage `0`) confirms the Mocker is reachable.
2. `CallHelloOk` calls `/hello` and receives `200`.
3. `SwapToFailure` (stage `2`) sends a `ChangeActionStub` command through Redis. The Mocker rebinds `HelloOk` to `HelloFail`.
4. `CallHelloAfterSwap` calls `/hello` and receives `503`.
5. `ReadCachedTransactions` drains cached transactions for `HelloOk`.

## Channel naming {: #channel-naming}

The Runner-side `MockerCommands[].ServerName` and Mocker-side `Controller.ServerName` must be byte-for-byte identical. The Mocker logs the active channel name at INFO when it boots:

```text
[INFO] Controller channel ready: HelloMocker
```

If you do not see that line, the controller did not start — usually because `Controller.Redis.Host` is unreachable or the `Controller` block is missing entirely.

## Acknowledgement and timeout behavior {: #acknowledgement-and-timeout-behavior}

- The Runner publishes the command and waits for a Mocker acknowledgement on the same Redis channel.
- If the Mocker is not subscribed (wrong channel name, Redis down, controller block omitted), the Mocker Command fails the session with a timeout error rather than hanging forever.
- `MockerCommands[].RequestDurationMs` bounds a single command. The session timeout still applies on top.

## Edge cases {: #edge-cases}

- The probe in stage `0` is required; without it, the first publisher can race ahead of Mocker readiness and read a connection refusal.
- `ChangeActionStub` is idempotent — issuing the same swap twice is a no-op. `Consume` is destructive — the cache empties after the first consumption.
- The `ServerName` on a `MockerCommand` must match `Controller.ServerName` in the Mocker YAML. A typo there fails when the command cannot be acknowledged.
- `Controller.Redis` with `Host: 127.0.0.1` inside a containerized Mocker addresses the container itself. Use `host.docker.internal` or a shared docker network.

## See also {: #see-also}

- [Controller overview](../userInterfaces/mocker/configurationSections/controller/overview.md)
- [Mocker Commands (Runner side)](../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md)
- [Multi-server routing](multi-server-routing.md)
- [Stages — Canonical Recipes](../../qaas/advancedConcepts/stages.md#canonical-recipes)
- [Hello-World HTTP](../../qaas/quickStart/helloWorldHttp.md)
