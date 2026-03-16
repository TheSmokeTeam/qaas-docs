# QaaS Mocker

**QaaS.Mocker** is the mock runtime used alongside [QaaS.Runner](../qaas/index.md) tests. The current implementation can start HTTP/HTTPS, gRPC/gRPCs, and socket servers from YAML or from code.

| | |
|---|---|
| **Runtime** | .NET 10 |
| **Package** | `QaaS.Mocker` |
| **Source** | [GitHub - QaaS.Mocker]({{ links.github_mocker }}) |
| **Configuration file** | `mocker.qaas.yaml` |

## Current Capabilities

- Start one server with `Server` or multiple servers concurrently with `Servers`.
- Run in `run`, `lint`, or `template` mode.
- Build stubs from `ITransactionProcessor` hooks and optional data sources.
- Start an optional Redis-backed controller for Runner mocker commands.
- Build the same runtime graph programmatically with `ExecutionBuilder`.

## How It Starts

1. Load `mocker.qaas.yaml`.
2. Apply overwrite files, overwrite arguments, and configuration-like environment variables unless `--no-env` is used.
3. Build data sources, transaction stubs, one or more servers, and the optional controller.
4. Start the selected execution mode:
   - `run` starts the server runtime and, when configured, the controller runtime
   - `lint` validates configuration and builds the runtime graph without starting listeners
   - `template` prints the effective configuration or writes it to the requested output folder

## Quick Start

1. [Installation](quickStart/installation.md)
2. [Create a Mock](quickStart/createMock.md)
3. [Deploy a Mock](quickStart/deployMock.md)
4. [Integrate with Runner Tests](quickStart/integrateWithTests.md)

## Advanced Concepts

- [Configuration as Code](advancedConcepts/configurationAsCode.md)
