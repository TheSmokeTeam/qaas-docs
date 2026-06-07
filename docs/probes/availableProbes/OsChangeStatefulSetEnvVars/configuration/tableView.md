---
id: probes.available.oschangestatefulsetenvvars.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsChangeStatefulSetEnvVars, configuration, reference]
summary: "Field-by-field reference for OsChangeStatefulSetEnvVars ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# OsChangeStatefulSetEnvVars Configurations Table View

> TL;DR — Use this generated field table to check property paths, types, required status, defaults, and descriptions.

## When to use {: #when-to-use}

Use this page when you need the exact field path or value type for a hook configuration before editing YAML.

## YAML configuration {: #yaml-configuration}

The table below mirrors the schema used by the YAML scaffold page. Nested rows use dotted paths and `[]` for list items.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.ReplicaSetName` | `string` | &#10004 |  | Legacy property name; supply the target Deployment or StatefulSet name for OpenShift update probes. |
| `ProbeConfiguration.ContainerEnvVarsToUpdate` | `object or string or null` | &#10006 |  | Optional exact environment snapshot keyed by container name. When present, the probe restores each listed container to the provided environment instead of applying the broad update/remove rules. |
| `ProbeConfiguration.ContainerName` | `string or null` | &#10006 |  | The name of the container we would like to update, if not given - the probe will update all of the pod's containers |
| `ProbeConfiguration.EnvVarsToUpdate` | `object or string` | &#10006 |  | The environment variables to update/add |
| `ProbeConfiguration.IntervalBetweenDesiredStateChecksMs` | `integer or string` | &#10006 | `1000` | Interval in milliseconds between desired-state checks. |
| `ProbeConfiguration.TimeoutWaitForDesiredStateSeconds` | `integer or string` | &#10006 | `300` | Timeout in seconds for waiting for the workload to reach the desired state; when reached, the probe throws TimeoutException. |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | `False` | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.EnvVarsToRemove` | `list or string` | &#10006 |  | The environment variables to remove |
| `ProbeConfiguration.EnvVarsToRemove[]` | `string` | &#10006 |  |  |
| `ProbeConfiguration.Openshift` | `object or string` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `string` | &#10004 |  | The openshift cluster api |
| `ProbeConfiguration.Openshift.Namespace` | `string` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.Openshift.Password` | `string` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Username` | `string` | &#10004 |  | Username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.AllowInvalidServerCertificates` | `string or true/false` | &#10006 | `True` | Allow invalid TLS certificates when connecting to the OpenShift API. Defaults to true to preserve the historical OpenShift probe behavior for local and self-signed clusters unless callers explicitly opt into strict validation. |

## Edge cases {: #edge-cases}

- Empty default cells mean the schema does not define a default value for that field.
- Required status applies to the immediate parent object shown by the property path.

## See also {: #see-also}

- [YAML scaffold](yamlView.md)
- [Overview](../overview.md)
