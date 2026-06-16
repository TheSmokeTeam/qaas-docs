---
id: qaas.quickstart.debugtestfailure
type: tutorial
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner]
keywords: [qaas, quickstart, debugtestfailure]
summary: "Use split Runner phases, focused logging, and saved report artifacts to debug failed tests."
---
# Debug Test Failure

> TL;DR — Use split Runner phases, focused logging, and saved report artifacts to debug failed tests.

## QaaS Logs {: #qaas-logs}

QaaS includes a configurable logger that can output logs to the console or to a file. The log level can be adjusted using the `-l` flag, or the entire logging configuration can be overridden using the `-g` flag.

For more information about the logger, refer to the [Logger documentation](../userInterfaces/logger.md).

## QaaS Act/Assert Commands {: #qaas-actassert-commands}

QaaS provides two specialized commands to help debug test failures:

- [`act`](../userInterfaces/runner/commands/act.md): Runs only the `act` phase of the test, which includes [DataSources](../userInterfaces/runner/configurationSections/dataSources/overview.md) and [Sessions](../userInterfaces/runner/configurationSections/sessions/overview.md). The output is stored in an external storage location.
- [`assert`](../userInterfaces/runner/commands/assert.md): Runs only the `assert` phase of the test, which includes [DataSources](../userInterfaces/runner/configurationSections/dataSources/overview.md) and [Assertions](../userInterfaces/runner/configurationSections/assertions/overview.md). It retrieves required data from the same external storage.

Both commands use the configuration defined in the [Storages](../userInterfaces/runner/configurationSections/storages/overview.md) section to access the external storage.

These commands are particularly useful for:

- Debugging assertion configurations
- Using QaaS solely as a data injector for testing or validation

### Usage Examples {: #usage-examples}

To run only the `act` phase and store output in a specified directory:

```bash
dotnet run -- act test.qaas.yaml -w Variables/...
```

To run only the `assert` phase using previously stored data:

```bash
dotnet run -- assert test.qaas.yaml -w Variables/...
```

This workflow allows you to isolate and inspect each phase of the test independently, making it easier to identify and resolve issues.

## Triage protocol {: #triage-protocol}

When `qaas-runner run` exits non-zero, do not re-run blindly. Walk these steps:

1. **Confirm YAML loads.** Run `qaas-runner template test.qaas.yaml`. Fix placeholder or schema errors before continuing.
2. **Confirm publishers fired.** If they did not, a probe or pre-session step failed; check the probe's trace.
3. **Confirm consumers received.** If they did not, suspect channel naming or a system-under-test that is not consuming.
4. **Confirm the assertion ran.** If it did not, configuration validation failed; check `AssertionTrace`.
5. **Classify the failure.** A real failure points to a defect in the system-under-test. A spurious failure points to a wrong test or assertion — split with `act` + `assert`.

## Split with act + assert {: #split-with-act-assert}

Capture once, replay assertions repeatedly:

```bash
# 1. Capture only — run sessions, save data, skip assertions.
qaas-runner act test.qaas.yaml

# 2. Replay only the assertions against the captured data.
qaas-runner assert test.qaas.yaml
```

Interpretation:

- `act` failed but `assert` would have passed -> infrastructure (broker, system-under-test, mocker).
- `act` succeeded but `assert` failed -> the assertion or its configuration is wrong.
- Both succeed but `run` fails -> an order-of-operation bug (e.g. a probe between act and assert).

## High-yield triage commands {: #high-yield-triage-commands}

```bash
# A. Dump the resolved YAML (post-placeholder substitution).
qaas-runner template test.qaas.yaml > resolved.yaml
diff -u test.qaas.yaml resolved.yaml | less

# B. Crank logging.
qaas-runner run test.qaas.yaml -l Verbose

# C. Open Allure HTML.
qaas-runner run test.qaas.yaml -s allure-results -e

# D. Re-run only failing assertions in a tight loop.
qaas-runner assert test.qaas.yaml
```

## Reporter wiring for triage {: #reporter-wiring-for-triage}

Two reporter knobs matter most. Leave them on in dev and CI:

```yaml
Reporters:
  SaveSessionData: true     # raw payloads under allure-results/attachments
  SaveAttachments: true     # request/response blobs per assertion step
  DisplayTrace: true        # surfaces AssertionTrace in the rendered step
```

With `SaveAttachments: true`, each assertion step in the Allure HTML carries:

- `request-<i>.bin` — what the publisher sent.
- `response-<i>.bin` — what the consumer observed.
- `assertion-trace.txt` — verbatim `AssertionTrace`.
- `assertion-message.txt` — verbatim `AssertionMessage`.

Open these first when an assertion is red.

## Common gotchas {: #common-gotchas}

1. **`CopyToOutputDirectory` missing on `*.qaas.yaml`** -> runner errors with "config file not found" because it is reading from `bin/Release/net10.0`, not your source tree. Fix the csproj.
2. **Schema cache stale** -> "unknown enum value" right after you added a custom plugin. Re-run the schema generator and clean `bin/`.
3. **Channel naming mismatch** -> publishers fire but consumers time out. Verify the mocker's logged channel name matches what the runner expects.
4. **`RabbitMq.Host: 127.0.0.1` in a containerised runner** -> host is the container itself. Use `host.docker.internal` or join networks.
5. **`ExpectedPercentage: 100` with at-least-once delivery** -> flake. Use `>= 95` or a session-level dedupe consumer.
6. **Custom hook not loaded** -> `Processor: MyThing` rejected as unknown. The runner only discovers types its `AppDomain` already references.
7. **Reporter not writing** -> check `SaveSessionData` / `SaveAttachments` / `DisplayTrace`; defaults are false in some templates.

## Environment differences (laptop vs CI) {: #environment-differences-laptop-vs-ci}

| Symptom | Likely cause |
|---|---|
| Pass local, fail CI | RabbitMQ readiness — CI's Rabbit is cold. Add a wait-for-ready probe. |
| Pass CI, fail local | NuGet feed difference. Pin versions; restore with `--configfile NuGet.config`. |
| Hangs forever | `TimeoutMs` only bounds per-message waits. Add an outer timeout on the runner invocation. |
| Different assertion result | Non-deterministic test data order. Set `DataArrangeOrder: AsciiAsc` and use named fixtures. |
| Mocker unreachable | Container networking. Use `--network host` or publish ports + `127.0.0.1` mapping. |

## See also {: #see-also}

- [Run test](runTest.md)
- [`run` command](../userInterfaces/runner/commands/run.md)
- [`act` command](../userInterfaces/runner/commands/act.md)
- [`assert` command](../userInterfaces/runner/commands/assert.md)
- [Allure Report](../userInterfaces/runner/allureReport.md)
