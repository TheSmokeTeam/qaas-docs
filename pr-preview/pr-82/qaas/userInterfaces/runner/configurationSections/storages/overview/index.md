# Storages

> TL;DR — Storages define where Runner writes and reads persisted runtime objects for act and assert commands.

## When to use

The Storages section contains external storage definitions that QaaS runtime objects can be stored in or retrieved from when using the [`qaas act`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/act/index.md) or [`qaas assert`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/assert/index.md) commands. Currently, the main stored object is `SessionData`, which is generated from [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md) and then used by [Assertions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/assertions/overview/index.md) and [DataSources](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/dataSources/overview/index.md).

## YAML configuration

Use `Storages[]` for storage entries. Choose the storage type that matches the persistence location, such as `FileSystem` or `S3`.

The complete schema-derived field list is in the [configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/storages/configurations/tableView/index.md). The copy-ready scaffold is in the [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/storages/configurations/yamlView/index.md).

## Available Storage Types

### FileSystem

Stores or retrieves data from a path in the file system.

Storage During Case Run

During a case run the storage stores or retrieves the data under a folder named after the case it runs under, with all illegal folder name characters replaced with `_`. For example, case `http://subCase/regular.yaml` stores the data under the folder `http___subCase_regular.yaml`.

### S3

Stores or retrieves data from an S3 bucket at a configured prefix.

Storage During Case Run

During a case run the storage stores or retrieves the data under an additional prefix named after the case it runs under, with all `/` or `\` characters replaced with `_` and a trailing `/` added. For example, case `http://subCase/regular.yaml` adds the prefix `http:__subCase_regular.yaml/` before the case's data.

## Edge cases

- Case runs add case-specific storage paths so case data does not collide.
- Keep `SessionData` persistence aligned with the later `assert` command that reads it.
- Use the same storage names across act and assert phases when the phases run separately.

## See also

- [Configuration table](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/storages/configurations/tableView/index.md)
- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/storages/configurations/yamlView/index.md)
- [`act`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/act/index.md)
- [`assert`](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/commands/assert/index.md)
- [Sessions](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/sessions/overview/index.md)
