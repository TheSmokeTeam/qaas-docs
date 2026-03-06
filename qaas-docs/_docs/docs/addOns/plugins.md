# Plugins

QaaS plugins are .NET packages that provide reusable hooks. A plugin participates in the ecosystem by implementing hook types from `QaaS.Framework.SDK`, then letting the runner or mocker discover those hook classes by name.

## Shared Plugin Packages

The main shared plugin packages are:

- `QaaS.Common.Generators` for data generation and composition
- `QaaS.Common.Assertions` for common pass/fail checks
- `QaaS.Common.Probes` for setup, cleanup, and environment manipulation
- `QaaS.Common.Processors` for mocker transaction processors

In day-to-day runner work:

- generators are used by `DataSources`
- probes are used inside `Sessions`
- assertions validate session output after execution

Processors belong to the mocker side of the ecosystem and are documented in the `QaaS.Mocker` and `QaaS.Common.Processors` docs packages.

## Plugin System Architecture

At runtime, the runner or mocker loads assemblies, discovers hook implementations by name, validates their configuration, and then wires them into the active execution. That is why plugin hook names must stay stable and why package versions should stay compatible with the framework version used by the host project.
