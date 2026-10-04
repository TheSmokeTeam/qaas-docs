# OsUpdateStatefulSetResources Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path                                                 | Type                   | Required | Default | Description                                                                                                                                                                                                                        |
| ------------------------------------------------------------- | ---------------------- | -------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ProbeConfiguration`                                          | `object or string`     | ✖        |         |                                                                                                                                                                                                                                    |
| `ProbeConfiguration.ContainerName`                            | `string`               | ✔        |         | The name of the container to update                                                                                                                                                                                                |
| `ProbeConfiguration.ReplicaSetName`                           | `string`               | ✔        |         | Legacy property name; supply the target Deployment or StatefulSet name for OpenShift update probes.                                                                                                                                |
| `ProbeConfiguration.IntervalBetweenDesiredStateChecksMs`      | `integer or string`    | ✖        | `1000`  | Interval in milliseconds between desired-state checks.                                                                                                                                                                             |
| `ProbeConfiguration.TimeoutWaitForDesiredStateSeconds`        | `integer or string`    | ✖        | `300`   | Timeout in seconds for waiting for the workload to reach the desired state; when reached, the probe throws TimeoutException.                                                                                                       |
| `ProbeConfiguration.UseGlobalDict`                            | `string or true/false` | ✖        | `False` | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied.                                                                                           |
| `ProbeConfiguration.Openshift`                                | `object or string`     | ✔        |         | The openshift environment to perform action in                                                                                                                                                                                     |
| `ProbeConfiguration.Openshift.Cluster`                        | `string`               | ✔        |         | The openshift cluster api                                                                                                                                                                                                          |
| `ProbeConfiguration.Openshift.Namespace`                      | `string`               | ✔        |         | The openshift namespace the application is at                                                                                                                                                                                      |
| `ProbeConfiguration.Openshift.Password`                       | `string`               | ✔        |         | Password of the username with access to the openshift namespace and application                                                                                                                                                    |
| `ProbeConfiguration.Openshift.Username`                       | `string`               | ✔        |         | Username with access to the openshift namespace and application                                                                                                                                                                    |
| `ProbeConfiguration.Openshift.AllowInvalidServerCertificates` | `string or true/false` | ✖        | `True`  | Allow invalid TLS certificates when connecting to the OpenShift API. Defaults to true to preserve the historical OpenShift probe behavior for local and self-signed clusters unless callers explicitly opt into strict validation. |
| `ProbeConfiguration.DesiredResources`                         | `object or string`     | ✖        |         | Desired target workload container requests and limits. Only cpu and memory are rebuilt by the implementation.                                                                                                                      |
| `ProbeConfiguration.DesiredResources.Limits`                  | `object or string`     | ✖        |         | Desired CPU and memory limits.                                                                                                                                                                                                     |
| `ProbeConfiguration.DesiredResources.Limits.Cpu`              | `string or null`       | ✖        |         | Desired CPU value.                                                                                                                                                                                                                 |
| `ProbeConfiguration.DesiredResources.Limits.Memory`           | `string or null`       | ✖        |         | Desired memory value.                                                                                                                                                                                                              |
| `ProbeConfiguration.DesiredResources.Requests`                | `object or string`     | ✖        |         | Desired CPU and memory requests.                                                                                                                                                                                                   |
| `ProbeConfiguration.DesiredResources.Requests.Cpu`            | `string or null`       | ✖        |         | Desired CPU value.                                                                                                                                                                                                                 |
| `ProbeConfiguration.DesiredResources.Requests.Memory`         | `string or null`       | ✖        |         | Desired memory value.                                                                                                                                                                                                              |

## Edge cases

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also

- [YAML scaffold](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/OsUpdateStatefulSetResources/configuration/yamlView/index.md)
- [Overview](https://TheSmokeTeam.github.io/qaas-docs/probes/availableProbes/OsUpdateStatefulSetResources/overview/index.md)
