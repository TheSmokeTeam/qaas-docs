---
id: mocker.userinterfaces.mocker.configurationsections.stubs.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [mocker]
keywords: [mocker, userinterfaces, configurationsections, stubs, overview]
summary: "Stubs map named mock actions to transaction processor hooks and optional data-source inputs."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\mocker-family\latest\schema.json -->
<!-- generated hash:fdb16c586afc sources:mocker-family, Stubs, overview -->

# Stubs

> TL;DR — Stubs map named mock actions to transaction processor hooks and optional data-source inputs.

## When to use {: #when-to-use}

Use `Stubs` when a server action needs a named transaction processor. Each stub has a `Name`, selects a processor through `Processor`, and can pass data-source inputs through `DataSourceNames`.

Server endpoint actions reference stubs by name through their transaction-stub fields.

## YAML configuration {: #yaml-configuration}

Use `Stubs[]` for transaction processor entries. Put processor-specific settings under `ProcessorConfiguration`.

The complete schema-derived field list is in the [configuration table](configurations/tableView.md). The copy-ready scaffold is in the [YAML scaffold](configurations/yamlView.md).

## Edge cases {: #edge-cases}

- `Name` values must stay aligned with server action references.
- `Processor` must match an available transaction processor hook.
- Use `DataSourceNames` only when the selected processor reads generated data-source inputs.

## See also {: #see-also}

- [Configuration table](configurations/tableView.md)
- [YAML scaffold](configurations/yamlView.md)
- [Processors](../../../../../processors/index.md)
- [DataSources](../dataSources/overview.md)
- [Servers](../server/overview.md)
