# Storage

The Storage section contains a external storage lists that qaas inner objects can be stored in or retrieved from when using the `qaas act` or `qaas assert` commands.
Currently only `SessionData` which is an object generated from [Sessions](../sessions/overview.md) and used by [Assertions](../assertions/overview.md) and [DataSources](../dataSources/overview.md) can be stored or retrieved.

## Available Storage Types

### FileSystem

Stores/Retrieves data from a certain path in the file system.

!!! Warning "Storage During Case Run"
        During a case run the storage will store/retrieve the data under a folder named
        after the name of the case its ran under with all of its illegal folder name characters replaced with `_`.
        For example: case `http://subCase/regular.yaml` will store the data under the folder `http___subCase_regular.yaml`

### S3

Stores/Retrieves data from an s3 bucket at a certain prefix.

!!! Warning "Storage During Case Run"
        During a case run the storage will store/retrieve the data under an additional prefix named after
        the name of the case its ran under with all of its `/` or `\` characters replaced with `_` and
        a `/` added to its end.
        For example: case `http://subCase/regular.yaml` will add the prefix `http:__subCase_regular.yaml/` before the case's data.
