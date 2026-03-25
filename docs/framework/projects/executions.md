# QaaS.Framework.Executions

`QaaS.Framework.Executions` is the shared execution-infrastructure package in the Framework solution. It is not the full application layer for Runner or Mocker. Instead, it provides the common runtime base classes, loader behavior, CLI helpers, and logging setup that those higher-level applications build on.

## What this project contains

### Runtime contracts and base types

The minimal execution surface is defined by:

- `IRunner.cs`, which exposes `Run()`
- `BaseExecution.cs`, which holds `Context`, `ExecutionType`, `Start()`, and `Dispose()`
- `BaseExecutionBuilder.cs`, which standardizes how runtime packages build validated execution instances
- `Logics/ILogic.cs`, which currently exposes a single `Run(ExecutionData)` method

This package no longer defines mode-specific logic such as `ShouldRun(ExecutionType)` in `ILogic`. That older shape is not the current interface.

### Loader and logging support

The loader and logging layer lives in:

- `Loaders/BaseLoader.cs`
- `Options/LoggerOptions.cs`
- `ExecutionLogging.cs`

`BaseLoader<TOptions, TRunner>` validates the supplied options, configures logging, and leaves concrete runner creation to the derived loader. `ExecutionLogging.cs` contains the shared default logger setup and the optional Elasticsearch sink integration used by downstream applications.

### Shared CLI helpers

The `CommandLineBuilders` folder contains:

- `ParserBuilder.cs`
- `HelpTextBuilder.cs`

These files centralize the shared command-line parsing rules and help-text formatting used by applications built on this package.

### Compatibility surface

`Constants.cs` still exists as an obsolete compatibility wrapper so downstream consumers can migrate without breaking immediately.

## Current behavior

The current implementation focuses on a narrow but important set of responsibilities:

- `BaseExecutionBuilder<TContext, TExecutionData>` validates the configured `DataSources` and then leaves `BuildDataSources()` and `Build()` to the concrete application layer.
- `BaseExecution` provides the common runtime shape that downstream applications extend with their own start and cleanup behavior.
- `BaseLoader<TOptions, TRunner>` validates options recursively before runner creation.
- The loader can create a console logger or a YAML-configured Serilog pipeline, depending on the provided logging configuration.
- `ExecutionLogging.cs` can enrich logging with an Elasticsearch sink, while also keeping a console-only default logger path available.
- `ParserBuilder.cs` configures case-insensitive parsing behavior for the shared CLI layer.
- `HelpTextBuilder.cs` injects the framework's custom usage-line formatting.

## Main source areas

The most important files in this package are:

- `BaseExecution.cs`
- `BaseExecutionBuilder.cs`
- `IRunner.cs`
- `Logics/ILogic.cs`
- `Loaders/BaseLoader.cs`
- `Options/LoggerOptions.cs`
- `ExecutionLogging.cs`
- `CommandLineBuilders/ParserBuilder.cs`
- `CommandLineBuilders/HelpTextBuilder.cs`
- `Constants.cs`

## Companion tests

`QaaS.Framework.Executions.Tests` validates the shared execution layer without relying on the higher-level applications.

The current test suite covers:

- default logger-option values
- recursive option validation and invalid-configuration failures
- YAML logger-configuration-file support
- parser enum case-insensitivity and invalid-verb behavior
- help-text usage output
- elastic-sink warnings for missing, partial, and invalid connection settings
- default logger initialization
- compatibility constants
- the basic `BaseExecution` and `BaseExecutionBuilder` contract

Representative test files include:

- `ExecutionsBehaviorTests.cs`
- `ExecutionsCoverageEdgeCaseTests.cs`
