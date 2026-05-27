---
id: qaas.userinterfaces.runner.configurationresolutionpriority
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationresolutionpriority]
summary: "This page describes how QaaS.Runner builds the effective configuration for the run, act, assert, and template commands."
---

# Configuration Resolution

This page describes how `QaaS.Runner` builds the effective configuration for the [`run`](commands/run.md), [`act`](commands/act.md), [`assert`](commands/assert.md), and [`template`](commands/template.md) commands.

> TL;DR: Runner layers the base YAML, overwrite files, overwrite folders, cases, command-line overrides, pushed references, environment variables, placeholders, and `<<` merges into one effective configuration.

The Runner builds the effective configuration by layering the inputs below.

## When to use {: #when-to-use}

- You need to predict which YAML value wins when several configuration inputs define the same setting.
- You are choosing between `-w`, `-f`, `-r`, `-p`, cases, and environment variables.
- You want to understand why `--resolve-cases-last` changes case overlay behavior.

## Default Resolution Order {: #default-resolution-order}

By default, Runner builds the final configuration in this order:

1. The base configuration file from the positional argument.
   - It is loaded through `AddYaml(...)`, so it can be a local path or an HTTP/HTTPS URL.
2. Every `-w` / `--with-files` overwrite file, in the exact order you pass them.
3. Every `-f` / `--with-folders` overwrite folder, in the exact order you pass them.
   - Inside each folder, only top-level `.yaml` and `.yml` files are loaded.
   - Those files are applied in deterministic alphabetical order.
4. The case file, when Runner is expanding a `-c` / `--cases` directory.
   - By default the case overlay is applied before overwrite arguments and before pushed references.
5. Every `-r` / `--overwrite-arguments` command-line override, in the exact order you pass them.
6. Every `-p` / `--push-references` reference bundle.
   - Each bundle starts with a replace keyword, followed by one or more YAML files.
   - The reference files in that bundle are loaded in the order you pass them.
   - Runner only injects references into the supported top-level list sections: [DataSources](configurationSections/dataSources/overview.md), [Sessions](configurationSections/sessions/overview.md), [Storages](configurationSections/storages/overview.md), [Assertions](configurationSections/assertions/overview.md), and [Links](configurationSections/links/overview.md).
   - Injection happens only where the replace keyword appears in the target list. If the keyword does not appear in a given list, nothing is added to that list.
   - Paths that represent unique names or references receive the replace keyword as a prefix, based on Runner's built-in unique-id regex list.
7. Environment-variable resolution, unless `--no-env` is set.
8. Placeholder resolution.
   - Supported syntax is `${Path}` and `${Path??default}`.
   - Placeholder resolution is recursive and can replace either scalar values or whole objects.
9. `<<` collapse resolution.
   - After placeholders are resolved, QaaS flattens nested `<<` merge structures into the final configuration tree.

## Supported Reference Keys {: #supported-reference-keys}

Runner currently supports pushed-reference injection into these top-level lists:

| List | Injection Supported |
| ---- | ------------------- |
| `DataSources` | Yes |
| `Sessions` | Yes |
| `Storages` | Yes |
| `Assertions` | Yes |
| `Links` | Yes |

The replace keyword is also prefixed onto specific name and reference paths so injected items do not collide with existing items. These are the currently rewritten paths:

| Path | Why It Is Rewritten |
| ---- | ------------------- |
| `DataSources[].Name` | Keeps injected data source names unique. |
| `DataSources[].DataSourceNames[]` | Updates data source dependencies that point at injected data sources. |
| `Sessions[].Name` | Keeps injected session names unique. |
| `Sessions[].Publishers[].DataSourceNames[]` | Updates publisher data source references. |
| `Sessions[].Transactions[].DataSourceNames[]` | Updates transaction data source references. |
| `Assertions[].Name` | Keeps injected assertion names unique. |
| `Assertions[].SessionNames[]` | Updates assertion session references. |
| `Assertions[].DataSourceNames[]` | Updates assertion data source references. |

Other values inside an injected reference are left as written unless they match one of the paths above.

## What `--resolve-cases-last` Changes {: #what-resolve-cases-last-changes}

`--resolve-cases-last` changes only one part of the pipeline: the case file is no longer applied before overwrite arguments and pushed references.

With `--resolve-cases-last`, the order becomes:

1. Base configuration file
2. Overwrite files
3. Overwrite folders
4. Overwrite arguments
5. Pushed references
6. Case file
7. Environment variables
8. Placeholders
9. `<<` collapse

Use this when the case should override the already-expanded shared configuration instead of being part of the reference-expansion input.

## How Environment Variables Actually Behave {: #how-environment-variables-actually-behave}

When environment-variable resolution is enabled:

- environment variables are layered on top of the merged configuration before placeholder resolution
- the same environment-variable behavior is also applied inside each pushed-reference bundle
- placeholders can therefore resolve from either YAML values or environment variables
- after resolution finishes, QaaS removes environment-only top-level keys that did not exist in the original merged configuration

That last rule matters: environment variables can override existing sections and provide placeholder values, but they do not create brand-new top-level configuration sections in the final result.

???- info "--no-env"
    `--no-env` disables environment-variable resolution both for the main configuration and for pushed-reference bundles.

## Details About Cases {: #details-about-cases}

When `-c` / `--cases` is used, Runner creates one context per case file:

- local case directories are scanned recursively
- remote case directories can also come from an HTTP/Artifactory URL
- the resolved relative case path becomes the `CaseName`
- case-name include and ignore filters are applied after the case list is built

Each selected case goes through the same resolution pipeline above.

## Details About Pushed References {: #details-about-pushed-references}

Pushed references are resolved independently before they are injected into the main configuration:

1. load the reference YAML files in the order given for that replace keyword
2. optionally apply environment variables
3. resolve placeholders inside the reference bundle
4. collapse `<<`
5. inject the resulting list items into the target list at the replace-keyword position

Reference bundles do not perform a second nested reference-expansion pass of their own.

## Code-Only Runner Builds {: #code-only-runner-builds}

Runner normally expects a configuration file. A code-only host can still proceed without one when execution-builder configurators are discovered; Runner logs a warning and continues with the code-based configuration path instead of failing immediately.

## `execute` Is Different {: #execute-is-different}

The `execute` command uses a shorter pipeline:

- load the execute YAML file
- apply environment variables
- resolve placeholders
- bind to `ExecuteConfigurations`

It does not use the case overlay, overwrite-file/folder pipeline, pushed references, or `<<` collapse logic described above.

## See also {: #see-also}

- [Commands overview](commands/commands.md)
- [`run`](commands/run.md)
- [`template`](commands/template.md)
- [Configuration Sections](configurationSections/configurationSections.md)
- [DataSources](configurationSections/dataSources/overview.md)
- [Sessions](configurationSections/sessions/overview.md)
