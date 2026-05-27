---
id: probes.available.osexecutecommandsincontainers.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsExecuteCommandsInContainers, configuration, reference]
summary: "Field-by-field reference for OsExecuteCommandsInContainers ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# OsExecuteCommandsInContainers Configurations Table View

> TL;DR: Field-by-field reference for OsExecuteCommandsInContainers ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.ContainerName` | `string or null` | &#10006 |  | The name of the container to run the commands in in all the found pods, if no name is given runs the command in all pod containers |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.ApplicationLabels` | `list or string` | &#10004 |  | A list of the k8s labels of the pods to execute the command in, for example: app=test |
| `ProbeConfiguration.ApplicationLabels[]` | `string` | &#10006 |  |  |
| `ProbeConfiguration.Commands` | `list or string` | &#10004 |  | A list of the commands to execute in the chosen containers |
| `ProbeConfiguration.Commands[]` | `string` | &#10006 |  |  |
| `ProbeConfiguration.Openshift` | `object or string` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `string` | &#10004 |  | The openshift cluster api |
| `ProbeConfiguration.Openshift.Namespace` | `string` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.Openshift.Password` | `string` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Username` | `string` | &#10004 |  | Username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.AllowInvalidServerCertificates` | `string or true/false` | &#10006 | True | Allow invalid TLS certificates when connecting to the OpenShift API. Defaults to true to preserve the historical OpenShift probe behavior for local and self-signed clusters unless callers explicitly opt into strict validation. |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
