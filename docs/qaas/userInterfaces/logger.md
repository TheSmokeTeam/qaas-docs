---
id: qaas.userinterfaces.logger
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, logger]
summary: "QaaS uses Serilog for its logging needs."
---
# Logger

> TL;DR — QaaS uses Serilog for its logging needs.

QaaS uses `Serilog` for its logging needs.

## Default logger {: #default-logger}

All QaaS commands by default have a Serilog with the following configuration:

```yaml
Serilog:
  MinimumLevel: Information
  WriteTo:
    - Name: Console
```

## Overwriting the default logger {: #overwriting-the-default-logger}

You can change the logging configuration with any command by using the `-l` or `-g` flags.

* `-l` or `--logger-level`: Changes the minimum log level of the loaded logger (Either the default or the one loaded from the `-g` flag).
* `-g` or `--logger-configuration-file`: Gives a YAML configuration file with Serilog configurations (The `Serilog` section) to use for the logger. It overrides the default logger completely and supports giving a file from the Artifactory.

## JSON console logs (unreleased) {: #json-console-logs}

The following inherited Framework option is **unreleased**. Verify that the installed command help includes it before use. The generated command tables and raw help snapshots describe their captured package versions; they do not establish availability in a newer source build.

| Category | Flag | Inherited | Required | Default | Value Type | Description |
| --- | --- | --- | --- | --- | --- | --- |
| Logging | `--json-logs` | Yes | No | False | `bool` | Write default console events as newline-delimited Serilog JSON. An explicit `--logger-configuration-file` takes precedence. |

The option is inherited by Runner `run`, `act`, `assert`, `template`, and `execute` commands when they consume a Framework package containing it. It preserves the configured log level and does not enable Elastic shipping. To prevent registered Elastic defaults from enabling shipping during a local capture, also specify `--disable-elastic-defaults` and do not enable `--send-logs`. Tests can still access their configured systems.

```bash
dotnet run -- run test.qaas.yaml --json-logs --logger-level Debug --disable-elastic-defaults
```

Each default console event contains JSON fields such as `Timestamp`, `Level`, `MessageTemplate`, `RenderedMessage`, `Properties`, and `Exception` when present. Other console output can remain plain text. Existing logger-configuration files control their own formatter. See [offline failure diagnostics](../quickStart/debugTestFailure.md#offline-package-diagnostics) for the Runner event identifiers, exception evidence, and package inspection procedure.

## See also {: #see-also}

* [QaaS Runner](../index.md)
