# OsRestartPods Configurations Table View

| Property Path | Type | Required | Default | Description |
| ------------- | ---- | -------- | ------- | ----------- |
| `ProbeConfiguration` | `object or string` | &#10006 |  |  |
| `ProbeConfiguration.IntervalBetweenDesiredStateChecksMs` | `integer or string` | &#10006 | 1000 | The interval in milliseconds between every check of the pod's state (if they are ready yet) |
| `ProbeConfiguration.TimeoutWaitForDesiredStateSeconds` | `integer or string` | &#10006 | 300 | Timeout in seconds for waiting for replacement pods to become ready; when reached, the probe throws `TimeoutException`. |
| `ProbeConfiguration.UseGlobalDict` | `string or true/false` | &#10006 | False | Accepted from the shared OpenShift configuration shape, but this probe does not currently read or write probe-global-dictionary aliases. |
| `ProbeConfiguration.ApplicationLabels` | `list or string` | &#10004 |  | A list of the k8s labels of the pods to execute the command in, for example: app=test |
| `ProbeConfiguration.ApplicationLabels[]` | `string` | &#10006 |  |  |
| `ProbeConfiguration.Openshift` | `object or string` | &#10004 |  | The openshift environment to perform action in |
| `ProbeConfiguration.Openshift.Cluster` | `string` | &#10004 |  | The openshift cluster api |
| `ProbeConfiguration.Openshift.Namespace` | `string` | &#10004 |  | The openshift namespace the application is at |
| `ProbeConfiguration.Openshift.Password` | `string` | &#10004 |  | Password of the username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.Username` | `string` | &#10004 |  | Username with access to the openshift namespace and application |
| `ProbeConfiguration.Openshift.AllowInvalidServerCertificates` | `string or true/false` | &#10006 | True | Allow invalid TLS certificates when connecting to the OpenShift API. Defaults to true to preserve the historical OpenShift probe behavior for local and self-signed clusters unless callers explicitly opt into strict validation. |
