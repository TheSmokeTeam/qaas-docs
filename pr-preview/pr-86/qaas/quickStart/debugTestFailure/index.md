# Debug Test Failure

> TL;DR — Use split Runner phases, focused logging, and saved report artifacts to debug failed tests.

## QaaS Logs

QaaS includes a configurable logger that can output logs to the console or to a file. The log level can be adjusted using the `-l` flag, or the entire logging configuration can be overridden using the `-g` flag.

For more information about the logger, refer to the [Logger documentation](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/logger/index.md).

## QaaS Act/Assert Commands

QaaS provides two specialized commands to help debug test failures:

- [`act`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/act/index.md): Runs only the `act` phase of the test, which includes [DataSources](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/dataSources/overview/index.md) and [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md). The output is stored in an external storage location.
- [`assert`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/assert/index.md): Runs only the `assert` phase of the test, which includes [DataSources](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/dataSources/overview/index.md) and [Assertions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/overview/index.md). It retrieves required data from the same external storage.

Both commands use the configuration defined in the [Storages](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/storages/overview/index.md) section to access the external storage.

These commands are particularly useful for:

- Debugging assertion configurations
- Using QaaS solely as a data injector for testing or validation

### Usage Examples

To run only the `act` phase and store output in a specified directory:

```bash
dotnet run -- act test.qaas.yaml -w Variables/...
```

To run only the `assert` phase using previously stored data:

```bash
dotnet run -- assert test.qaas.yaml -w Variables/...
```

This workflow allows you to isolate and inspect each phase of the test independently, making it easier to identify and resolve issues.

## Triage protocol

When `qaas-runner run` exits non-zero, do not re-run blindly. Walk these steps:

1. **Confirm YAML loads.** Run `qaas-runner template test.qaas.yaml`. Fix placeholder or schema errors before continuing.
1. **Confirm publishers fired.** If they did not, a probe or pre-session step failed; check the probe's trace.
1. **Confirm consumers received.** If they did not, suspect channel naming or a system-under-test that is not consuming.
1. **Confirm the assertion ran.** If it did not, configuration validation failed; check `AssertionTrace`.
1. **Classify the failure.** A real failure points to a defect in the system-under-test. A spurious failure points to a wrong test or assertion — split with `act` + `assert`.

## Split with act + assert

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

## High-yield triage commands

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

## Reporter wiring for triage

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

## Common gotchas

1. **`CopyToOutputDirectory` missing on `*.qaas.yaml`** -> runner errors with "config file not found" because it is reading from `bin/Release/net10.0`, not your source tree. Fix the csproj.
1. **Schema cache stale** -> "unknown enum value" right after you added a custom plugin. Re-run the schema generator and clean `bin/`.
1. **Channel naming mismatch** -> publishers fire but consumers time out. Verify the mocker's logged channel name matches what the runner expects.
1. **`RabbitMq.Host: 127.0.0.1` in a containerised runner** -> host is the container itself. Use `host.docker.internal` or join networks.
1. **`ExpectedPercentage: 100` with at-least-once delivery** -> flake. Use `>= 95` or a session-level dedupe consumer.
1. **Custom hook not loaded** -> `Processor: MyThing` rejected as unknown. The runner only discovers types its `AppDomain` already references.
1. **Reporter not writing** -> check `SaveSessionData` / `SaveAttachments` / `DisplayTrace`; defaults are false in some templates.

## Environment differences (laptop vs CI)

| Symptom                    | Likely cause                                                                                |
| -------------------------- | ------------------------------------------------------------------------------------------- |
| Pass local, fail CI        | RabbitMQ readiness — CI's Rabbit is cold. Add a wait-for-ready probe.                       |
| Pass CI, fail local        | NuGet feed difference. Pin versions; restore with `--configfile NuGet.config`.              |
| Hangs forever              | `TimeoutMs` only bounds per-message waits. Add an outer timeout on the runner invocation.   |
| Different assertion result | Non-deterministic test data order. Set `DataArrangeOrder: AsciiAsc` and use named fixtures. |
| Mocker unreachable         | Container networking. Use `--network host` or publish ports + `127.0.0.1` mapping.          |

## See also

- [Run test](https://TheSmokeTeam.github.io/qaas-docs/qaas/quickStart/runTest/index.md)
- [`run` command](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/run/index.md)
- [`act` command](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/act/index.md)
- [`assert` command](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/assert/index.md)
- [Allure Report](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/allureReport/index.md)
