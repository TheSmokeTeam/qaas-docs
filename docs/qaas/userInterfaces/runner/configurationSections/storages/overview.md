---
id: qaas.userinterfaces.runner.configurationsections.storages.overview
type: explanation
status: stable
since: 2.0.0
last_verified: 2026-05-23
applies_to: [runner]
keywords: [qaas, userinterfaces, runner, configurationsections, storages, overview]
summary: "Storages define where Runner writes and reads persisted runtime objects for act and assert commands."
---
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\docs-manifest.json -->
<!-- Verified-against: QaaS.PackageMirror\schemas\runner-family\latest\schema.json -->

# Storages

> TL;DR — Storages define where Runner writes and reads persisted runtime objects for act and assert commands.

## When to use {: #when-to-use}

The Storages section contains external storage definitions that QaaS runtime objects can be stored in or retrieved from when using the [`qaas act`](../../commands/act.md) or [`qaas assert`](../../commands/assert.md) commands.
Currently, the main stored object is `SessionData`, which is generated from [Sessions](../sessions/overview.md) and then used by [Assertions](../assertions/overview.md) and [DataSources](../dataSources/overview.md).

## YAML configuration {: #yaml-configuration}

Use `Storages[]` for storage entries. Choose the storage type that matches the persistence location, such as `FileSystem` or `S3`.

The complete schema-derived field list is in the [configuration table](configurations/tableView.md). The copy-ready scaffold is in the [YAML scaffold](configurations/yamlView.md).

## Available Storage Types {: #available-storage-types}

### FileSystem {: #filesystem}

Stores or retrieves data from a path in the file system.

!!! Warning "Storage During Case Run"
    During a case run the storage stores or retrieves the data under a folder named after the case it runs under, with all illegal folder name characters replaced with `_`.
    For example, case `http://subCase/regular.yaml` stores the data under the folder `http___subCase_regular.yaml`.

### S3 {: #s3}

Stores or retrieves data from an S3 bucket at a configured prefix.

!!! Warning "Storage During Case Run"
    During a case run the storage stores or retrieves the data under an additional prefix named after the case it runs under, with all `/` or `\` characters replaced with `_` and a trailing `/` added.
    For example, case `http://subCase/regular.yaml` adds the prefix `http:__subCase_regular.yaml/` before the case's data.

## Edge cases {: #edge-cases}

- Case runs add case-specific storage paths so case data does not collide.
- Keep `SessionData` persistence aligned with the later `assert` command that reads it.
- Use the same storage names across act and assert phases when the phases run separately.

## See also {: #see-also}

- [Configuration table](configurations/tableView.md)
- [YAML scaffold](configurations/yamlView.md)
- [`act`](../../commands/act.md)
- [`assert`](../../commands/assert.md)
- [Sessions](../sessions/overview.md)
