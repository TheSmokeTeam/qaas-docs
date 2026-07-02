# OsEditYamlConfigMap Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                                                 | Type                   | Required | Default         | Description                                                                                                                                                                                                                        |
| ------------------------------------------------------------- | ---------------------- | -------- | --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                                          | `object or string`     | ✖        |                 |                                                                                                                                                                                                                                    |
| `ProbeConfiguration.ConfigMapName`                            | `string`               | ✔        |                 | The config map to edit                                                                                                                                                                                                             |
| `ProbeConfiguration.ConfigMapYamlFileName`                    | `string`               | ✖        | `ConfigMap.yml` | The name of the yaml file inside the config map data                                                                                                                                                                               |
| `ProbeConfiguration.UseGlobalDict`                            | `string or true/false` | ✖        | `False`         | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied.                                                                                           |
| `ProbeConfiguration.ValuesToEdit`                             | `object or string`     | ✖        |                 | The description of the configmap paths and values to change (in JSONPath format). For example:path.to.yaml.value\[0\]: new value                                                                                                   |
| `ProbeConfiguration.Openshift`                                | `object or string`     | ✔        |                 | The openshift environment to perform action in                                                                                                                                                                                     |
| `ProbeConfiguration.Openshift.Cluster`                        | `string`               | ✔        |                 | The openshift cluster api                                                                                                                                                                                                          |
| `ProbeConfiguration.Openshift.Namespace`                      | `string`               | ✔        |                 | The openshift namespace the application is at                                                                                                                                                                                      |
| `ProbeConfiguration.Openshift.Password`                       | `string`               | ✔        |                 | Password of the username with access to the openshift namespace and application                                                                                                                                                    |
| `ProbeConfiguration.Openshift.Username`                       | `string`               | ✔        |                 | Username with access to the openshift namespace and application                                                                                                                                                                    |
| `ProbeConfiguration.Openshift.AllowInvalidServerCertificates` | `string or true/false` | ✖        | `True`          | Allow invalid TLS certificates when connecting to the OpenShift API. Defaults to true to preserve the historical OpenShift probe behavior for local and self-signed clusters unless callers explicitly opt into strict validation. |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/OsEditYamlConfigMap/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/OsEditYamlConfigMap/overview/index.md)
