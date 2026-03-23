# Storages

The Storages section contains external storage definitions that QaaS runtime objects can be stored in or retrieved from when using the `qaas act` or `qaas assert` commands.
Currently, the main stored object is `SessionData`, which is generated from [Sessions](../sessions/overview.md) and then used by [Assertions](../assertions/overview.md) and [DataSources](../dataSources/overview.md).

## Available Storage Types

### FileSystem

Stores or retrieves data from a path in the file system.

!!! Warning "Storage During Case Run"
    During a case run the storage stores or retrieves the data under a folder named after the case it runs under, with all illegal folder name characters replaced with `_`.
    For example, case `http://subCase/regular.yaml` stores the data under the folder `http___subCase_regular.yaml`.

### S3

Stores or retrieves data from an S3 bucket at a configured prefix.

!!! Warning "Storage During Case Run"
    During a case run the storage stores or retrieves the data under an additional prefix named after the case it runs under, with all `/` or `\` characters replaced with `_` and a trailing `/` added.
    For example, case `http://subCase/regular.yaml` adds the prefix `http:__subCase_regular.yaml/` before the case's data.
