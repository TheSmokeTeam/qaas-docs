---
id: probes.available.oschangedeploymentenvvars.configuration.tableview
slug: tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
prerequisites: [probes/availableProbes/OsChangeDeploymentEnvVars/overview.md]
code_langs: [yaml]
keywords: [probes, OsChangeDeploymentEnvVars, configuration, reference]
ai_summary: "Field-by-field reference for OsChangeDeploymentEnvVars ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
tags: [probes]
canonical_url: /probes/availableProbes/OsChangeDeploymentEnvVars/configuration/tableView/
# Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json
---

# OsChangeDeploymentEnvVars — Configuration (table view)

Generated from `probes.schema.json`. Every field below is verified against the JSON schema at `QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json`.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.ReplicaSetName` | `string` | &#10004 |  | The name of the replicaset to scale the pods of |
| `ProbeConfiguration.IntervalBetweenDesiredStateChecksMs` | `integer or string` | &#10006 | 1000 | The interval in milliseconds between every check of the replica set's state (if it reached the desired number of pods yet) |
| `ProbeConfiguration.TimeoutWaitForDesiredStateSeconds` | `integer or string` | &#10006 | 300 | The timeout in seconds for waiting for the replicaset to scale to the given number of pods, when timeout is reached an error log is raised and the code continues to run |
| `ProbeConfiguration.Openshift` | `object or string` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `string` | &#10004 |  | The openshift cluster api |
| `ProbeConfiguration.Openshift.Username` | `string` | &#10004 |  | Username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Password` | `string` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Namespace` | `string` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.ContainerName` | `null or string` | &#10006 |  | The name of the container we would like to update, if not given - the probe will update all of the pod's containers |
| `ProbeConfiguration.EnvVarsToUpdate` | `object or string` | &#10006 |  | The environment variables to update/add |
| `ProbeConfiguration.EnvVarsToRemove` | `array or string` | &#10006 |  | The environment variables to remove |

See [yamlView](yamlView.md) for a minimal scaffold and [overview](../overview.md) for a runnable example.
