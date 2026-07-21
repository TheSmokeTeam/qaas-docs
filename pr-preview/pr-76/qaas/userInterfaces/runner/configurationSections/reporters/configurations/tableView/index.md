# Reporters Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a configuration section before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                        | Type                           | Required | Default                                                                    | Description                                                                                                                                              |
| ------------------------------------ | ------------------------------ | -------- | -------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `Reporters`                          | `object or string`             | ✖        |                                                                            | The reporters which being used to report the test results. This section is not required, and if not set defualt values will be used.                     |
| `Reporters.DisplayTrace`             | `string or true/false or null` | ✖        |                                                                            | Whether to display the assertion message trace in the assertions results. If not set, each assertion will determine whether to display it.               |
| `Reporters.SaveAttachments`          | `string or true/false or null` | ✖        |                                                                            | Whether to save the attachments belonging to the assertions in the test report. If not set, each assertion will determine whether to save them.          |
| `Reporters.SaveLogs`                 | `string or true/false or null` | ✖        |                                                                            | Whether to save the session logs belonging to the assertions in the test report. If not set, each assertion will determine whether to save them.         |
| `Reporters.SaveSessionData`          | `string or true/false or null` | ✖        |                                                                            | Whether to save the session data belonging to the assertions in the test report. If not set, each assertion will determine whether to save it.           |
| `Reporters.SaveTemplate`             | `string or true/false or null` | ✖        |                                                                            | Whether to save the configuration template belonging to the assertions in the test report. If not set, each assertion will determine whether to save it. |
| `Reporters.ReportPortal`             | `object or string`             | ✖        |                                                                            | ReportPortal configuration to use for this reporter. If not set, the default ReportPortal configuration will be used.                                    |
| `Reporters.ReportPortal.ApiKey`      | `string or null`               | ✖        | Global API key in QaaS.Configuration                                       | ReportPortal API key used for publishing. Defaults to the global API key.                                                                                |
| `Reporters.ReportPortal.Attributes`  | `object or string or null`     | ✖        |                                                                            | Static launch attributes to add to every launch in addition to the default QaaS team/system/session/source attributes.                                   |
| `Reporters.ReportPortal.DebugMode`   | `string or true/false or null` | ✖        | False                                                                      | Whether to create the launch in debug mode.                                                                                                              |
| `Reporters.ReportPortal.Description` | `string or null`               | ✖        | Default QaaS description                                                   | Optional launch description override.                                                                                                                    |
| `Reporters.ReportPortal.Enabled`     | `string or true/false or null` | ✖        | QaaS.Configuration defaults                                                | Whether to enable ReportPortal reporting                                                                                                                 |
| `Reporters.ReportPortal.Endpoint`    | `string or null`               | ✖        | Global URL in QaaS.Configuration                                           | ReportPortal endpoint URI. Accepts either the gateway URL or the API URL and normalizes it to /api/. Defaults to the global API URL.                     |
| `Reporters.ReportPortal.LaunchName`  | `string or null`               | ✖        | Generated according MetaData.Team, MetaData.System and the session occured | Optional launch name override.                                                                                                                           |
| `Reporters.ReportPortal.Project`     | `string or null`               | ✖        | MetaData.Team value                                                        | ReportPortal project where the launch will be published. Default is MetaData.Team value.                                                                 |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/reporters/configurations/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/qaas/userInterfaces/runner/configurationSections/reporters/overview/index.md)
