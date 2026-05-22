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

# OsExecuteCommandsInContainers — Configuration (table view)

Generated from `probes.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.Openshift` | `object or string` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `string` | &#10004 |  | The openshift cluster api |
| `ProbeConfiguration.Openshift.Username` | `string` | &#10004 |  | Username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Password` | `string` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Namespace` | `string` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.ApplicationLabels` | `array or string` | &#10004 |  | A list of the k8s labels of the pods to execute the command in, for example: app=test |
| `ProbeConfiguration.Commands` | `array or string` | &#10004 |  | A list of the commands to execute in the chosen containers |
| `ProbeConfiguration.ContainerName` | `null or string` | &#10006 |  | The name of the container to run the commands in in all the found pods, if no name is given runs the command in all pod containers |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
