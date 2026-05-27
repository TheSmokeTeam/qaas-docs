# FromDataSources Configurations Table View

> TL;DR: Field-by-field reference for FromDataSources GeneratorConfiguration keys, types, defaults and descriptions, generated from generators.schema.json.

| Property Path                  | Type                        | Required | Default | Description                                                                                                                                                                                                                 |
| ------------------------------ | --------------------------- | -------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `GeneratorConfiguration`       | `object or string`          | ✖        |         | Supports generating data from multiple DataSources that contain data. `DataSources`: Used. `SessionData`: Passed to used DataSources.                                                                                       |
| `GeneratorConfiguration.Count` | `integer or string or null` | ✖        |         | The number of items to generate out of the given data sources (If count is bigger than available number of items an exception will be thrown), if no value is given generates the number of items in the given data sources |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
