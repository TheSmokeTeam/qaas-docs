# Storages Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a configuration section before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                         | Type                        | Required | Default | Description                                                                                                                                                                                                                       |
| ------------------------------------- | --------------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Storages`                            | `list or string or null`    | ✖        |         | External storages qaas inner objects can be stored in or retrieved from when using the `qaas act` (to create and store) or `qaas assert` (to retrieve and use) commands                                                           |
| `Storages[]`                          | `object or string`          | ✖        |         |                                                                                                                                                                                                                                   |
| `Storages[].Configuration`            | `object or string`          | ✖        |         |                                                                                                                                                                                                                                   |
| `Storages[].JsonStorageFormat`        | `one of [Indented / None]`  | ✖        |         | The storage format used when storing jsons. Options: \[`Indented` - Formats the json with indents, more readable but less memory efficient /`None` - Formats the json without indents, less readable but more memory efficient \] |
| `Storages[].FileSystem`               | `object or string`          | ✖        |         | Supports storage as a file system directory                                                                                                                                                                                       |
| `Storages[].FileSystem.Path`          | `string`                    | ✔        |         | The path of the directory containing the relevant files                                                                                                                                                                           |
| `Storages[].FileSystem.SearchPattern` | `string`                    | ✖        |         | The search string to match against the names of files in path. This parameter can contain a combination of valid literal path and wildcard (\* and ?) characters, but it doesn't support regular expressions.                     |
| `Storages[].S3`                       | `object or string`          | ✖        |         | Supports storage as an S3 bucket with a certain prefix                                                                                                                                                                            |
| `Storages[].S3.AccessKey`             | `string`                    | ✔        |         | S3 account access key                                                                                                                                                                                                             |
| `Storages[].S3.SecretKey`             | `string`                    | ✔        |         | S3 account secret access key                                                                                                                                                                                                      |
| `Storages[].S3.ServiceURL`            | `string`                    | ✔        |         | S3 service url                                                                                                                                                                                                                    |
| `Storages[].S3.StorageBucket`         | `string`                    | ✔        |         | Name of S3 bucket                                                                                                                                                                                                                 |
| `Storages[].S3.Delimiter`             | `string`                    | ✖        |         | The delimiter of the relevant objects in the s3 bucket                                                                                                                                                                            |
| `Storages[].S3.ForcePathStyle`        | `string or true/false`      | ✖        | True    | When true, requests will always use path style addressing                                                                                                                                                                         |
| `Storages[].S3.MaximumRetryCount`     | `integer or string or null` | ✖        |         | The maximum number of times to retry when an action against the S3 fails due to maximum S3 supported IOPS, if no value is given will retry indefinitely                                                                           |
| `Storages[].S3.Prefix`                | `string`                    | ✖        |         | The prefix of the relevant objects in the s3 bucket                                                                                                                                                                               |
| `Storages[].S3.SkipEmptyObjects`      | `string or true/false`      | ✖        | True    | Whether to skip the retrieval of empty s3 objects or not, if true skips them if false doesnt skip them                                                                                                                            |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/storages/configurations/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/storages/overview/index.md)
