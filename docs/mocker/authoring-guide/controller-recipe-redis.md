---
id: mocker.authoring-guide.controller-recipe-redis
type: how-to
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [mocker, runner]
keywords: [mocker, controller, redis, runner, mockercommands, recipe]
summary: "End-to-end Runner + Mocker recipe wired through a Redis-backed Controller: readiness probe, channel naming, ack/timeout behavior, and a full MockerCommands block."
---
# Runner + Mocker Controller (Redis) Recipe

End-to-end example of a Runner test that drives a Mocker through its [Controller](../userInterfaces/mocker/configurationSections/controller/overview.md). The two hosts communicate over Redis; the Runner issues [Mocker Commands](../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) (swap a stub, trigger an action, consume cached transactions) while the test is running.

## TL;DR

> Start Redis, start the Mocker with `Controller.Redis` configured, run the test with a [`MockerCommand`](../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md) action. Two channel names must match across the YAMLs.

## When to use

- The test needs to change Mocker behavior mid-run (e.g. swap a `200` stub for a `503` stub between two publish phases).
- The test needs to drain cached Mocker transactions through the Runner instead of asserting against the SUT.

## Prerequisites

- A reachable Redis instance (local container is fine).
- Two host projects: one Runner, one Mocker, both able to resolve the Redis host.

## Step 1: Redis

```bash
docker run --rm -d --name qaas-redis -p 6379:6379 redis:7-alpine
```

## Step 2: Mocker YAML

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
    TransactionData:
      MetaData:
        Http:
          StatusCode: 200
      Body: "hello"
  - Name: HelloFail
    TransactionData:
      MetaData:
        Http:
          StatusCode: 503
      Body: "unavailable"
```

`Controller.ServerName` is the channel root the Runner addresses. It must match the `ControllerName` used on the Runner side (step 3). If `Controller` is omitted or `Redis` is unreachable, the servers still start but no Mocker Commands will route — this is a frequent silent-fail mode.

## Step 3: Runner YAML

```yaml
# controller.qaas.yaml
MetaData:
  Environment: local

Controllers:
  - Name: HelloMocker          # must match Controller.ServerName above
    ControllerConfiguration:
      Type: Redis
      Host: 127.0.0.1
      Port: 6379

Sessions:
  - Name: ControlSession
    Probes:
      - Name: WaitForMocker
        Probe: PingProbe
        ProbeConfiguration:
          Url: http://127.0.0.1:8080/hello
        StageConfig:
          Stage: 0
    Publishers:
      - Name: CallHelloOk
        Publisher: HttpPublisher
        PublisherConfiguration:
          Uri: http://127.0.0.1:8080/hello
          Method: Get
        StageConfig:
          Stage: 1
    MockerCommands:
      - Name: SwapToFailure
        ControllerName: HelloMocker
        Action: ChangeActionStub
        ActionConfiguration:
          ServerName: HelloMocker
          ActionName: HelloOk
          NewStubName: HelloFail
        StageConfig:
          Stage: 2
    Publishers:
      - Name: CallHelloAfterSwap
        Publisher: HttpPublisher
        PublisherConfiguration:
          Uri: http://127.0.0.1:8080/hello
          Method: Get
        StageConfig:
          Stage: 3
    Consumers:
      - Name: OkResponse
        Consumer: HttpConsumer
        ConsumerConfiguration:
          PublisherName: CallHelloOk
        StageConfig:
          Stage: 1
      - Name: FailResponse
        Consumer: HttpConsumer
        ConsumerConfiguration:
          PublisherName: CallHelloAfterSwap
        StageConfig:
          Stage: 3

Assertions:
  - Name: FirstCallOk
    Assertion: HttpStatus
    SessionNames: [ControlSession]
    AssertionConfiguration:
      OutputName: OkResponse
      ExpectedStatus: 200
  - Name: SecondCallFailed
    Assertion: HttpStatus
    SessionNames: [ControlSession]
    AssertionConfiguration:
      OutputName: FailResponse
      ExpectedStatus: 503
```

## Step 4: Run

```bash
dotnet run --project Mocker -- run controller.mocker.yaml &
dotnet run --project Runner -- run controller.qaas.yaml
```

Expected ordering inside `ControlSession`:

1. `WaitForMocker` (stage `0`) confirms the Mocker is reachable.
2. `CallHelloOk` publishes and `OkResponse` reads `200`.
3. `SwapToFailure` (stage `2`) sends a `ChangeActionStub` command through Redis. The Mocker rebinds `HelloOk` to `HelloFail`.
4. `CallHelloAfterSwap` publishes and `FailResponse` reads `503`.

## Channel naming

The Runner-side `Controllers[].Name` and Mocker-side `Controller.ServerName` must be byte-for-byte identical. The Mocker logs the active channel name at INFO when it boots:

```
[INFO] Controller channel ready: HelloMocker
```

If you do not see that line, the controller did not start — usually because `Controller.Redis.Host` is unreachable or the `Controller` block is missing entirely.

## Acknowledgement and timeout behavior

- The Runner publishes the command and waits for a Mocker acknowledgement on the same Redis channel.
- If the Mocker is not subscribed (wrong channel name, Redis down, controller block omitted), the Mocker Command fails the session with a timeout error rather than hanging forever.
- `MockerCommands[].TimeoutMs` bounds a single command. The session timeout still applies on top.

## Edge cases

- The probe in stage `0` is required; without it, the first publisher can race ahead of Mocker readiness and read a connection refusal.
- `ChangeActionStub` is idempotent — issuing the same swap twice is a no-op. `ConsumeCachedTransactions` is destructive — the cache empties after the first consumption.
- The `ControllerName` on a `MockerCommand` must match an entry in the top-level `Controllers:` list. A typo there fails fast at template time.
- `Controller.Redis` with `Host: 127.0.0.1` inside a containerized Mocker addresses the container itself. Use `host.docker.internal` or a shared docker network.

## See also

- [Controller overview](../userInterfaces/mocker/configurationSections/controller/overview.md)
- [Mocker Commands (Runner side)](../../qaas/userInterfaces/runner/configurationSections/sessions/types/mockerCommands.md)
- [Multi-server routing](multi-server-routing.md)
- [Stages — Canonical Recipes](../../qaas/advancedConcepts/stages.md#canonical-recipes)
- [Hello-World HTTP](../../qaas/quickStart/helloWorldHttp.md)
