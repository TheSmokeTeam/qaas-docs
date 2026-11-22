# ObjectOutputJsonSchema Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                       | Type               | Required | Default | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| ----------------------------------- | ------------------ | -------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `AssertionConfiguration`            | `object or string` | ✖        |         | Checks that all items in a configured output are valid according to atleast one of the json schemas provided from the configured DataSources. Expects the output items to be deserialized to any type of C# object that can be converted to Json. `DataSources`: Used for loading json schemas, all data sources are loaded as json schemas, expects to receive their items serialized. `Session Support`: Only supports a single session assertion. `Supported Json Drafts`: \[ `"$schema": "http://json-schema.org/draft-06/schema#"` / `"$schema": "http://json-schema.org/draft-07/schema#"` / `"$schema": "https://json-schema.org/draft/2019-09/schema"` / `"$schema": "https://json-schema.org/draft/2020-12/schema"` / `"$schema": "https://json-schema.org/draft/next/schema"` \] |
| `AssertionConfiguration.OutputName` | `string`           | ✔        |         | The names of the output who'se items should all be valid according to atleast one of the json schemas provided                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/ObjectOutputJsonSchema/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/assertions/availableAssertions/ObjectOutputJsonSchema/overview/index.md)
