---
id: probes.available.osupdatedeploymentresources.configuration.tableview
type: reference
status: stable
since: 2.0.0
last_verified: 2026-05-22
applies_to: [probes]
keywords: [probes, OsUpdateDeploymentResources, configuration, reference]
summary: "Field-by-field reference for OsUpdateDeploymentResources ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json."
---
<!-- Verified-against: QaaS.JsonSchemaExtensions/generated-schemas/probes.schema.json -->

# OsUpdateDeploymentResources Configurations Table View

> TL;DR: Field-by-field reference for OsUpdateDeploymentResources ProbeConfiguration keys, types, defaults and descriptions, generated from probes.schema.json.

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.ContainerName` | `string` | &#10004 |  | The name of the container to update |
| `ProbeConfiguration.ReplicaSetName` | `string` | &#10004 |  | Legacy property name; supply the target Deployment or StatefulSet name for OpenShift update probes. |
| `ProbeConfiguration.IntervalBetweenDesiredStateChecksMs` | `integer or string` | &#10006 | 1000 | Interval in milliseconds between desired-state checks. |
| `ProbeConfiguration.TimeoutWaitForDesiredStateSeconds` | `integer or string` | &#10006 | 300 | Timeout in seconds for waiting for the workload to reach the desired state; when reached, the probe throws TimeoutException. |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | When true, missing probe configuration keys may be resolved from the shared global dictionary before local YAML/code values are applied. |
| `ProbeConfiguration.Openshift` | `object or string` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `string` | &#10004 |  | The openshift cluster api |
| `ProbeConfiguration.Openshift.Namespace` | `string` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.Openshift.Password` | `string` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Username` | `string` | &#10004 |  | Username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.AllowInvalidServerCertificates` | `string or true/false` | &#10006 | True | Allow invalid TLS certificates when connecting to the OpenShift API. Defaults to true to preserve the historical OpenShift probe behavior for local and self-signed clusters unless callers explicitly opt into strict validation. |
| `ProbeConfiguration.DesiredResources` | `object or string` | &#10006 |  | Desired target workload container requests and limits. Only cpu and memory are rebuilt by the implementation. |
| `ProbeConfiguration.DesiredResources.Limits` | `object or string` | &#10006 |  | Desired CPU and memory limits. |
| `ProbeConfiguration.DesiredResources.Limits.Cpu` | `string or null` | &#10006 |  | Desired CPU value. |
| `ProbeConfiguration.DesiredResources.Limits.Memory` | `string or null` | &#10006 |  | Desired memory value. |
| `ProbeConfiguration.DesiredResources.Requests` | `object or string` | &#10006 |  | Desired CPU and memory requests. |
| `ProbeConfiguration.DesiredResources.Requests.Cpu` | `string or null` | &#10006 |  | Desired CPU value. |
| `ProbeConfiguration.DesiredResources.Requests.Memory` | `string or null` | &#10006 |  | Desired memory value. |

## See also

Use the surrounding documentation navigation to move between related generated reference pages.
